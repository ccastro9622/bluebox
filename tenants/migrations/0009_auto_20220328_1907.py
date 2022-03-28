# Generated by Django 3.2.1 on 2022-03-28 22:07

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('tenants', '0008_auto_20220328_1906'),
    ]

    operations = [
        migrations.AlterField(
            model_name='tenant',
            name='employees',
            field=models.IntegerField(default=0, verbose_name='Colaboradores Próprios'),
        ),
        migrations.AlterField(
            model_name='tenant',
            name='outsource',
            field=models.IntegerField(default=0, verbose_name='Colaboradores Terceirizados'),
        ),
    ]
