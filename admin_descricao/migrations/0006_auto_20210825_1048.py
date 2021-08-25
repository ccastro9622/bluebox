# Generated by Django 3.2.1 on 2021-08-25 13:48

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('admin_descricao', '0005_auto_20210824_2010'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='descricoes',
            options={'verbose_name': ' Modelo de Descrição', 'verbose_name_plural': 'Modelo de Descrições'},
        ),
        migrations.RemoveField(
            model_name='habilitacoes',
            name='detail',
        ),
        migrations.AddField(
            model_name='areas',
            name='is_active',
            field=models.BooleanField(default=True, verbose_name='Ativo'),
        ),
        migrations.AddField(
            model_name='especializacoes',
            name='is_active',
            field=models.BooleanField(default=True, verbose_name='Ativo'),
        ),
        migrations.AddField(
            model_name='formacao',
            name='is_active',
            field=models.BooleanField(default=True, verbose_name='Ativo'),
        ),
        migrations.AddField(
            model_name='habilitacoes',
            name='is_active',
            field=models.BooleanField(default=True, verbose_name='Ativo'),
        ),
        migrations.AddField(
            model_name='idiomas',
            name='is_active',
            field=models.BooleanField(default=True, verbose_name='Ativo'),
        ),
        migrations.AlterField(
            model_name='areas',
            name='name',
            field=models.CharField(max_length=255, unique=True, verbose_name='Nome'),
        ),
        migrations.AlterField(
            model_name='descricoes',
            name='title',
            field=models.CharField(max_length=255, unique=True, verbose_name='Título do Cargo'),
        ),
        migrations.AlterField(
            model_name='especializacoes',
            name='name',
            field=models.CharField(max_length=255, unique=True, verbose_name='Nome'),
        ),
        migrations.AlterField(
            model_name='experiencias',
            name='name',
            field=models.CharField(max_length=255, unique=True, verbose_name='Nome'),
        ),
        migrations.AlterField(
            model_name='formacao',
            name='name',
            field=models.CharField(max_length=255, unique=True, verbose_name='Nome'),
        ),
        migrations.AlterField(
            model_name='habilitacoes',
            name='name',
            field=models.CharField(max_length=255, unique=True, verbose_name='Nome'),
        ),
        migrations.AlterField(
            model_name='idiomas',
            name='name',
            field=models.CharField(max_length=255, unique=True, verbose_name='Nome'),
        ),
    ]
