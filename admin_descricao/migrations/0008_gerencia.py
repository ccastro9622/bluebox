# Generated by Django 3.2.1 on 2021-10-27 15:41

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('admin_descricao', '0007_status'),
    ]

    operations = [
        migrations.CreateModel(
            name='Gerencia',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255, unique=True, verbose_name='Nome')),
            ],
            options={
                'verbose_name': 'Gerencia',
                'verbose_name_plural': 'Gerencias',
            },
        ),
    ]
