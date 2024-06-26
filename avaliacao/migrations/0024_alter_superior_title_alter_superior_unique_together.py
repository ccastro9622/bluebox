# Generated by Django 5.0.4 on 2024-04-09 17:29

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('avaliacao', '0023_alter_avaliacao_unique_together'),
        ('tenants', '0017_alter_tenant_states'),
    ]

    operations = [
        migrations.AlterField(
            model_name='superior',
            name='title',
            field=models.CharField(default='', max_length=255, verbose_name='Nome'),
        ),
        migrations.AlterUniqueTogether(
            name='superior',
            unique_together={('title', 'tenant')},
        ),
    ]
