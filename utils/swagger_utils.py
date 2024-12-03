from rest_framework import permissions
from drf_yasg.views import get_schema_view
from drf_yasg import openapi

schema_view = get_schema_view(
    openapi.Info(
        title="Ios_Back_end PROJECT",
        default_version='v1',
        description="Api pour la gestion des commandes de Restaurant",
        terms_of_service="N/A",
        contact=openapi.Contact(email="majoiefaya@gmail.com"),
        license=openapi.License(name="IUT BM License"),
    ),
    public=True,
    permission_classes=(permissions.AllowAny,),
)
