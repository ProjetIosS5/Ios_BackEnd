
from django.db import models
from django.contrib.auth.models import (
    AbstractUser,
    Group as DjangoGroup,
    GroupManager as DjangoGroupManager,
    Permission as DjangoPermission,
    PermissionManager as DjangoPermissionManager,
)
from django.utils.translation import gettext_lazy as _


from common.managers import CustomManager
from common.models.baseModel import BaseModel


class PermissionManager(CustomManager, DjangoPermissionManager):
    """
    Custom the manager for the auth's Permission model.
    """
    pass


class Permission(BaseModel, DjangoPermission):
    """
    This class represents the custom Permission of user.
    """

    objects = PermissionManager()


class GroupManager(CustomManager, DjangoGroupManager):
    """
    Custom the manager for the auth's Group model.
    """
    pass


class Group(BaseModel, DjangoGroup):
    """
    This class represents the custom Group of user.
    """

    objects = GroupManager()


class AuthUser(AbstractUser):
    """
    An abstract base class implementing a complete user model with
    administrator-compliant permissions.

    User inherits from AbstractUser which in turn inherits from PermissionsMixin.
    This adds the necessary fields and methods to support group and authorization
    models using ModelBackend.
    """
    
    email = models.EmailField(
		_("email address"),
		unique=True,
        null=False,
		error_messages={
			"unique": _("A user with that email already exists."),
		},
	)
    password = models.CharField(verbose_name=_("password"), max_length=128)
    role = models.CharField(max_length=20, choices=[('client', 'Client'), ('vendeur', 'Vendeur'), ('admin', 'Administrateur')])
    reset_token = models.CharField(max_length=255, blank=True, null=True)
    is_connected=models.BooleanField(default=False)
       
    groups = models.ManyToManyField(
        Group,
        verbose_name=_("groups"),
        blank=True,
        help_text=_(
            "The groups this user belongs to. A user will get all permissions "
            "granted to each of their groups."
        ),
        related_name="user",
        related_query_name="user",
    )
    user_permissions = models.ManyToManyField(
		Permission,
		verbose_name=_("user permissions"),
		blank=True,
		help_text=_("Specific permissions for this user."),
		related_name="user",
		related_query_name="user",
	)
  
    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['password','role']
 
    def __str__(self):
        return f"{self.get_full_name()} ({self.get_username()})"

    class Meta(AbstractUser.Meta):
        ordering = ['-date_joined']
