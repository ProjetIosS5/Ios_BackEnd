

from rest_framework import viewsets

from main.filters.OrderFilter import OrderFilter
from main.models.Order import Order
from main.serializers.OrderSerializers import OrderRequestSerializer,OrderResponseSerializer
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework.filters import SearchFilter, OrderingFilter
from rest_framework.permissions import IsAuthenticated, AllowAny

class OrderViewSet(viewsets.ModelViewSet):
    queryset = Order.objects.all()

    serializer_class = OrderRequestSerializer
    filter_backends = [DjangoFilterBackend,SearchFilter, OrderingFilter]
    filterset_class = OrderFilter
    search_fields = ['id','name']
    ordering_fields = ['name','dateOrder','totalPrice']
    
    
    action_serializer_classes = {
        "create": OrderRequestSerializer,
        "update": OrderRequestSerializer,
        "retrieve": OrderResponseSerializer,
        "list": OrderResponseSerializer,
        "partial_update": OrderRequestSerializer,
    }

    action_permission_classes = {
        "create": [AllowAny],
        "update": [IsAuthenticated],
        "retrieve": [IsAuthenticated],
        "list": [IsAuthenticated],
        "partial_update": [IsAuthenticated],
        "destroy": [IsAuthenticated],
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
            return super(OrderViewSet, self).get_serializer_class()