# Generated by Django 3.2.1 on 2022-01-27 15:19

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('admin_avaliacao', '0011_auto_20211116_1108'),
    ]

    operations = [
        migrations.AlterField(
            model_name='familias',
            name='detail',
            field=models.TextField(blank=True, default='', max_length=1000, verbose_name='Descrição'),
        ),
        migrations.AlterField(
            model_name='subfamilias',
            name='detail',
            field=models.TextField(blank=True, default='', max_length=1000, verbose_name='Descrição'),
        ),
    ]
