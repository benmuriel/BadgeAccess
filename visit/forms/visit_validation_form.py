from django import forms
from django.db.models import Q
from django.utils import timezone

from home.models import Badge, Visitor


class VisitValidationForm(forms.ModelForm):
    # Champ saisi par l'utilisateur (pas un champ du modèle)
    BadgeNumber = forms.CharField(
        label="Numéro de badge",
        max_length=5,
        help_text="Saisir le numéro du badge .",
        error_messages={
            "required": "Veuillez saisir le numéro du badge.",
            "max_length": "Le numéro de badge est trop long.",
        },
    )

    class Meta:
        model = Visitor
        fields = []

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.badge = None
        self.fields["BadgeNumber"].widget.attrs.setdefault(
            "class", "form-control")

        # Modification : on affiche le numéro du badge actuel
        if not self.is_bound and self.instance.pk and self.instance.Badge_id:
            self.initial["BadgeNumber"] = self.instance.Badge.BadgeNumber

    def clean_BadgeNumber(self):
        number = self.cleaned_data["BadgeNumber"].strip()

        badge = (
            Badge.objects.filter(BadgeNumber=number,
                                 BadgeCategory__Type="generic")
            .order_by("-Id")
            .first()
        )
        if badge is None:
            raise forms.ValidationError(
                "Ce numéro de badge n'existe pas ou n'est pas un badge générique."
            )

        # Le badge ne doit pas être utilisé par une autre visite non terminée
        ongoing = (
            Visitor.objects.select_related("Person")
            .filter(Badge=badge)
            .filter(Q(EndDate__isnull=True) | Q(EndDate__gte=timezone.now()))
        )
        if self.instance.pk:
            ongoing = ongoing.exclude(pk=self.instance.pk)
        ongoing = ongoing.order_by("-StartDate").first()

        if ongoing is not None:
            raise forms.ValidationError(
                f"Ce badge est déjà utilisé par {ongoing.Person} "
                f"(visite n° {ongoing.pk} non terminée)."
            )

        self.badge = badge
        return number

    def save(self, commit=True):
        is_new = self.instance.StartDate is None
        visitor = super().save(commit=False)
        visitor.Badge = self.badge  # trouvé lors de la validation
        if is_new:
            visitor.StartDate = timezone.now()  # date et heure de la validation
        if commit:
            visitor.save()
        return visitor
