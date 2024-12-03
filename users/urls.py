
from django.urls import path, include
from rest_framework.routers import DefaultRouter

from users.views.ClientView import ClientViewSet



app_name = "users"
router = DefaultRouter()



# Ajouter vos viewsets ici
router = DefaultRouter()
router.register(r'client',ClientViewSet)


urlpatterns = [
    path('', include(router.urls))
]
