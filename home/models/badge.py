from django.db import models

from .badge_category import BadgeCategory
from .person import Person


class Badge(models.Model):
    Id = models.AutoField(primary_key=True, verbose_name="Identifiant")
    BadgeNumber = models.CharField(
        max_length=255, verbose_name="Numéro de badge")
    BadgeCategory = models.ForeignKey(
        BadgeCategory,
        on_delete=models.PROTECT,
        db_column="CategoryId",
        verbose_name="Catégorie de badge",
    )
    Person = models.ForeignKey(
        Person, on_delete=models.CASCADE, db_column="PersonId", verbose_name="Personne"
    )
    CurrentVisitor = models.ForeignKey(
        "Visitor",
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        related_name="+",
        db_column="CurrentVisitorId",
        verbose_name="Visiteur actuel ou dernier visiteur",
    )

    IssueDate = models.DateTimeField(
        auto_now_add=True, verbose_name="Date de création")
    ExpiryDate = models.DateTimeField(
        auto_now_add=True, verbose_name="Date de création")

    def __str__(self):
        return f"Badge {self.BadgeNumber}"

    class Meta:
        db_table = "Badges"
        verbose_name = "Badge"
        verbose_name_plural = "Badges"
