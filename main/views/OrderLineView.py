
from rest_framework import viewsets

from main.models.OrderLine import OrderLine
from main.serializers.OrderLineSerializers import OrderLineRequestSerializer, OrderLineResponseSerializer
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework.filters import SearchFilter, OrderingFilter
from rest_framework.permissions import IsAuthenticated, AllowAny

class OrderLineViewSet(viewsets.ModelViewSet):
    queryset = OrderLine.objects.all()
    serializer_class = OrderLineRequestSerializer
    search_fields = ['idOrder','idDish']
    ordering_fields = ['idOrder','idDish']
    
    
    action_serializer_classes = {
        "create": OrderLineRequestSerializer,
        "update": OrderLineRequestSerializer,
        "retrieve": OrderLineResponseSerializer,
        "list": OrderLineResponseSerializer,
        "partial_update": OrderLineRequestSerializer,
    }

    action_permission_classes = {
        "create": [AllowAny],
        "update": [AllowAny],
        "retrieve": [AllowAny],
        "list": [AllowAny],
        "partial_update": [AllowAny],
        "destroy": [AllowAny]
    }

    def get_permissions(self):
        try:
            permission_classes = self.action_permission_classes[self.action]
        except KeyError:
            permission_classes = [IsAuthenticated]  #Default permission
        return [permission() for permission in permission_classes]
    def get_serializer_context(self):
        return {'request': self.request}

    def get_serializer_class(self):
        try:
            return self.action_serializer_classes[self.action]
        except (KeyError, AttributeError):
            return super(OrderLineViewSet, self).get_serializer_class()