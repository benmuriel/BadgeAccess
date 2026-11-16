from django import forms
from django.utils import timezone

from home.models import Visitor


class EndVisitForm(forms.ModelForm):
    """Formulaire sans champ : la date de fin est prise automatiquement."""

    class Meta:
        model = Visitor
        fields = []

    def clean(self):
        cleaned = super().clean()
        now = timezone.now()
        visit = self.instance

        if visit.EndDate is not None and visit.EndDate <= now:
            raise forms.ValidationError("Cette visite est déjà terminée.")
        if visit.StartDate > now:
            raise forms.ValidationError(
                "Cette visite n'a pas encore commencé, elle ne peut pas être terminée."
            )
        return cleaned

    def save(self, commit=True):
        visit = super().save(commit=False)
        visit.EndDate = timezone.now()  # date et heure de la validation
        if commit:
            visit.save()
        return visit
