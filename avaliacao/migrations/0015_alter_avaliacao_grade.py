# Generated by Django 3.2.1 on 2022-10-03 12:50

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('avaliacao', '0014_alter_avaliacao_manage_team'),
    ]

    operations = [
        migrations.AlterField(
            model_name='avaliacao',
            name='grade',
            field=models.CharField(default='', max_length=5, null=True, verbose_name='Grade'),
        ),
    ]
