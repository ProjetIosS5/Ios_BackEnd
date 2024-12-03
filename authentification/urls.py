
from django.urls import path, include
from rest_framework.routers import DefaultRouter
from authentification.views.AuthUserView import AuthUserViews

app_name = "authentification"
router = DefaultRouter()



# Ajouter vos viewsets ici
router.register(r'authUser', AuthUserViews)
# Exemple: router.register(r'example', ExampleViewSet)

urlpatterns = [
    path('', include(router.urls)),
]
