
from main.models.Order import Order
from main.serializers.OrderLineSerializers import OrderLineRequestSerializer

from rest_framework import serializers

class OrderRequestSerializer(serializers.ModelSerializer):
    order_lines = OrderLineRequestSerializer(many=True, read_only=True)

    class Meta:
        model = Order
        fields = "__all__"
        

class OrderResponseSerializer(serializers.ModelSerializer):
    order_lines = OrderLineRequestSerializer(many=True, read_only=True)

    class Meta:
        model = Order
        fields = "__all__"