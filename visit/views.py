from .forms import EndVisitForm
from django.contrib import messages
from .forms import PersonForm, VisitorForm
from django.shortcuts import get_object_or_404, redirect, render
from django.shortcuts import render
from django.utils import timezone

from .models import Visitor
from .forms import PersonForm
from .models import Person, TypePiece

from django.db.models import Q


from django.db.models import Q
from django.shortcuts import render
from django.utils import timezone

from .models import Visitor


def home_page(request):
    now = timezone.now()
    query = request.GET.get("q", "").strip()
    state = request.GET.get("state", "open")
    if state not in ("open", "ended", "all"):
        state = "open"

    visits = Visitor.objects.select_related("Person", "Badge")

    if state == "open":
        visits = visits.filter(Q(EndDate__isnull=True) | Q(EndDate__gte=now))
    elif state == "ended":
        visits = visits.filter(EndDate__lt=now)

    if query:
        condition = Q(Badge__BadgeNumber__icontains=query)

        name_condition = Q()
        for term in query.split():
            name_condition &= (
                Q(Person__FirstName__icontains=term)
                | Q(Person__LastName__icontains=term)
                | Q(Person__ForeName__icontains=term)
            )

        visits = visits.filter(condition | name_condition)

    visits = visits.order_by("-StartDate")

    return render(
        request,
        "home.html",
        {"visits": visits, "now": now, "q": query, "state": state},
    )


def find_person(request):
    numtel = request.GET.get("numtel", "")
    typiece = request.GET.get("typiece", "")
    numpiece = request.GET.get("numpiece", "")
    typepieces = TypePiece.objects.all().order_by("Name")

    # Critères incomplets : on réaffiche le formulaire de recherche
    if not (numtel and numpiece and typiece.isdigit()):
        return render(
            request,
            "find_person.html",
            {"typepieces": typepieces, "numpiece": numpiece, "numtel": numtel},
        )

    # Recherche de la personne avec les critères combinés
    personne = (
        Person.objects.filter(
            PhoneNumber=numtel, TypePiece_id=typiece, NumPiece=numpiece
        )
        .order_by("-Id")
        .first()
    )

    if personne is None:
        # Nouvelle personne : on pré-remplit avec les critères de recherche
        form = PersonForm(
            initial={
                "TypePiece": typiece,
                "NumPiece": numpiece,
                "PhoneNumber": numtel,
            }
        )
        message = "Aucune personne trouvée. Precedez à un nouvel enregistrement."
    else:
        # Personne existante : on pré-remplit avec ses données
        form = PersonForm(instance=personne)
        message = "Personne trouvée."

    return render(
        request,
        "person_register.html",
        {"message": message, "form": form, "person": personne},
    )


def save_person(request):
    if request.method != "POST":
        return render(
            request,
            "person_register.html",
            {"message": "Méthode non autorisée.", "form": PersonForm()},
            status=405,
        )

    person_id = request.POST.get("id", "")
    personne = (
        Person.objects.filter(pk=person_id).first(
        ) if person_id.isdigit() else None
    )
    is_update = personne is not None

    # instance=None -> création, instance=personne -> mise à jour
    form = PersonForm(request.POST, instance=personne)

    if form.is_valid():
        personne = form.save()
        message = (
            "Personne mise à jour avec succès."
            if is_update
            else "Personne enregistrée avec succès."
        )
        form = PersonForm(instance=personne)
    else:
        message = "Veuillez corriger les erreurs ci-dessous."

    return render(
        request,
        "person_register.html",
        {"message": message, "form": form, "person": personne},
    )


def visit_registration(request, person_id):
    person = get_object_or_404(Person, pk=person_id)

    if request.method == "POST":
        form = VisitorForm(request.POST, person=person)
        if form.is_valid():
            visitor = form.save(commit=False)
            visitor.Person = person  # la personne vient de l'URL, pas du formulaire
            visitor.save()
            messages.success(
                request, "La visite a été enregistrée avec succès.")
            return redirect("visit_detail", visit_id=visitor.pk)
    else:
        form = VisitorForm(person=person)

    return render(
        request,
        "visit_registration.html",
        {"form": form, "person": person},
    )


def visit_detail(request, visit_id):
    visit = get_object_or_404(
        Visitor.objects.select_related(
            "Person",
            "Person__TypePiece",
            "Badge",
            "Badge__BadgeCategory",
        ),
        pk=visit_id,
    )

    return render(
        request,
        "visit_detail.html",
        {"visit": visit, "person": visit.Person, "status": visit.status},
    )


def visit_end(request, visit_id):
    visit = get_object_or_404(
        Visitor.objects.select_related("Person", "Badge"),
        pk=visit_id,
    )

    # En GET, le formulaire est validé à vide pour afficher d'éventuelles erreurs
    # (visite déjà terminée, pas encore commencée) avant la confirmation.
    form = EndVisitForm(
        request.POST if request.method == "POST" else {}, instance=visit
    )

    if request.method == "POST" and form.is_valid():
        form.save()
        messages.success(request, "La visite a été terminée avec succès.")
        return redirect("visit_home")

    return render(
        request,
        "visit_end.html",
        {"form": form, "visit": visit, "person": visit.Person, "now": timezone.now()},
    )
