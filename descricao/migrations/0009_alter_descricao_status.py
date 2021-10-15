# Generated by Django 3.2.1 on 2021-10-04 19:24

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('admin_descricao', '0007_status'),
        ('descricao', '0008_auto_20210726_2008'),
    ]

    operations = [
        migrations.AlterField(
            model_name='descricao',
            name='status',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, related_name='status', to='admin_descricao.status', verbose_name='Status'),
        ),
    ]
