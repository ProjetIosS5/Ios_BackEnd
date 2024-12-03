
from django.db import models

from authentification.models import AuthUser

class Client(AuthUser):
    idClient = models.AutoField(primary_key=True)
    firstName = models.CharField(max_length=50)
    lastName = models.CharField(max_length=50)
    dateOfBirth = models.DateField()
    extraNapkins = models.BooleanField(default=False)
    frequentRefill = models.BooleanField(default=False)

    def __str__(self):
        return f"{self.firstName} {self.lastName}"