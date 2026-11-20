from home.models.visited_person import VisitedPerson
from .forms import PersonForm
from home.models import Person
from django.urls import reverse
from urllib.parse import urlencode
from django.shortcuts import redirect, render
from home.models import Badge, Person, Visitor
from django.db import transaction
from django.contrib import messages
from django.shortcuts import get_object_or_404, redirect, render
from django.utils import timezone
# visit/views.py
from home.models import Badge, Person, TypePiece, Visitor
from .forms import EndVisitForm, PersonForm, VisitorForm, VisitedPersonForm, VisitorForm, VisitValidationForm


from django.contrib.auth.decorators import login_required

from django.db.models import Q


@login_required
def home_page(request):
    now = timezone.now()
    query = request.GET.get("q", "").strip()
    state = request.GET.get("state", "open")
    if state not in ("open", "ended", "all"):
        state = "open"

    visits = (
        Visitor.objects.select_related("Person", "Badge")
        .prefetch_related("visited_persons")
        .filter(StartDate__isnull=False)
        .filter(Q(EndDate__isnull=True) | Q(EndDate__gte=now))
    )

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


def _search_person(numtel, numpiece):
    """
    Retourne la personne dont le téléphone OU le numéro de pièce correspond,
    ou None. Un seul des deux critères suffit.
    """
    condition = Q()
    if numtel:
        condition |= Q(PhoneNumber=numtel)
    if numpiece:
        condition |= Q(NumPiece=numpiece)

    if not condition:
        return None

    return Person.objects.filter(condition).order_by("-Id").first()


def _compact(value):
    """Supprime tous les espaces (début, fin et milieu) d'une saisie."""
    return "".join((value or "").split())


@login_required
def find_person(request):
    numpiece = _compact(request.GET.get("numpiece", ""))
    context = {"numpiece": numpiece}

    # Première visite de la page : formulaire de recherche vide
    if not request.GET:
        return render(request, "find_person.html", context)

    # Le numéro de pièce est obligatoire
    if not numpiece:
        messages.error(
            request, "Le numéro de la pièce d'identité est obligatoire.")
        return render(request, "find_person.html", context)

    personne = Person.objects.filter(NumPiece=numpiece).order_by("-Id").first()

    if personne is not None:
        # La personne existe : on passe à l'enregistrement de la visite
        messages.success(request, f"Personne trouvée : {personne}")
        return redirect("visit_registration", person_id=personne.pk)

    # Personne inconnue : on passe à son enregistrement
    messages.warning(
        request, "Aucune personne trouvée. Procédez à un nouvel enregistrement."
    )
    return redirect(
        f"{reverse('visit_save_person')}?{urlencode({'numpiece': numpiece})}"
    )


def _search_person(numpiece):
    """Retourne la personne ayant ce numéro de pièce, ou None."""
    if not numpiece:
        return None
    return Person.objects.filter(NumPiece=numpiece).order_by("-Id").first()


@login_required
def save_person(request):
    if request.method == "POST":
        person_id = request.POST.get("id", "")
        numpiece = _compact(request.POST.get("NumPiece", ""))

        personne = (
            Person.objects.filter(pk=person_id).first()
            if person_id.isdigit()
            else None
        )
        # Vrai si la personne vient de l'id caché (modification d'une fiche ouverte)
        known_by_id = personne is not None

        # Nouvelle fiche : la personne existe-t-elle déjà (même numéro de pièce) ?
        if personne is None:
            personne = _search_person(numpiece)

        is_update = personne is not None
        found_duplicate = is_update and not known_by_id

        # instance=None -> création, instance=personne -> mise à jour
        form = PersonForm(request.POST, instance=personne)

        if form.is_valid():
            # Modification par id : le nouveau numéro de pièce ne doit pas
            # appartenir à une autre personne déjà enregistrée
            conflict = None
            if known_by_id:
                conflict = (
                    Person.objects.filter(
                        NumPiece=form.cleaned_data["NumPiece"])
                    .exclude(pk=personne.pk)
                    .first()
                )

            if conflict is not None:
                form.add_error(
                    "NumPiece",
                    f"Une autre personne ({conflict}) est déjà enregistrée "
                    "avec ce numéro de pièce.",
                )
            else:
                personne = form.save()

                if found_duplicate:
                    messages.warning(
                        request,
                        f"Cette personne était déjà enregistrée ({personne}) : "
                        "ses informations ont été mises à jour avec les données saisies.",
                    )
                elif is_update:
                    messages.success(
                        request, "Informations mises à jour avec succès.")
                else:
                    messages.success(
                        request, "Informations enregistrées avec succès.")

                # Enregistrement réussi : on passe à l'enregistrement de la visite
                return redirect("visit_registration", person_id=personne.pk)

        return render(
            request,
            "person_register.html",
            {
                "message": "Veuillez corriger les erreurs ci-dessous.",
                "message_class": "danger",
                "form": form,
                "person": personne,
            },
        )

    # GET : on reçoit le numéro de pièce de la recherche
    numpiece = _compact(request.GET.get("numpiece", ""))
    typiece = request.GET.get("typiece", "").strip()

    if not numpiece:
        return redirect("find_person")

    personne = _search_person(numpiece)

    if personne is None:
        # Nouvelle personne : on pré-remplit avec le numéro de pièce
        initial = {"NumPiece": numpiece}
        if typiece.isdigit():
            initial["TypePiece"] = typiece
        form = PersonForm(initial=initial)
        message = "Nouvel enregistrement : complétez les informations."
    else:
        form = PersonForm(instance=personne)
        message = "Vous pouvez vérifier ou modifier les informations."

    return render(
        request,
        "person_register.html",
        {
            "message": message,
            "message_class": "info",
            "form": form,
            "person": personne,
        },
    )


def _open_visit(person, visit_id=""):
    """
    Visite en cours de saisie pour cette personne : celle de l'id posté,
    sinon son brouillon (visite non validée et non terminée).
    """
    visits = Visitor.objects.select_related("Badge").filter(Person=person)

    if str(visit_id).isdigit():
        visit = visits.filter(pk=visit_id).first()
        if visit is not None:
            return visit

    return (
        visits.filter(StartDate__isnull=True)
        .filter(Q(EndDate__isnull=True) | Q(EndDate__gte=timezone.now()))
        .order_by("-Id")
        .first()
    )


@login_required
def visit_registration(request, person_id):
    person = get_object_or_404(Person, pk=person_id)
    message = ""
    message_class = "danger"

    if request.method == "POST":
        visitor = _open_visit(person, request.POST.get("id", ""))
        is_update = visitor is not None

        form = VisitorForm(request.POST, instance=visitor)

        if form.is_valid():
            visitor = form.save(commit=False)
            visitor.Person = person  # la personne vient de l'URL
            if not is_update:
                visitor.CreatedBy = request.user
            visitor.save()

            messages.success(
                request,
                "Les informations de la visite ont été modifiées."
                if is_update
                else "La visite a été créée. Ajoutez maintenant les personnes visitées.",
            )
            return redirect("visited_person", visitor_id=visitor.pk)

        message = "Veuillez corriger les erreurs ci-dessous."
    else:
        # GET : on reprend le brouillon de la personne s'il existe
        visitor = _open_visit(person)
        form = VisitorForm(instance=visitor)
        if visitor is not None:
            message = (
                "Une visite est en cours de saisie pour cette personne : "
                "vous pouvez modifier les informations ou passer à l'étape suivante."
            )
            message_class = "info"

    return render(
        request,
        "visit_registration.html",
        {
            "form": form,
            "person": person,
            "visitor": visitor,
            "message": message,
            "message_class": message_class,
        },
    )


def visit_detail(request, visit_id):
    visit = get_object_or_404(
        Visitor.objects.select_related(
            "Person",
            "Person__TypePiece",
            "Badge",
            "Badge__BadgeCategory",
        ).prefetch_related("visited_persons__Department"),
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


@login_required
def visited_person(request, visitor_id):
    visitor = get_object_or_404(
        Visitor.objects.select_related("Person", "Badge"), pk=visitor_id
    )

    if request.method == "POST":
        # Retrait d'une personne visitée
        delete_id = request.POST.get("delete_id", "")
        if delete_id.isdigit():
            VisitedPerson.objects.filter(
                pk=delete_id, Visitor=visitor).delete()
            messages.success(request, "La personne visitée a été retirée.")
            return redirect("visited_person", visitor_id=visitor.pk)

        # Ajout d'une personne visitée
        form = VisitedPersonForm(request.POST)
        if form.is_valid():
            visited = form.save(commit=False)
            visited.Visitor = visitor  # le visiteur vient de l'URL
            visited.save()
            messages.success(request, "La personne visitée a été ajoutée.")
            return redirect("visited_person", visitor_id=visitor.pk)
    else:
        form = VisitedPersonForm()

    return render(
        request,
        "visited_person.html",
        {
            "form": form,
            "visitor": visitor,
            "person": visitor.Person,
            "visited_persons": visitor.visited_persons.select_related("Department"),
        },
    )


@login_required
def visit_validation(request, visitor_id):
    visitor = get_object_or_404(
        Visitor.objects.select_related("Person", "Badge"), pk=visitor_id
    )
    visited_persons = visitor.visited_persons.select_related("Department")
    message = ""
    message_class = "danger"

    if request.method == "POST":
        first_time = visitor.StartDate is None
        form = VisitValidationForm(request.POST, instance=visitor)

        if form.is_valid():
            if not visited_persons.exists():
                form.add_error(
                    None,
                    "Ajoutez au moins une personne visitée avant de valider la visite.",
                )
                message = "Veuillez corriger les erreurs ci-dessous."
            else:
                with transaction.atomic():
                    # Verrou sur le badge : une seule validation à la fois
                    badge = Badge.objects.select_for_update().get(pk=form.badge.pk)

                    busy = (
                        Visitor.objects.filter(Badge=badge)
                        .filter(Q(EndDate__isnull=True) | Q(EndDate__gte=timezone.now()))
                        .exclude(pk=visitor.pk)
                    )

                    if busy.exists():
                        form.add_error(
                            "BadgeNumber", "Ce badge est attribué à un autre visiteur."
                        )
                        message = "Veuillez corriger les erreurs ci-dessous."
                    else:
                        old_badge_id = visitor.Badge_id

                        visitor = form.save(commit=False)  # Badge, StartDate
                        visitor.Badge = badge              # le badge verrouillé
                        visitor.save()

                        badge.CurrentVisitor = visitor
                        badge.save(update_fields=["CurrentVisitor"])

                        # Si le badge a changé, l'ancien ne référence plus cette visite
                        if old_badge_id and old_badge_id != badge.pk:
                            Badge.objects.filter(
                                pk=old_badge_id, CurrentVisitor=visitor
                            ).update(CurrentVisitor=None)

                        messages.success(
                            request,
                            "La visite a été validée : la date de début est enregistrée."
                            if first_time
                            else "La visite a été mise à jour.",
                        )
                        return redirect("visit_detail", visit_id=visitor.pk)
        else:
            message = "Veuillez corriger les erreurs ci-dessous."
    else:
        form = VisitValidationForm(instance=visitor)

    return render(
        request,
        "visit_validation.html",
        {
            "form": form,
            "visitor": visitor,
            "person": visitor.Person,
            "visited_persons": visited_persons,
            "message": message,
            "message_class": message_class,
        },
    )
