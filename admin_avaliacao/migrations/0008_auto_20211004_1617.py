# Generated by Django 3.2.1 on 2021-10-04 19:17

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('admin_avaliacao', '0007_auto_20210915_1117'),
    ]

    operations = [
        migrations.AlterField(
            model_name='fatores',
            name='detail',
            field=models.TextField(blank=True, default='', max_length=1000, verbose_name='Descrição'),
        ),
        migrations.AlterField(
            model_name='niveis',
            name='detail',
            field=models.TextField(blank=True, default='', max_length=1000, verbose_name='Descrição'),
        ),
    ]
