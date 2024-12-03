from rest_framework import serializers

from main.models.Dish import Dish


class DishRequestSerializer(serializers.ModelSerializer):
    class Meta:
        model = Dish
        fields = "__all__"

class DishResponseSerializer(serializers.ModelSerializer):
    class Meta:
        model = Dish
        fields = "__all__"
