# Generated by Django 3.2.1 on 2021-11-16 13:35

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('admin_descricao', '0008_gerencia'),
    ]

    operations = [
        migrations.AddField(
            model_name='formacao',
            name='code',
            field=models.IntegerField(default=1, unique=True, verbose_name='Código'),
        ),
    ]
