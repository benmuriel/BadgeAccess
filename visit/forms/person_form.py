from django import forms

from ..models import Person, TypePiece


class PersonForm(forms.ModelForm):
    class Meta:
        model = Person
        fields = [
            "FirstName",
            "LastName",
            "ForeName",
            "Gender",
            "TypePiece",
            "NumPiece",
            "PhoneNumber",
            "Role",
            "Provenance",
        ]
        help_texts = {
            "FirstName": "Saisir le nom .",
            "LastName": "Saisir le postnom .",
            "ForeName": "Saisir le prénom .",
            "NumPiece": "Saisir le numéro de pièce .",
            "PhoneNumber": "Saisir le numéro de téléphone .",
            "Role": "Saisir le rôle .",
            "Provenance": "Saisir la provenance .",
        }

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

        # Bootstrap : même classe sur tous les champs
        for field in self.fields.values():
            field.widget.attrs.setdefault("class", "form-control")

        # Liste déroulante des types de pièce, triée par nom
        self.fields["TypePiece"].empty_label = "-- Sélectionner --"
        self.fields["TypePiece"].queryset = TypePiece.objects.order_by("Name")
