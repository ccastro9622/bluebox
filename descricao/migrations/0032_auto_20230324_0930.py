# Generated by Django 3.2.1 on 2023-03-24 12:30

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('admin_descricao', '0028_auto_20230313_1505'),
        ('descricao', '0031_auto_20230313_1039'),
    ]

    operations = [
        migrations.AlterField(
            model_name='descricao',
            name='area_specialization',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.PROTECT, related_name='area_specialization_1', to='admin_descricao.areas', verbose_name='Área de Formação Complementar 1'),
        ),
        migrations.AlterField(
            model_name='descricao',
            name='area_specialization2',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.PROTECT, related_name='area_specialization_2', to='admin_descricao.areas', verbose_name='Área de Formação Complementar 2'),
        ),
        migrations.AlterField(
            model_name='descricao',
            name='area_specialization3',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.PROTECT, related_name='area_specialization_3', to='admin_descricao.areas', verbose_name='Área de Formação Complementar 3'),
        ),
        migrations.AlterField(
            model_name='descricao',
            name='area_specialization4',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.PROTECT, related_name='area_specialization_4', to='admin_descricao.areas', verbose_name='Área de Formação Complementar 4'),
        ),
    ]
