from django.db import models
from .site import Site


class Department(models.Model):
    Id = models.IntegerField(primary_key=True)
    Name = models.CharField(max_length=255, verbose_name="Nom du département")
    Site = models.ForeignKey(
        Site,
        on_delete=models.PROTECT,
        null=True,
        blank=True,
        related_name="departments",
        db_column="SiteId",
        verbose_name="Site du Departement",
    )

    def __str__(self):
        return self.Name

    class Meta:
        db_table = "Departments"
        verbose_name = "Département"
        verbose_name_plural = "Départements"
        ordering = ["Name"]
        managed = False
