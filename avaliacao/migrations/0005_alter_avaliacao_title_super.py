# Generated by Django 3.2.1 on 2021-11-26 21:42

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('admin_descricao', '0009_formacao_code'),
        ('avaliacao', '0004_auto_20211118_1506'),
    ]

    operations = [
        migrations.AlterField(
            model_name='avaliacao',
            name='title_super',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.PROTECT, to='admin_descricao.descricoes', verbose_name='Cargo do Superior'),
        ),
    ]
