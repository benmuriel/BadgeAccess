from django import forms
# visit/forms/person_form.py
from home.models import Person, TypePiece
from django.core.validators import MaxLengthValidator


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
            # "Role",
            # "Provenance",
        ]
        help_texts = {
            "FirstName": "Saisir le nom .",
            "LastName": "Saisir le postnom .",
            "ForeName": "Saisir le prénom .",
            "NumPiece": "Saisir le numéro de pièce .",
            "PhoneNumber": "10 chiffres sans espaces (Ex : 0998877665)",
            # "Role": "La qualité du visiteur ou son lien avec la personne visitée (Exemple: Directeur, Ami, Collègue, etc.)",
            # "Provenance": "Lieu ou entité (Entreprise) de provenance du visiteur (Exemple: Kinshasa, DGI, DRHKAT, etc.)",
        }
        error_messages = {
            "FirstName": {"required": "Le nom est obligatoire."},
            "TypePiece": {
                "required": "Veuillez choisir un type de pièce.",
                "invalid_choice": "Ce type de pièce n'est pas valide.",
            },
            "NumPiece": {"required": "Le numéro de la pièce est obligatoire."},
            "PhoneNumber": {"required": "Le numéro de téléphone est obligatoire.",
                            "max_length": "Le numéro de téléphone ne doit pas dépasser 10 caractères.", },
        }

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

        # Bootstrap : même classe sur tous les champs
        for field in self.fields.values():
            field.widget.attrs.setdefault("class", "form-control")
            field.widget.attrs["autocomplete"] = "off"

        # Liste déroulante des types de pièce, triée par nom
        self.fields["TypePiece"].empty_label = "-- Sélectionner --"
        self.fields["TypePiece"].queryset = TypePiece.objects.order_by("Name")
        self.fields["PhoneNumber"].validators.append(MaxLengthValidator(10))
