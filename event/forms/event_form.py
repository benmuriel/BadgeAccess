from django import forms

from home.models import Event

DATETIME_FORMAT = "%Y-%m-%dT%H:%M"


class EventForm(forms.ModelForm):
    class Meta:
        model = Event
        fields = ["Name", "Description", "StartDate", "EndDate", "Place"]
        widgets = {
            "Description": forms.Textarea(attrs={"rows": 3}),
            "StartDate": forms.DateTimeInput(
                attrs={"type": "datetime-local"}, format=DATETIME_FORMAT
            ),
            "EndDate": forms.DateTimeInput(
                attrs={"type": "datetime-local"}, format=DATETIME_FORMAT
            ),
        }
        help_texts = {
            "Name": "Le nom de l'événement.",
            "Description": "Une description de l'événement (facultatif).",
            "StartDate": "Date et heure de début.",
            "EndDate": "Date et heure de fin.",
            "Place": "Le lieu où se déroule l'événement.",
        }
        error_messages = {
            "Name": {"required": "Le nom de l'événement est obligatoire."},
            "StartDate": {"required": "La date de début est obligatoire."},
            "EndDate": {"required": "La date de fin est obligatoire."},
            "Place": {"required": "Le lieu est obligatoire."},
        }

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

        for field in self.fields.values():
            field.widget.attrs.setdefault("class", "form-control")
            field.widget.attrs["autocomplete"] = "off"

        # Les champs datetime-local n'envoient pas de secondes
        for name in ("StartDate", "EndDate"):
            self.fields[name].input_formats = [DATETIME_FORMAT]

    def clean(self):
        cleaned = super().clean()
        start, end = cleaned.get("StartDate"), cleaned.get("EndDate")
        if start and end and end < start:
            self.add_error(
                "EndDate", "La date de fin doit être après la date de début.")
        return cleaned
