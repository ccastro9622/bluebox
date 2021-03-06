# Generated by Django 3.2.1 on 2021-08-25 22:30

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('admin_geral', '0002_auto_20210825_1048'),
    ]

    operations = [
        migrations.CreateModel(
            name='Nivelcargo',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255, verbose_name='Nome')),
                ('is_active', models.BooleanField(default=True, verbose_name='Ativo')),
            ],
            options={
                'verbose_name': 'Nivel do Cargo',
                'verbose_name_plural': 'Niveis do Cargo',
            },
        ),
    ]
