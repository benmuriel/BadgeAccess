import secrets
import string

from django import forms

from home.models import Badge, Person

ALPHABET = string.ascii_uppercase + string.digits


def generate_num_piece(partner):
    """Numéro de 15 caractères : identifiant du partenaire, '_', puis du texte aléatoire."""
    prefix = f"{partner.pk}_"
    size = 15 - len(prefix)
    while True:
        candidate = prefix + "".join(secrets.choice(ALPHABET)
                                     for _ in range(size))
        if not Person.objects.filter(NumPiece=candidate).exists():
            return candidate


class ParticipantForm(forms.ModelForm):
    # Champ saisi par l'utilisateur (pas un champ du modèle)
    BadgeNumber = forms.CharField(
        label="Numéro de badge",
        max_length=255,
        required=False,
        help_text="Facultatif : le numéro du badge remis au participant.",
    )

    class Meta:
        model = Person
        fields = ["FirstName", "LastName", "ForeName",
                  "Gender", "Role", "PhoneNumber"]
        help_texts = {
            "FirstName": "Saisir le nom.",
            "LastName": "Saisir le post-nom (facultatif).",
            "ForeName": "Saisir le prénom (facultatif).",
            "Role": "La qualité du participant.",
            "PhoneNumber": "Saisir le numéro de téléphone (10 caractères).",
        }
        error_messages = {
            "FirstName": {"required": "Le nom est obligatoire."},
            "Gender": {"required": "Veuillez choisir le sexe."},
            "Role": {"required": "La qualité du participant est obligatoire."},
            "PhoneNumber": {"required": "Le numéro de téléphone est obligatoire."},
        }

    field_order = [
        "FirstName", "LastName", "ForeName", "Gender", "Role", "PhoneNumber", "BadgeNumber",
    ]

    def __init__(self, *args, partner=None, **kwargs):
        super().__init__(*args, **kwargs)
        self.partner = partner  # le partenaire vient de la vue, jamais du formulaire
        self.badge = None

        for field in self.fields.values():
            field.widget.attrs.setdefault("class", "form-control")
            field.widget.attrs["autocomplete"] = "off"

        self.fields["Gender"].choices = [("", "-- Sélectionner --")] + list(
            Person.GENDER_CHOICES
        )
        self.fields["Gender"].widget.attrs["class"] = "form-control"

        # Édition : pré-remplir le numéro de badge
        if self.instance.pk and self.instance.Badge_id:
            self.fields["BadgeNumber"].initial = self.instance.Badge.BadgeNumber

    def clean_BadgeNumber(self):
        number = "".join((self.cleaned_data.get("BadgeNumber") or "").split())
        if not number:
            return ""  # le badge est facultatif

        badge = Badge.objects.filter(
            BadgeNumber=number).order_by("-Id").first()
        if badge is None:
            raise forms.ValidationError("Ce numéro de badge n'existe pas.")

        holder = Person.objects.filter(Badge=badge).exclude(
            pk=self.instance.pk).first()
        if holder is not None:
            raise forms.ValidationError(
                f"Ce badge est déjà attribué à {holder}.")

        self.badge = badge
        return number

    def save(self, commit=True):
        if self.partner is None:
            raise ValueError("Un participant doit être lié à un partenaire.")

        person = super().save(commit=False)
        person.Partner = self.partner
        person.Badge = self.badge          # None si le champ est vide
        if not person.NumPiece:            # génération seulement à la création
            person.NumPiece = generate_num_piece(self.partner)
        person.Provenance = person.Provenance or ""
        if commit:
            person.save()
        return person
