# Generated by Django 4.2 on 2024-12-19 13:48

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0002_order_is_validated_alter_dish_price_and_more'),
    ]

    operations = [
        migrations.RenameField(
            model_name='orderline',
            old_name='idDish',
            new_name='dish',
        ),
    ]
