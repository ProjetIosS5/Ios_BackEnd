from rest_framework import viewsets
from authentification.models import AuthUser
from authentification.serializers.AuthUserSerializer import *
from rest_framework.exceptions import AuthenticationFailed
from rest_framework_simplejwt.tokens import RefreshToken
from rest_framework.response import Response
from rest_framework.permissions import AllowAny, IsAuthenticated
from rest_framework.decorators import action
import secrets
from rest_framework import status
from django.contrib.auth.hashers import make_password
from datetime import timedelta
from django.utils import timezone
import re

from utils.pagination_utils import CustomPageNumberPagination
from rest_framework_simplejwt.tokens import AccessToken
import logging
from django.core.cache import cache

# Crée un dictionnaire pour stocker les jetons de réinitialisation et leurs expirations
token_expiration_dict = {}
logger = logging.getLogger(__name__)

class AuthUserViews(viewsets.ModelViewSet):
    queryset = AuthUser.objects.all()
    serializer_class = AuthUserRequestSerializer
    pagination_class=CustomPageNumberPagination

    action_serializer_classes = {
        "create": AuthUserRequestSerializer,
        "update": AuthUserRequestSerializer,
        "retrieve": AuthUserRequestSerializer,
        "list": AuthUserResponseSerializer,
        "partial_update": AuthUserRequestSerializer,
        "connexion": ConnexionSerializer,
        "reinitialiser_password_request": ResetPasswordRequestSerializer,
        "reinitialiser_password_confirm": ResetPasswordConfirmSerializer,
    }

    action_permission_classes = {
        "create": [AllowAny],
        "update": [IsAuthenticated],
        "retrieve": [IsAuthenticated],
        "list": [IsAuthenticated],
        "partial_update": [IsAuthenticated],
        "destroy": [IsAuthenticated],
        "connexion": [AllowAny],
        "reinitialiser_password_request": [AllowAny],
        "reinitialiser_password_confirm": [AllowAny],
    }

    def perform_create(self, serializer):
        try:
            user = serializer.save()
            user.set_password(serializer.validated_data['password'])
            user.save()
        except Exception as e:
            print("Erreur lors de la création de l'utilisateur:", e)
            raise
        
    def get_serializer_context(self):
        return {'request': self.request}

    def get_serializer_class(self):
        try:
            return self.action_serializer_classes[self.action]
        except (KeyError, AttributeError):
            print("---Exception occurred---")
            return super(AuthUserViews, self).get_serializer_class()
        
    @action(detail=False, methods=['post'], url_path='connexion')
    def connexion(self, request):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        data = serializer.validated_data

        email = data.get('email')
        password = data.get('password')

        if not (email) or not password:
            return Response({'error': 'email et password sont requis.'}, status=status.HTTP_400_BAD_REQUEST)

        user = None
        now = timezone.now()
        if email:
            if not re.match(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$', email):
                return Response({'error': 'Le format de l\'email est incorrect.'}, status=status.HTTP_400_BAD_REQUEST)
            user = AuthUser.objects.filter(email=email).first()
            if user is None:
                raise AuthenticationFailed('Aucun Utilisateur Trouvé avec cet email.')

        if user and not user.check_password(password):
            raise AuthenticationFailed('Mot de Passe Incorrect!')

        if user:
            user.last_login = now
            user.is_connected = True
            user.save()
            refresh = RefreshToken.for_user(user)
            return Response({'jwt': str(refresh.access_token)})

        return Response({'error': 'Authentification échouée.'}, status=status.HTTP_400_BAD_REQUEST)

    @action(detail=False, methods=['post'], url_path='reinitialiser_password_request')
    def reinitialiser_password_request(self, request):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        data = serializer.validated_data

        attempt_key = f'reset_password_attempts_{email}'
        failed_attempts = cache.get(attempt_key, 0)
        max_attempts = 3

        if failed_attempts >= max_attempts:
            cooldown_start_time = cache.get(attempt_key + '_start_time', None)

            if cooldown_start_time is not None:
                cooldown_duration = 1800  # 30 minutes en secondes
                elapsed_time = timezone.now() - cooldown_start_time
                cooldown_remaining = max(0, cooldown_duration - elapsed_time.seconds)

                return Response({
                    'error': 'Un nombre excessif de tentatives infructueuses a été enregistré. Veuillez patienter pendant 30 minutes avant de tenter à nouveau.',
                    'attempts': failed_attempts,
                    'max_attempts': max_attempts,
                    'time_remaining': cooldown_remaining
                }, status=status.HTTP_429_TOO_MANY_REQUESTS)

        try:
            user = Utilisateur.objects.get(email=email)
        except Utilisateur.DoesNotExist:
            cache.set(attempt_key, failed_attempts + 1, 1800)
            cache.set(attempt_key + '_start_time', timezone.now())

            return Response({
                'error': f'Utilisateur non trouvé. Tentative {failed_attempts + 1} sur {max_attempts}.',
                'attempts': failed_attempts + 1,
                'max_attempts': max_attempts,
            }, status=status.HTTP_404_NOT_FOUND)

        cache.delete(attempt_key)
        cache.delete(attempt_key + '_start_time')

        reset_token = secrets.token_urlsafe(32)
        user.reset_token = reset_token
        user.save()

        expiration_duration = timedelta(seconds=60)
        token_expiration_dict[reset_token] = timezone.now() + expiration_duration

        return Response({
            'reset_token': reset_token,
            'expiration_time': expiration_duration.seconds,
            'attempts': 0,
            'max_attempts': max_attempts,
        }, status=status.HTTP_200_OK)

    @action(detail=False, methods=['post'], url_path='reinitialiser_password_confirm')
    def reinitialiser_password_confirm(self, request):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        data = serializer.validated_data

        reset_token = data['reset_token']
        new_password = data['new_password']

        if not email or not reset_token or not new_password:
            return Response({'error': 'Données de requête incomplètes'}, status=status.HTTP_400_BAD_REQUEST)

        try:
            user = Utilisateur.objects.get(email=email, reset_token=reset_token)
        except Utilisateur.DoesNotExist:
            return Response({'error': 'Utilisateur non trouvé ou jeton invalide'}, status=status.HTTP_404_NOT_FOUND)

        if not user.reset_token or user.reset_token != reset_token or reset_token not in token_expiration_dict or token_expiration_dict[reset_token] < timezone.now():
            return Response({'error': 'Le jeton a expiré ou est invalide'}, status=status.HTTP_400_BAD_REQUEST)

        user.password = make_password(new_password)
        user.reset_token = None
        user.save()
        del token_expiration_dict[reset_token]

        return Response({'message': 'Mot de passe mis à jour avec succès'}, status=status.HTTP_200_OK)
    
    @action(detail=False, methods=['post'])
    def logout(self, request):
        try:
            # Récupérer le token d'accès depuis les données de la requête
            access_token = request.data.get("access", None)
            if not access_token:
                logger.error("No access token provided")
                return Response({"error": "No access token provided"}, status=status.HTTP_400_BAD_REQUEST)

            token = AccessToken(access_token)

            # Récupérer l'utilisateur à partir de l'ID inclus dans le token
            user_id = token['id']
            user = AuthUser.objects.get(id=user_id)

            # Définir l'utilisateur comme déconnecté
            user.is_connected = False
            user.save()

            logger.info(f"User {user_id} logged out successfully")
            return Response(status=status.HTTP_205_RESET_CONTENT)
        except Exception as e:
            logger.error(f"Error during logout: {e}")
            return Response({"error": str(e)}, status=status.HTTP_400_BAD_REQUEST)