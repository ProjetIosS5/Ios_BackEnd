from django_filters.rest_framework import FilterSet, filters

from main.models.Dish import Dish

class DishFilter(FilterSet):
    name = filters.CharFilter(lookup_expr='icontains')
    min_price = filters.NumberFilter(field_name="price", lookup_expr='gte')
    max_price = filters.NumberFilter(field_name="price", lookup_expr='lte')

    class Meta:
        model = Dish
        fields = ['name', 'min_price', 'max_price']

