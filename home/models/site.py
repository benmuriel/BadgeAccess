from django.db import models


class Site(models.Model):
    Id = models.IntegerField(primary_key=True)
    Name = models.CharField(max_length=255, verbose_name="Nom du site")

    def __str__(self):
        return self.Name

    class Meta:
        db_table = "Sites"
        verbose_name = "Site"
        verbose_name_plural = "Sites"
        ordering = ["Name"]
        managed = False
