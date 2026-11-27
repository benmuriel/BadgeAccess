from django.urls import reverse
from .forms import ParticipantForm
from django.db.models import Prefetch

from home.models.person import Person
from home.models import EventBadgeCategory, Event
from .forms import EventBadgeCategoryForm, EventForm, PartnerForm
from .forms import EventForm, PartnerForm
from home.models import Partner
from django.shortcuts import get_object_or_404
from django.contrib import messages
from django.shortcuts import redirect, render

# Create your views here.
from django.contrib.auth.decorators import login_required
from django.db.models import Q
from django.utils import timezone

STATES = {
    "upcoming": "À venir",
    "ongoing": "En cours",
    "past": "Terminés",
    "all": "Tous",
}


@login_required
def event_home(request):
    now = timezone.now()
    state = request.GET.get("state", "upcoming")
    if state not in STATES:
        state = "upcoming"
    query = request.GET.get("q", "").strip()

    events = Event.objects.all()

    if state == "upcoming":
        events = events.filter(StartDate__gt=now).order_by("StartDate")
    elif state == "ongoing":
        events = events.filter(
            StartDate__lte=now, EndDate__gte=now).order_by("EndDate")
    elif state == "past":
        events = events.filter(EndDate__lt=now).order_by("-StartDate")
    else:
        events = events.order_by("-StartDate")

    if query:
        events = events.filter(Q(Name__icontains=query)
                               | Q(Place__icontains=query))

    return render(
        request,
        "event/home.html",
        {"events": events, "state": state, "states": STATES, "q": query},
    )


LIST_ACTIONS = ("add_partner", "delete_partner",
                "add_category", "delete_category")


@login_required
def event_registration(request, event_id=None):
    event = get_object_or_404(Event, pk=event_id) if event_id else None
    form = EventForm(instance=event)
    partner_form = PartnerForm(event=event)
    category_form = EventBadgeCategoryForm(event=event)

    if request.method == "POST":
        data = request.POST
        back = (
            redirect("event_registration", event_id=event.pk)
            if event
            else redirect("event_registration")
        )

        if event and "add_partner" in data:
            partner_form = PartnerForm(data, event=event)
            if partner_form.is_valid():
                partner_form.save()
                messages.success(request, "Le partenaire a été ajouté.")
                return back

        elif event and "delete_partner" in data:
            delete_id = data.get("delete_partner", "")
            if delete_id.isdigit():
                Partner.objects.filter(pk=delete_id, Event=event).delete()
                messages.success(request, "Le partenaire a été retiré.")
            return back

        elif event and "add_category" in data:
            category_form = EventBadgeCategoryForm(data, event=event)
            if category_form.is_valid():
                category_form.save()
                messages.success(
                    request, "La catégorie de badge a été ajoutée.")
                return back

        elif event and "delete_category" in data:
            delete_id = data.get("delete_category", "")
            if delete_id.isdigit():
                EventBadgeCategory.objects.filter(
                    Event=event, BadgeCategory_id=delete_id
                ).delete()
                messages.success(
                    request, "La catégorie de badge a été retirée.")
            return back

        elif any(action in data for action in LIST_ACTIONS):
            return back  # action sur les listes sans événement enregistré

        else:
            # Enregistrement ou modification de l'événement
            form = EventForm(data, instance=event)
            if form.is_valid():
                is_new = event is None
                event = form.save()
                messages.success(
                    request,
                    "L'événement a été enregistré. Vous pouvez maintenant ajouter "
                    "des partenaires et des catégories de badges."
                    if is_new
                    else "L'événement a été mis à jour.",
                )
                return redirect("event_registration", event_id=event.pk)

    return render(
        request,
        "event/event_registration.html",
        {
            "form": form,
            "partner_form": partner_form,
            "category_form": category_form,
            "event": event,
            "partners": event.partners.all() if event else [],
            "event_categories": (
                event.badge_categories.select_related(
                    "BadgeCategory") if event else []
            ),
        },
    )


@login_required
def event_participants(request, event_id):
    event = get_object_or_404(Event, pk=event_id)

    if request.method == "POST" and "delete_participant" in request.POST:
        delete_id = request.POST.get("delete_participant", "")
        if delete_id.isdigit():
            # Limité aux partenaires de cet événement ; le badge est libéré aussi
            Person.objects.filter(pk=delete_id, Partner__Event=event).update(
                Partner=None, Badge=None
            )
            messages.success(
                request, "Le participant a été retiré du partenaire.")
        return redirect(request.path)

    partners = event.partners.prefetch_related(
        Prefetch(
            "participants",
            queryset=Person.objects.select_related("Badge__BadgeCategory").order_by(
                "FirstName", "LastName"
            ),
        )
    )
    sections = [
        {"partner": partner, "participants": partner.participants.all()}
        for partner in partners
    ]

    return render(
        request,
        "event/event_participants.html",
        {
            "event": event,
            "sections": sections,
            "total_participants": sum(len(s["participants"]) for s in sections),
        },
    )


@login_required
def participant_registration(request, partner_id):
    partner = get_object_or_404(
        Partner.objects.select_related("Event"), pk=partner_id)

    if request.method == "POST":
        form = ParticipantForm(request.POST, partner=partner)
        if form.is_valid():
            person = form.save()
            messages.success(
                request, f"{person} a été enregistré(e) comme participant(e) de « {partner.Name} »."
            )
            url = reverse("event_participants", args=[partner.Event_id])
            return redirect(f"{url}#partner-{partner.pk}")
    else:
        form = ParticipantForm(partner=partner)
    from home.models import BadgeCategory


# dans participant_registration, après avoir récupéré le partenaire :
    categories = [
        link.BadgeCategory
        for link in partner.Event.badge_categories.select_related("BadgeCategory")
    ]
    return render(
        request,
        "event/participant_registration.html",

        {"form": form, "partner": partner,
            "event": partner.Event,
         "categories": categories},
    )


@login_required
def participant_edit(request, person_id):
    person = get_object_or_404(
        Person.objects.select_related("Partner__Event", "Badge"),
        pk=person_id,
        Partner__isnull=False,
    )
    partner = person.Partner
    form = ParticipantForm(request.POST or None,
                           instance=person, partner=partner)

    if request.method == "POST" and form.is_valid():
        form.save()
        messages.success(request, "Le participant a été modifié.")
        url = reverse("event_participants", args=[partner.Event_id])
        return redirect(f"{url}#partner-{partner.pk}")

    categories = [
        link.BadgeCategory
        for link in partner.Event.badge_categories.select_related("BadgeCategory")
    ]
    return render(
        request,
        "event/participant_registration.html",
        {
            "form": form,
            "partner": partner,
            "event": partner.Event,
            "categories": categories,
            "participant": person,
        },
    )
