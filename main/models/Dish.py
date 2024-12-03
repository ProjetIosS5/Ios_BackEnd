
from django.db import models
from datetime import datetime
import os
import os
from datetime import datetime

def dish_image_upload_path(instance, filename):
    # Obtenez l'extension du fichier
    file_extension = os.path.splitext(filename)[1]

    # Générez un nom unique basé sur la date et l'heure
    current_datetime = datetime.now()
    minute = str(current_datetime.minute).zfill(2)
    new_filename = f"dish_{current_datetime.date()}_{minute}{file_extension}"

    # Retourne le chemin complet
    return os.path.join("images/main/dishes/", new_filename)

class Dish(models.Model):
    idDish = models.AutoField(primary_key=True)
    name = models.CharField(max_length=100)
    description = models.TextField()
    price = models.DecimalField(max_digits=10, decimal_places=2)
    calories = models.PositiveIntegerField()
    proteins = models.FloatField()
    carbs = models.FloatField()
    imageURL = models.ImageField(null=True, blank=True, upload_to=dish_image_upload_path)

    def __str__(self):
        return self.name
