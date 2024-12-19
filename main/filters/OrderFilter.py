from django_filters.rest_framework import FilterSet, filters

from main.models.Order import Order

class OrderFilter(FilterSet):
    dateOrder = filters.DateFilter()
    min_total_price = filters.NumberFilter(field_name="totalPrice", lookup_expr='gte')
    max_total_price = filters.NumberFilter(field_name="totalPrice", lookup_expr='lte')

    class Meta:
        model = Order
        fields = ['dateOrder', 'min_total_price', 'max_total_price','is_validated','client']
