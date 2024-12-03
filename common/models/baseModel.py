from django.db import models
from django.db.models.signals import (
    pre_delete, post_delete
)
from django.utils.translation import gettext_lazy as _
from django.utils import timezone

from common.managers import CustomManager


class BaseModel(models.Model):
    """
    This class is a class from which all the other classes in the system will inherit.
    """
    created_at = models.DateTimeField(_("create at"), auto_now_add=True)
    updated_at = models.DateTimeField(_("updated at"), auto_now=True)
    deleted_at = models.DateTimeField(_("deleted at"), blank=True, null=True)

    # Custom manager for all models (exclude object with attribut deleted_at=None)
    objects = CustomManager()
    # Custom manager for all models (without exclusion of object)
    all_objects = models.Manager()

    def delete(self, using=None, keep_parents=False, *args, **kwargs):
        """
        Enables safe deletion.
        Sets deleted_at Attribute.
        """

        # Emit the pre_delete signal
        pre_delete.send(sender=self.__class__, instance=self, **kwargs)

        self.deleted_at = timezone.now()
        self.save()

        # Emit the post_delete signal
        post_delete.send(sender=self.__class__, instance=self, **kwargs)

    class Meta:
        abstract = True
        ordering = ['-created_at']

        indexes = [
            # Descending sort index for the "created_at" field
            models.Index(fields=['-created_at']),
        ]
