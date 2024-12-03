from django.db import models

from users.models.Client import Client

class Order(models.Model):
    idOrder = models.AutoField(primary_key=True)
    dateOrder = models.DateTimeField(auto_now_add=True)
    totalPrice = models.DecimalField(max_digits=10, decimal_places=2)
    client = models.ForeignKey(Client, on_delete=models.CASCADE, related_name="orders")

    def __str__(self):
        return f"Order #{self.idOrder} - {self.client.firstName}"
