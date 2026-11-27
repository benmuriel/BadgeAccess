from django.db import models

from .event import Event


class Partner(models.Model):
    Id = models.AutoField(primary_key=True, verbose_name="Identifiant")
    Event = models.ForeignKey(
        Event,
        on_delete=models.CASCADE,
        related_name="partners",
        db_column="EventId",
        verbose_name="Événement",
    )
    Name = models.CharField(max_length=255, verbose_name="Nom du partenaire")

    def __str__(self):
        return self.Name

    class Meta:
        db_table = "PartnerLists"
        managed = False
        verbose_name = "Partenaire"
        verbose_name_plural = "Partenaires"
        ordering = ["Name"]
