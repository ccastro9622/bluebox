# Generated by Django 3.2.1 on 2021-12-09 20:17

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('avaliacao', '0005_alter_avaliacao_title_super'),
    ]

    operations = [
        migrations.AlterField(
            model_name='avaliacao',
            name='title_super',
            field=models.CharField(blank=True, default='', max_length=255, null=True, verbose_name='Cargo do Superior'),
        ),
    ]
