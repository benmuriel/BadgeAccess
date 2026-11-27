from django.utils import timezone
from django.db import models


class Event(models.Model):
    Id = models.AutoField(primary_key=True, verbose_name="Identifiant")
    Name = models.CharField(max_length=255, verbose_name="Nom de l'événement")
    Description = models.TextField(
        null=True, blank=True, verbose_name="Description")
    CreatedAtDate = models.DateTimeField(
        auto_now_add=True, verbose_name="Date de création")
    StartDate = models.DateTimeField(verbose_name="Date de début")
    EndDate = models.DateTimeField(verbose_name="Date de fin")
    Place = models.CharField(max_length=255, verbose_name="Lieu")

    def __str__(self):
        return self.Name

    class Meta:
        db_table = "Events"
        managed = False
        verbose_name = "Événement"
        verbose_name_plural = "Événements"
        ordering = ["-StartDate"]

    @property
    def status(self):
        now = timezone.now()
        if self.StartDate > now:
            return "À venir"
        if self.EndDate < now:
            return "Terminé"
        return "En cours"
