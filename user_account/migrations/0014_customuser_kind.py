# Generated by Django 3.2.1 on 2021-08-25 23:03

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('user_account', '0013_alter_customuser_default_tenant'),
    ]

    operations = [
        migrations.AddField(
            model_name='customuser',
            name='kind',
            field=models.CharField(choices=[('Master', 'Master'), ('Comum', 'Comum')], default='Comum', max_length=20, verbose_name='Tipo de Usuário'),
        ),
    ]
