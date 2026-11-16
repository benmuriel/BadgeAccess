from django.db import models
from django.utils import timezone

from .badge import Badge
from .person import Person


class Visitor(models.Model):
    Id = models.AutoField(primary_key=True, verbose_name="Identifiant")
    Person = models.ForeignKey(
        Person, on_delete=models.CASCADE, db_column="PersonId", verbose_name="Personne"
    )
    Badge = models.ForeignKey(
        Badge, on_delete=models.CASCADE, db_column="BadgeId", verbose_name="Badge"
    )
    CreatedAtDate = models.DateTimeField(
        auto_now_add=True, verbose_name="Date de creation")

    StartDate = models.DateTimeField(
        default=timezone.now, verbose_name="Date de debut")
    EndDate = models.DateTimeField(
        null=True, blank=True, verbose_name="Date de fin")
    Purpose = models.CharField(
        max_length=255, verbose_name="Objet de la visite")
    VisitedPerson = models.CharField(
        max_length=255, verbose_name="Personne visitée")
    VisitedPersonRole = models.CharField(
        max_length=255, verbose_name="Fonction de la Personne visitée")

    def __str__(self):
        return f"Visite de {self.Person} le {self.StartDate:%d/%m/%Y}"

    @property
    def is_ended(self):
        return self.EndDate is not None and self.EndDate < timezone.now()

    @property
    def status(self):
        now = timezone.now()
        if self.is_ended:
            return "Terminée"
        if self.StartDate > now:
            return "Planifiée"
        return "En cours"

    class Meta:
        db_table = "Visitors"
        verbose_name = "Visiteur"
        verbose_name_plural = "Visiteurs"
