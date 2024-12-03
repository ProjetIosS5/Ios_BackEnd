from rest_framework import viewsets

from users.models.Client import Client


class ClientViewSet(viewsets.ModelViewSet):
    queryset = Client.objects.all()
