# Generated by Django 3.2.1 on 2022-05-17 10:35

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('avaliacao', '0010_alter_avaliacao_ceo'),
    ]

    operations = [
        migrations.AlterField(
            model_name='avaliacao',
            name='ceo',
            field=models.BooleanField(blank=True, default=False, verbose_name='1º Executivo'),
        ),
    ]
