# Generated by Django 3.2.1 on 2021-06-23 21:33

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('tenants', '0001_initial'),
        ('user_account', '0010_alter_customuser_default_tenant'),
    ]

    operations = [
        migrations.AlterField(
            model_name='customuser',
            name='default_tenant',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='default_tenant', to='tenants.tenant'),
        ),
    ]
