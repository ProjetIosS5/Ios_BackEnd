from rest_framework import viewsets

from main.filters.DishFilter import DishFilter
from main.models.Dish import Dish
from main.serializers.DishSerializers import DishRequestSerializer, DishResponseSerializer
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework.filters import SearchFilter, OrderingFilter
from rest_framework.permissions import IsAuthenticated, AllowAny

class DishViewSet(viewsets.ModelViewSet):
    queryset = Dish.objects.all()
  
    serializer_class = DishRequestSerializer
    filter_backends = [DjangoFilterBackend,SearchFilter, OrderingFilter]
    filterset_class = DishFilter
    search_fields = ['id','name']
    ordering_fields = ['name','dateOrder','totalPrice']
    
    
    action_serializer_classes = {
        "create": DishRequestSerializer,
        "update": DishRequestSerializer,
        "retrieve": DishResponseSerializer,
        "list": DishResponseSerializer,
        "partial_update": DishRequestSerializer,
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
            return super(DishViewSet, self).get_serializer_class()