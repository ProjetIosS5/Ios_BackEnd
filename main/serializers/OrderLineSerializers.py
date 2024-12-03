from rest_framework import serializers

from main.models.OrderLine import OrderLine

class OrderLineRequestSerializer(serializers.ModelSerializer):
    class Meta:
        model = OrderLine
        fields = "__all__"


class OrderLineResponseSerializer(serializers.ModelSerializer):
    class Meta:
        model = OrderLine
        fields = "__all__"
