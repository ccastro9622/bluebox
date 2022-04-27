# Generated by Django 3.2.1 on 2022-04-27 19:09

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('admin_descricao', '0021_auto_20220412_0813'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('descricao', '0017_auto_20220420_1700'),
    ]

    operations = [
        migrations.AlterField(
            model_name='descricao',
            name='manage_team',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, related_name='gerencia', to='admin_descricao.gerencia', verbose_name='Gestão de Equipe'),
        ),
        migrations.AlterField(
            model_name='descricao',
            name='position_team',
            field=models.TextField(blank=True, default='', max_length=1000, null=True, verbose_name='Cargos da Equipe'),
        ),
        migrations.AlterField(
            model_name='descricao',
            name='summary_goal',
            field=models.TextField(blank=True, default='', max_length=1000, null=True, verbose_name='Objetivo do Cargo'),
        ),
        migrations.AlterField(
            model_name='descricao',
            name='user_id',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.PROTECT, related_name='user_id', to=settings.AUTH_USER_MODEL, verbose_name='Elaborador'),
        ),
    ]
