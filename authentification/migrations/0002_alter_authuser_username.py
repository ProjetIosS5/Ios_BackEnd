# Generated by Django 4.2 on 2024-12-10 00:52

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('authentification', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='authuser',
            name='username',
            field=models.CharField(max_length=50, null=True),
        ),
    ]
