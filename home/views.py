from home.models import Badge
from django.utils import timezone
from .models import Badge
from django.shortcuts import render
from django.contrib import messages
# Create your views here.


def index(request):
    return render(request, 'index.html')


def badge_check(request, badge_number=None):
    # Le numéro vient de l'URL, sinon du champ de recherche (?badge=...)
    number = (badge_number or request.GET.get("badge", "")).strip()

    badge = None
    visitor = None
    in_use = False

    if number:
        badge = (
            Badge.objects.filter(BadgeNumber__iexact=number)
            .order_by("-Id")
            .first()
        )

    if badge is not None:
        visitor = badge.CurrentVisitor
        # Le badge est utilisé si sa dernière visite n'est pas terminée
        in_use = visitor is not None and not visitor.is_ended

    return render(
        request,
        "badge_check.html",
        {
            "number": number,
            "searched": bool(number),
            "badge": badge,
            "visitor": visitor,
            "in_use": in_use,
            "now": timezone.now(),
        },
    )
