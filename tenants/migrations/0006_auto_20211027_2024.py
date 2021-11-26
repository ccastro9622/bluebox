# Generated by Django 3.2.1 on 2021-10-27 23:24

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('admin_geral', '0005_auto_20211027_1241'),
        ('tenants', '0005_auto_20211027_2018'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='tenant',
            name='type',
        ),
        migrations.AddField(
            model_name='tenant',
            name='company',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.PROTECT, to='admin_geral.tipoempresa', verbose_name='Tipo de Empresa'),
        ),
    ]