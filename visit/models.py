from django.db import models
from django.urls import reverse


class Department(models.Model):
    Id = models.IntegerField(primary_key=True)
    Name = models.CharField(max_length=255)

    def __str__(self):
        return self.Name
