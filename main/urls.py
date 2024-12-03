
from django.urls import path, include
from rest_framework.routers import DefaultRouter

from main.views.DishView import DishViewSet
from main.views.OrderLineView import OrderLineViewSet
from main.views.OrderView import OrderViewSet





app_name = "main"
router = DefaultRouter()



# Ajouter vos viewsets ici
router = DefaultRouter()
router.register(r'Dish',DishViewSet)
router.register(r'Order',OrderViewSet)
router.register(r'OrderLine',OrderLineViewSet)

urlpatterns = [
    path('', include(router.urls))
]
