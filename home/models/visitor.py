from django.db import models
from django.utils import timezone

from django.conf import settings

from .badge import Badge
from .person import Person


class Visitor(models.Model):
    Id = models.AutoField(primary_key=True, verbose_name="Identifiant")
    Person = models.ForeignKey(
        Person, on_delete=models.CASCADE, db_column="PersonId", verbose_name="Personne"
    )
    Badge = models.ForeignKey(
        Badge,
        on_delete=models.CASCADE,
        null=True,
        blank=True,
        db_column="BadgeId",
        verbose_name="Badge",
    )
    VisitorQuality = models.CharField(
        max_length=255,
        null=True,
        blank=True,
        verbose_name="Qualité du visiteur",
    )
    CreatedAtDate = models.DateTimeField(
        auto_now_add=True, verbose_name="Date de creation")

    StartDate = models.DateTimeField(
        null=True, blank=True, verbose_name="Date de debut")
    EndDate = models.DateTimeField(
        null=True, blank=True, verbose_name="Date de fin")
    Purpose = models.CharField(
        max_length=255, verbose_name="Objet de la visite")

    CreatedBy = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete=models.PROTECT,
        null=True,
        blank=True,
        editable=False,
        related_name="visits_registered",
        db_column="CreatedById",
        verbose_name="Enregistrée par",
    )

    def __str__(self):
        return f"Visite de {self.Person} le {self.CreatedBy:%d/%m/%Y}"

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
        managed = False
