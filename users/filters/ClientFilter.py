from django_filters.rest_framework import FilterSet, filters

from users.models.Client import Client

class ClientFilter(FilterSet):
    firstName = filters.CharFilter(lookup_expr='icontains')
    lastName = filters.CharFilter(lookup_expr='icontains')
    email = filters.CharFilter(lookup_expr='icontains')

    class Meta:
        model = Client
        fields = ['firstName', 'lastName', 'email']

