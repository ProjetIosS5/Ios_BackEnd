from django.db import models

from main.models.Dish import Dish
from main.models.Order import Order

class OrderLine(models.Model):
    idOrder = models.ForeignKey(Order, on_delete=models.CASCADE, related_name="order_lines")
    idDish = models.ForeignKey(Dish, on_delete=models.CASCADE, related_name="order_lines")
    quantity = models.PositiveIntegerField()
    subtotal = models.DecimalField(max_digits=10, decimal_places=2)

    def save(self, *args, **kwargs):
        self.subtotal = self.idDish.price * self.quantity
        super().save(*args, **kwargs)

    def __str__(self):
        return f"OrderLine: {self.idOrder.idOrder} - {self.idDish.name}"