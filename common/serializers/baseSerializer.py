from django.utils.translation import gettext_lazy as _
from rest_framework import serializers
from rest_framework.serializers import ModelSerializer

from authentification.models.base_models import BaseModel
from ..utils import formatted_date_time_value


class BaseModelSerializer(ModelSerializer):
    """
    Define custom base serializer class
    """

    def get_queryset(self):
        queryset = super().get_queryset()
        return queryset.filter(deleted_at__isnull=True)


class BaseDetailModelSerializer(BaseModelSerializer):
    """
    Define custom base detail serializer class
    """
    created_at = serializers.DateTimeField(read_only=True)
    updated_at = serializers.DateTimeField(read_only=True)
    deleted_at = serializers.DateTimeField(read_only=True)
    
    deleted = serializers.BooleanField(read_only=True)
    
    def to_representation(self, instance):
        representation = super().to_representation(instance)
        representation["created_at"] = formatted_date_time_value(instance.created_at)
        representation["updated_at"] = formatted_date_time_value(instance.updated_at)
        representation["deleted_at"] = formatted_date_time_value(instance.deleted_at)
        
        return representation
    
    class Meta:
        model = BaseModel
        fields = (
            "id",
            "created_at",
            "updated_at",
            "deleted_at",
            "deleted",
        )


class CustomDecimalField(serializers.DecimalField):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.style.update({'input_type': 'number'})