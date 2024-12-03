
from rest_framework import serializers
from authentification.models import AuthUser

class AuthUserRequestSerializer(serializers.ModelSerializer):
    class Meta:
        model = AuthUser
        fields = '__all__'

class AuthUserResponseSerializer(serializers.ModelSerializer):
    class Meta:
        model = AuthUser
        fields = '__all__'
        
# Sérialiseurs spécifiques aux actions
class ConnexionSerializer(serializers.Serializer):
    email = serializers.EmailField(required=False, allow_blank=True)
    password = serializers.CharField()

class ResetPasswordRequestSerializer(serializers.Serializer):
    email = serializers.EmailField(required=False, allow_blank=True)

class ResetPasswordConfirmSerializer(serializers.Serializer):
    num_tel = serializers.CharField()
    reset_token = serializers.CharField()
    new_password = serializers.CharField()
