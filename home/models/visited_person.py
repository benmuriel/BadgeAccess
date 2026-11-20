from django.db import models

from .department import Department
from .visitor import Visitor


class VisitedPerson(models.Model):
    Id = models.AutoField(primary_key=True, verbose_name="Identifiant")
    Visitor = models.ForeignKey(
        Visitor,
        on_delete=models.CASCADE,
        related_name="visited_persons",
        db_column="VisitorId",
        verbose_name="Visiteur",
    )
    Department = models.ForeignKey(
        Department,
        on_delete=models.PROTECT,
        db_column="DepartmentId",
        verbose_name="Département visité",
    )
    PersonFullName = models.CharField(
        max_length=255, null=True,
        blank=True, verbose_name="Nom complet de la personne visitée"
    )
    PersonRole = models.CharField(
        max_length=255, verbose_name="Fonction de la personne visitée"
    )

    def __str__(self):
        return self.PersonFullName

    class Meta:
        db_table = "VisitedPersons"
        managed = False
        verbose_name = "Personne visitée"
        verbose_name_plural = "Personnes visitées"
