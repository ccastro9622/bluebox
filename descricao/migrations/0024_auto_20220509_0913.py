# Generated by Django 3.2.1 on 2022-05-09 12:13

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('admin_descricao', '0023_auto_20220509_0913'),
        ('admin_avaliacao', '0014_auto_20220331_1459'),
        ('master', '0008_auto_20220331_1459'),
        ('descricao', '0023_auto_20220428_1206'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='descricao',
            name='summary',
        ),
        migrations.RemoveField(
            model_name='descricao',
            name='summary_coverage',
        ),
        migrations.AddField(
            model_name='descricao',
            name='areas_desired2',
            field=models.ForeignKey(blank=True, default='', null=True, on_delete=django.db.models.deletion.PROTECT, related_name='areas_desired_2', to='admin_descricao.areas', verbose_name='Area Desejada 2'),
        ),
        migrations.AddField(
            model_name='descricao',
            name='areas_desired3',
            field=models.ForeignKey(blank=True, default='', null=True, on_delete=django.db.models.deletion.PROTECT, related_name='areas_desired_3', to='admin_descricao.areas', verbose_name='Area Desejada 3'),
        ),
        migrations.AddField(
            model_name='descricao',
            name='areas_desired4',
            field=models.ForeignKey(blank=True, default='', null=True, on_delete=django.db.models.deletion.PROTECT, related_name='areas_desired_4', to='admin_descricao.areas', verbose_name='Area Desejada 3'),
        ),
        migrations.AlterField(
            model_name='descricao',
            name='area',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.PROTECT, to='master.area', verbose_name='Subárea'),
        ),
        migrations.AlterField(
            model_name='descricao',
            name='areas_desired',
            field=models.ForeignKey(blank=True, default='', null=True, on_delete=django.db.models.deletion.PROTECT, related_name='areas_desired_1', to='admin_descricao.areas', verbose_name='Area Desejada 1'),
        ),
        migrations.AlterField(
            model_name='descricao',
            name='board',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.PROTECT, to='master.diretoria', verbose_name='Área'),
        ),
        migrations.AlterField(
            model_name='descricao',
            name='family',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.PROTECT, to='admin_avaliacao.familias', verbose_name='Família do Cargo'),
        ),
        migrations.AlterField(
            model_name='descricao',
            name='formation',
            field=models.ForeignKey(default='', null=True, on_delete=django.db.models.deletion.PROTECT, related_name='formation', to='admin_descricao.formacao', verbose_name='Grau de Escolaridade Obrigatório'),
        ),
        migrations.AlterField(
            model_name='descricao',
            name='responsibility',
            field=models.TextField(default='', max_length=1000, null=True, verbose_name='Principais Responsabilidades'),
        ),
        migrations.AlterField(
            model_name='descricao',
            name='sub_familia',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.PROTECT, to='admin_avaliacao.subfamilias', verbose_name='SubFamília do Cargo'),
        ),
        migrations.AlterField(
            model_name='descricao',
            name='summary_goal',
            field=models.TextField(default='', max_length=1000, null=True, verbose_name='Missão do Cargo'),
        ),
        migrations.AlterField(
            model_name='descricao',
            name='title_super',
            field=models.CharField(default='', max_length=255, null=True, verbose_name='Título do Cargo do Superior Imediato'),
        ),
    ]