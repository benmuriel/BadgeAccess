from django import forms

from home.models import Department, VisitedPerson


class VisitedPersonForm(forms.ModelForm):
    class Meta:
        model = VisitedPerson
        fields = ["Department", "PersonFullName", "PersonRole"]
        help_texts = {
            "Department": "Choisir le département visité .",
            "PersonFullName": "Le nom de la personne visitée.",
            "PersonRole": "La fonction de la personne visitée (Example: Directeur de Cabinet, Chef de Division, Secretaire, etc.).",
        }
        error_messages = {
            "PersonRole": {"required": "La fonction de la personne visitée est obligatoire."},
        }

    def __init__(self, *args, visitor=None, departments=None, **kwargs):
        super().__init__(*args, **kwargs)
        self.visitor = visitor

        for field in self.fields.values():
            field.widget.attrs.setdefault("class", "form-control")

        # Seuls les départements autorisés sont proposés (et acceptés à l'envoi)
        if departments is None:
            departments = Department.objects.all()
        self.fields["Department"].queryset = departments.order_by("Name")
        self.fields["Department"].empty_label = "-- Sélectionner --"

    def clean(self):
        cleaned = super().clean()
        name = (cleaned.get("PersonFullName") or "").strip()
        role = (cleaned.get("PersonRole") or "").strip()
        department = cleaned.get("Department")

        # Il faut au moins le nom ou la fonction
        if not name and not role:
            raise forms.ValidationError(
                "Saisissez le nom ou la fonction de la personne visitée."
            )

        # La même personne ne peut pas être ajoutée deux fois à la même visite
        if self.visitor is not None and department:
            duplicates = VisitedPerson.objects.filter(
                Visitor=self.visitor, Department=department
            )
            if name:
                duplicates = duplicates.filter(PersonFullName__iexact=name)
            else:
                # Sans nom : on compare la fonction, parmi les personnes sans nom
                duplicates = duplicates.filter(
                    PersonFullName__isnull=True, PersonRole__iexact=role
                ) | duplicates.filter(PersonFullName="", PersonRole__iexact=role)

            if self.instance.pk:
                duplicates = duplicates.exclude(pk=self.instance.pk)
            if duplicates.exists():
                raise forms.ValidationError(
                    "Cette personne est déjà ajoutée à cette visite."
                )
        return cleaned

    def save(self, commit=True):
        visited = super().save(commit=False)
        if self.visitor is not None:
            visited.Visitor = self.visitor  # lien avec le visiteur
        """ if visited.Visitor_id is None:
            raise ValueError(
                "Une personne visitée doit être liée à un visiteur.") """
        if commit:
            visited.save()
        return visited
