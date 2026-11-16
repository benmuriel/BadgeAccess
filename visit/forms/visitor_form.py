from datetime import timedelta  # remove this import if you no longer need it

from django import forms
from django.utils import timezone

from home.models import Badge, Visitor


class VisitorForm(forms.ModelForm):
    # Champ saisi par l'utilisateur (pas un champ du modèle)
    BadgeNumber = forms.CharField(
        label="Numéro de badge",
        max_length=255,
        help_text="Saisir le numéro du badge .",
    )

    class Meta:
        model = Visitor
        fields = [
            "StartDate",
            "Purpose",
            "VisitedPerson",
            "VisitedPersonRole",
        ]
        widgets = {
            "StartDate": forms.DateTimeInput(
                attrs={"type": "datetime-local"}, format="%Y-%m-%dT%H:%M"
            ),
        }
        help_texts = {
            "Purpose": "Saisir l'objet de la visite .",
            "VisitedPerson": "Saisir le nom de la personne visitée .",
            "VisitedPersonRole": "Saisir la fonction de la personne visitée .",
        }

    # Le champ BadgeNumber est affiché en premier
    field_order = [
        "BadgeNumber",
        "StartDate",
        "Purpose",
        "VisitedPerson",
        "VisitedPersonRole",
    ]

    def __init__(self, *args, person=None, **kwargs):
        super().__init__(*args, **kwargs)
        self.badge = None

        for field in self.fields.values():
            field.widget.attrs.setdefault("class", "form-control")

        # Le champ datetime-local n'envoie pas de secondes
        self.fields["StartDate"].input_formats = ["%Y-%m-%dT%H:%M"]

        # Valeur initiale : début = maintenant
        if not self.is_bound:
            self.initial["StartDate"] = timezone.localtime().replace(
                second=0, microsecond=0
            )

    def clean_BadgeNumber(self):
        number = self.cleaned_data["BadgeNumber"].strip()

        badge = (
            Badge.objects.filter(
                BadgeNumber=number,
                BadgeCategory__Type="generic",
            )
            .order_by("-Id")
            .first()
        )
        if badge is None:
            raise forms.ValidationError(
                "Ce numéro de badge n'existe pas ou n'est pas un badge générique."
            )

        self.badge = badge
        return number

    def save(self, commit=True):
        visitor = super().save(commit=False)
        visitor.Badge = self.badge  # trouvé lors de la validation
        if commit:
            visitor.save()
        return visitor
