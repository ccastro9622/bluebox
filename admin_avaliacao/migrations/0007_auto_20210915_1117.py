# Generated by Django 3.2.1 on 2021-09-15 14:17

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('admin_avaliacao', '0006_auto_20210825_1048'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='niveis',
            options={'verbose_name': 'Fator / Nivel', 'verbose_name_plural': '   Niveis de Avaliação'},
        ),
        migrations.AlterField(
            model_name='fatores',
            name='detail',
            field=models.TextField(blank=True, default='', max_length=255, verbose_name='Descrição'),
        ),
        migrations.AlterField(
            model_name='niveis',
            name='detail',
            field=models.TextField(blank=True, default='', max_length=255, verbose_name='Descrição'),
        ),
    ]