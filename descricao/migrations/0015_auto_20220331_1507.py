# Generated by Django 3.2.1 on 2022-03-31 18:07

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('descricao', '0014_alter_descricao_proficiency'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='descricao',
            name='supervision',
        ),
        migrations.AlterField(
            model_name='descricao',
            name='information',
            field=models.CharField(blank=True, default='', max_length=255, null=True, verbose_name='Outras Informações'),
        ),
    ]
