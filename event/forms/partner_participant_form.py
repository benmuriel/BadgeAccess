from django import forms

from home.models import Person


class PartnerParticipantForm(forms.Form):
    NumPiece = forms.CharField(
        label="Numéro de la pièce d'identité",
        max_length=255,
        help_text="Saisir le numéro de pièce d'une personne déjà enregistrée.",
        error_messages={"required": "Veuillez saisir le numéro de la pièce."},
    )

    def __init__(self, *args, partner=None, **kwargs):
        super().__init__(*args, **kwargs)
        self.partner = partner  # le partenaire vient de la vue
        self.person = None
        self.fields["NumPiece"].widget.attrs.update(
            {"class": "form-control", "autocomplete": "off",
                "placeholder": "N° de pièce"}
        )

    def clean_NumPiece(self):
        number = "".join(self.cleaned_data["NumPiece"].split())

        person = (
            Person.objects.select_related("Partner")
            .filter(NumPiece=number)
            .order_by("-Id")
            .first()
        )
        if person is None:
            raise forms.ValidationError(
                "Aucune personne ne porte ce numéro de pièce. Enregistrez-la d'abord."
            )
        if person.Partner_id == self.partner.pk:
            raise forms.ValidationError(
                f"{person} est déjà participant(e) pour ce partenaire."
            )
        if person.Partner_id is not None:
            raise forms.ValidationError(
                f"{person} est déjà rattaché(e) au partenaire « {person.Partner.Name} »."
            )

        self.person = person
        return number

    def save(self):
        self.person.Partner = self.partner
        self.person.save(update_fields=["Partner"])
        return self.person
