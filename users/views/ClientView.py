from rest_framework import viewsets

from users.filters.ClientFilter import ClientFilter
from users.models.Client import Client
from users.serializers.ClientSerializers import ClientRequestSerializer, ClientResponseSerializer

from django_filters.rest_framework import DjangoFilterBackend
from rest_framework.filters import SearchFilter, OrderingFilter
from rest_framework.permissions import IsAuthenticated, AllowAny

class ClientViewSet(viewsets.ModelViewSet):
    queryset = Client.objects.all()
    filter_backends = [DjangoFilterBackend,SearchFilter, OrderingFilter]
    filterset_class = ClientFilter
    serializer_class = ClientRequestSerializer
    search_fields = ['firstName','lastName']
    ordering_fields = ['idClient','frequentRefill']
    
    
    action_serializer_classes = {
        "create": ClientRequestSerializer,
        "update": ClientRequestSerializer,
        "retrieve": ClientResponseSerializer,
        "list": ClientResponseSerializer,
        "partial_update": ClientRequestSerializer,
    }

    action_permission_classes = {
        "create": [AllowAny],
        "update": [AllowAny],
        "retrieve": [AllowAny],
        "list": [AllowAny],
        "partial_update": [AllowAny],
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
            return super(ClientViewSet, self).get_serializer_class()
        
    def perform_create(self, serializer):
        try:
            user = serializer.save()
            user.set_password(serializer.validated_data['password'])
            user.save()
        except Exception as e:
            print("Erreur lors de la création du compte client:", e)
            raise