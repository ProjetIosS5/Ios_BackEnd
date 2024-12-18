from rest_framework import serializers

from users.models.Client import Client


class ClientRequestSerializer(serializers.ModelSerializer):
    class Meta:
        model = Client
        fields = ["email","firstName","lastName","dateOfBirth"]

class ClientResponseSerializer(serializers.ModelSerializer):
    class Meta:
        model = Client
        fields = "__all__"
