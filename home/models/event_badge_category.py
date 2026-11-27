from django.db import models

from .badge_category import BadgeCategory
from .event import Event


class EventBadgeCategory(models.Model):
    pk = models.CompositePrimaryKey("Event", "BadgeCategory")
    Event = models.ForeignKey(
        Event,
        on_delete=models.CASCADE,
        related_name="badge_categories",
        db_column="EventId",
        verbose_name="Événement",
    )
    BadgeCategory = models.ForeignKey(
        BadgeCategory,
        on_delete=models.PROTECT,
        related_name="event_links",
        db_column="CategoryId",
        verbose_name="Catégorie de badge",
    )

    def __str__(self):
        return f"{self.Event} - {self.BadgeCategory}"

    class Meta:
        db_table = "EventBadgeCategories"
        managed = False
        verbose_name = "Catégorie de badge autorisée"
        verbose_name_plural = "Catégories de badges autorisées"
