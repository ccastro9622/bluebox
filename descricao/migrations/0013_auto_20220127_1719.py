# Generated by Django 3.2.1 on 2022-01-27 20:19

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('admin_descricao', '0014_auto_20220127_1219'),
        ('descricao', '0012_alter_descricao_responsibility'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='descricao',
            name='qualification',
        ),
        migrations.AddField(
            model_name='descricao',
            name='qualification',
            field=models.ManyToManyField(blank=True, default='', null=True, to='admin_descricao.Habilitacoes', verbose_name='Habilitacoes'),
        ),
    ]
