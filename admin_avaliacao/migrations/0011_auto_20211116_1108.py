# Generated by Django 3.2.1 on 2021-11-16 14:08

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('admin_avaliacao', '0010_alter_fatores_code'),
    ]

    operations = [
        migrations.AlterField(
            model_name='fatores',
            name='code',
            field=models.IntegerField(default=1, unique=True, verbose_name='Código'),
        ),
        migrations.AlterField(
            model_name='fatores',
            name='name',
            field=models.CharField(max_length=255, verbose_name='Nome'),
        ),
        migrations.AlterField(
            model_name='niveis',
            name='code',
            field=models.IntegerField(default=1, verbose_name='Código'),
        ),
    ]
