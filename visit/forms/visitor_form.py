from django import forms
from django.db.models import Q
from django.utils import timezone

from home.models import Badge, Visitor

from django import forms

from home.models import Visitor


class VisitorForm(forms.ModelForm):
    class Meta:
        model = Visitor
        fields = ["Purpose", "VisitorQuality"]
        help_texts = {
            "Purpose": "Objet de la visite (ex: entretien, visite privée, audiance, etc.).",
            "VisitorQuality": "Qualité du visiteur (ex: Journaliste, Fournisseur, Délégué, etc.).",
        }
        error_messages = {
            "Purpose": {"required": "L'objet de la visite est obligatoire."},
        }

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for field in self.fields.values():
            field.widget.attrs.setdefault("class", "form-control")
