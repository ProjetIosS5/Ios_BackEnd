
from rest_framework import serializers
import filetype
import os
import uuid
from io import BytesIO
from django.core.files.uploadedfile import InMemoryUploadedFile

from PIL import Image

class MediaValidatorService:
    def __init__(self, max_size=5242880, allowed_extensions=['jpg', 'jpeg', 'png', 'gif', 'mp4', 'avi', 'mov']):
        self.max_size = max_size
        self.allowed_extensions = allowed_extensions

    def __call__(self, file):
        if file.size > self.max_size:
            raise serializers.ValidationError(f"La taille du fichier ne doit pas dépasser {self.max_size/1048576} Mo.")
        
        ext = os.path.splitext(file.name)[1][1:].lower()
        if ext not in self.allowed_extensions:
            raise serializers.ValidationError(f"Le type de fichier {ext} n'est pas autorisé.")
        
        # Vérification du type de fichier
        kind = filetype.guess(file.read())
        file.seek(0)  # Réinitialiser le curseur du fichier
        if kind is None:
            raise serializers.ValidationError("Le type de fichier n'a pas pu être déterminé.")
        
        allowed_mimes = ['image/jpeg', 'image/png', 'image/gif', 'video/mp4', 'video/x-msvideo', 'video/quicktime']
        if kind.mime not in allowed_mimes:
            raise serializers.ValidationError(f"Le type MIME {kind.mime} n'est pas autorisé.")

        # Vérification et compression des images
        if kind.mime.startswith('image'):
            with Image.open(file) as img:
                if img.width > 4000 or img.height > 4000:
                    raise serializers.ValidationError("La résolution de l'image ne doit pas dépasser 4000x4000 pixels.")
                
                # Compression si nécessaire
                if file.size > 1048576:  # Si plus de 1 Mo
                    output = BytesIO()
                    img.save(output, format='JPEG', quality=85)
                    output.seek(0)
                    return InMemoryUploadedFile(output, 'ImageField', f"{uuid.uuid4().hex}.jpg", 'image/jpeg', output.getbuffer().nbytes, None)

        return file
