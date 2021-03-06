# Generated by Django 3.2.1 on 2022-03-21 18:09

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('admin_descricao', '0015_alter_gerencia_name'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='especializacoes',
            options={'verbose_name': 'Formação Complementar', 'verbose_name_plural': 'Formações Complementares'},
        ),
        migrations.AlterModelOptions(
            name='gerencia',
            options={'verbose_name': 'Gestão de Equipe', 'verbose_name_plural': 'Gestão de Equipes'},
        ),
        migrations.AddField(
            model_name='descricoes',
            name='formation2',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.PROTECT, related_name='Formacao2', to='admin_descricao.formacao', verbose_name='Formação 2'),
        ),
        migrations.AddField(
            model_name='descricoes',
            name='formation3',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.PROTECT, related_name='Formacao3', to='admin_descricao.formacao', verbose_name='Formação 3'),
        ),
        migrations.AddField(
            model_name='descricoes',
            name='formation4',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.PROTECT, related_name='Formacao4', to='admin_descricao.formacao', verbose_name='Formação 4'),
        ),
        migrations.AlterField(
            model_name='descricoes',
            name='formation',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, related_name='Formacao', to='admin_descricao.formacao', verbose_name='Formação'),
        ),
        migrations.AlterField(
            model_name='descricoes',
            name='specialization',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.PROTECT, to='admin_descricao.especializacoes', verbose_name='Formação Complementar'),
        ),
        migrations.AlterField(
            model_name='status',
            name='name',
            field=models.CharField(default='', max_length=255, unique=True, verbose_name='Nome'),
        ),
    ]
