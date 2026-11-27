from django import forms

from home.models import BadgeCategory, EventBadgeCategory


class EventBadgeCategoryForm(forms.ModelForm):
    class Meta:
        model = EventBadgeCategory
        fields = ["BadgeCategory"]
        error_messages = {
            "BadgeCategory": {"required": "Veuillez choisir une catégorie de badge."},
        }

    def __init__(self, *args, event=None, **kwargs):
        super().__init__(*args, **kwargs)
        self.event = event  # l'événement vient de la vue, jamais du formulaire

        field = self.fields["BadgeCategory"]
        field.widget.attrs.setdefault("class", "form-control")

        # Seules les catégories pas encore autorisées sont proposées (et acceptées)
        categories = BadgeCategory.objects.all()
        if event is not None:
            categories = categories.exclude(event_links__Event=event)
        field.queryset = categories.order_by("Name")
        field.empty_label = "-- Sélectionner --"

    def save(self, commit=True):
        link = super().save(commit=False)
        if self.event is None:
            raise ValueError("Une catégorie doit être liée à un événement.")
        link.Event = self.event
        if commit:
            link.save()
        return link
