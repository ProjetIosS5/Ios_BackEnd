# middleware.py
from threading import local
from rest_framework.request import Request as RestFrameworkRequest
from rest_framework.views import APIView

# Définition du stockage de l'utilisateur dans un objet threading.local
_user = local()

def set_current_user(user):
    """Stocke l'utilisateur actuel dans le contexte du thread."""
    _user.value = user

def get_current_user():
    """Récupère l'utilisateur actuel stocké dans le contexte du thread."""
    return getattr(_user, 'value', None)

class CurrentUserMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        # Initialisation de la requête DRF pour accéder à l'utilisateur
        drf_request: RestFrameworkRequest = APIView().initialize_request(request)
        user = drf_request.user
        # Stockage de l'utilisateur actuel
        set_current_user(user)
        
        # Exécution de la vue ou du middleware suivant
        response = self.get_response(request)
        
        # Nettoyage de l'utilisateur stocké après la fin de la requête
        set_current_user(None)
        
        return response