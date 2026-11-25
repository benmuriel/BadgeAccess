from django.conf import settings
from django.db import models

from .site import Site


class UserSite(models.Model):
    Id = models.AutoField(primary_key=True)
    User = models.OneToOneField(
        settings.AUTH_USER_MODEL,
        on_delete=models.CASCADE,
        related_name="usersite",
        db_column="UserId",
        verbose_name="Utilisateur",
    )
    Site = models.ForeignKey(
        Site,
        on_delete=models.PROTECT,
        related_name="users",
        db_column="SiteId",
        verbose_name="Site",
    )

    def __str__(self):
        return f"{self.User} - {self.Site}"

    class Meta:
        db_table = "UserSites"
        managed = False
        verbose_name = "Site de l'utilisateur"
        verbose_name_plural = "Sites des utilisateurs"
