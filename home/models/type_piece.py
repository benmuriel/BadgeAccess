from django.db import models


class TypePiece(models.Model):
    Id = models.IntegerField(primary_key=True)
    Name = models.CharField(max_length=255)

    def __str__(self):
        return self.Name

    class Meta:
        db_table = "TypePieces"
        managed = False
