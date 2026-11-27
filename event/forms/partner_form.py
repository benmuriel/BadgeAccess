from django import forms

from home.models import Partner


class PartnerForm(forms.ModelForm):
    class Meta:
        model = Partner
        fields = ["Name"]
        help_texts = {"Name": "Le nom du partenaire."}
        error_messages = {
            "Name": {"required": "Le nom du partenaire est obligatoire."}}

    def __init__(self, *args, event=None, **kwargs):
        super().__init__(*args, **kwargs)
        self.event = event  # l'événement vient de la vue, jamais du formulaire
        self.fields["Name"].widget.attrs.setdefault("class", "form-control")
        self.fields["Name"].widget.attrs["autocomplete"] = "off"

    def clean_Name(self):
        name = self.cleaned_data["Name"].strip()
        if self.event is not None and Partner.objects.filter(
            Event=self.event, Name__iexact=name
        ).exists():
            raise forms.ValidationError(
                "Ce partenaire est déjà ajouté à cet événement.")
        return name

    def save(self, commit=True):
        partner = super().save(commit=False)
        if self.event is None:
            raise ValueError("Un partenaire doit être lié à un événement.")
        partner.Event = self.event
        if commit:
            partner.save()
        return partner
