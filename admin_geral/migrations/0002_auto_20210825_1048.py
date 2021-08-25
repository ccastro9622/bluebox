# Generated by Django 3.2.1 on 2021-08-25 13:48

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('admin_geral', '0001_initial'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='sector',
            options={'verbose_name': 'Setor de Atuação', 'verbose_name_plural': 'Setores de Atuação'},
        ),
        migrations.RemoveField(
            model_name='sector',
            name='detail',
        ),
        migrations.AddField(
            model_name='plans',
            name='is_active',
            field=models.BooleanField(default=True, verbose_name='Ativo'),
        ),
        migrations.AddField(
            model_name='sector',
            name='is_active',
            field=models.BooleanField(default=True, verbose_name='Ativo'),
        ),
        migrations.AlterField(
            model_name='plans',
            name='name',
            field=models.CharField(max_length=255, unique=True, verbose_name='Nome'),
        ),
        migrations.AlterField(
            model_name='sector',
            name='name',
            field=models.CharField(max_length=255, unique=True, verbose_name='Nome'),
        ),
    ]
