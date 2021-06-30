# Generated by Django 3.1.6 on 2021-03-07 14:24

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('person', '0001_initial'),
        ('user_account', '0002_auto_20210217_1125'),
    ]

    operations = [
        migrations.AddField(
            model_name='customuser',
            name='person',
            field=models.OneToOneField(blank=True, null=True, on_delete=django.db.models.deletion.PROTECT, to='person.person', verbose_name='Pessoa'),
        ),
    ]
