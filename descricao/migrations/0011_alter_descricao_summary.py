# Generated by Django 3.2.1 on 2022-01-27 19:10

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('descricao', '0010_alter_descricao_manage_team'),
    ]

    operations = [
        migrations.AlterField(
            model_name='descricao',
            name='summary',
            field=models.TextField(blank=True, default='', max_length=1000, null=True, verbose_name='Atividades'),
        ),
    ]
