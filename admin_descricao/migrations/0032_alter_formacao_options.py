# Generated by Django 3.2.1 on 2023-05-25 12:13

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('admin_descricao', '0031_auto_20230403_1905'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='formacao',
            options={'ordering': ['code'], 'verbose_name': 'Formação', 'verbose_name_plural': 'Formações'},
        ),
    ]
