# mixins.py
from django.db import models
from django.utils import timezone
from django.db.models.signals import pre_delete, post_delete

class TimeStampedModelMixin(models.Model):
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    deleted_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        abstract = True

    def delete(self, using=None, keep_parents=False, *args, **kwargs):
        """
        Permet la suppression sécurisée.
        Définit l'attribut deleted_at.
        """
        pre_delete.send(sender=self.__class__, instance=self, **kwargs)
        self.deleted_at = timezone.now()
        self.save()
        post_delete.send(sender=self.__class__, instance=self, **kwargs)
