from django.db import models


class Department(models.Model):
    Id = models.IntegerField(primary_key=True)
    Name = models.CharField(max_length=255, verbose_name="Nom du département")

    def __str__(self):
        return self.Name

    class Meta:
        db_table = "Departments"
        verbose_name = "Département"
        verbose_name_plural = "Départements"
        ordering = ["Name"]
        managed = False
