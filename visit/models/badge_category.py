from django.db import models


class BadgeCategory(models.Model):
    Id = models.AutoField(primary_key=True, verbose_name="Identifiant")
    Name = models.CharField(max_length=255, verbose_name="Nom de la catégorie")
    Type = models.CharField(max_length=20, verbose_name="Type de badge")

    def __str__(self):
        return self.Name

    class Meta:
        db_table = "BadgeCategories"
        verbose_name = "Catégorie de badge"
        verbose_name_plural = "Catégories de badges"
