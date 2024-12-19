from rest_framework import serializers

from main.models.OrderLine import OrderLine
from main.serializers.DishSerializers import DishResponseSerializer

class OrderLineRequestSerializer(serializers.ModelSerializer):
    dish = DishResponseSerializer(read_only=True)
    class Meta:
        model = OrderLine
        fields = "__all__"


class OrderLineResponseSerializer(serializers.ModelSerializer):
    dish = DishResponseSerializer(read_only=True)
    class Meta:
        model = OrderLine
        fields = "__all__"
