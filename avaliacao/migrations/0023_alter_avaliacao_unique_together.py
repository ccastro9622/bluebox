# Generated by Django 5.0.4 on 2024-04-08 21:52

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('avaliacao', '0022_alter_avaliacao_title'),
        ('tenants', '0017_alter_tenant_states'),
    ]

    operations = [
        migrations.AlterUniqueTogether(
            name='avaliacao',
            unique_together={('title', 'tenant')},
        ),
    ]
