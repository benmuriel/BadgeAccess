from django.db import models

from .type_piece import TypePiece


class Person(models.Model):
    GENDER_CHOICES = [
        ("M", "Homme"),
        ("F", "Femme"),
    ]

    # Équivalent de INT IDENTITY(1,1) sous SQL Server
    Id = models.AutoField(primary_key=True, verbose_name="Identifiant")
    FirstName = models.CharField(max_length=255, verbose_name="Nom")
    LastName = models.CharField(
        max_length=255, blank=True, default="", verbose_name="Post-Nom")
    ForeName = models.CharField(
        max_length=255, blank=True, default="", verbose_name="Prénom")
    Gender = models.CharField(
        max_length=1, choices=GENDER_CHOICES, verbose_name="Sexe"
    )

    TypePiece = models.ForeignKey(
        TypePiece,
        on_delete=models.PROTECT,
        db_column="TypePieceId",
        verbose_name="Type de pièce",
    )

    NumPiece = models.CharField(max_length=255, verbose_name="Numéro de pièce")
    PhoneNumber = models.CharField(
        max_length=10, blank=True, null=True, verbose_name="Numéro de téléphone"
    )
    Role = models.CharField(max_length=255, blank=True,
                            null=True, verbose_name="Rôle")
    Provenance = models.CharField(
        max_length=255, blank=True, null=True, verbose_name="Provenance")

    def __str__(self):
        return f"{self.FirstName} {self.LastName} {self.ForeName}"

    class Meta:
        db_table = "Persons"
        verbose_name = "Personne"
        verbose_name_plural = "Personnes"
        managed = False
