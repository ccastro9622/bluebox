# Generated by Django 3.2.1 on 2021-11-08 23:39

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('admin_descricao', '0008_gerencia'),
        ('admin_avaliacao', '0008_auto_20211004_1617'),
        ('admin_geral', '0005_auto_20211027_1241'),
        ('avaliacao', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='avaliacao',
            name='factor',
        ),
        migrations.RemoveField(
            model_name='avaliacao',
            name='level',
        ),
        migrations.AddField(
            model_name='avaliacao',
            name='ceo',
            field=models.BooleanField(default=False, verbose_name='CEO'),
        ),
        migrations.AddField(
            model_name='avaliacao',
            name='company',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.PROTECT, to='admin_geral.tipoempresa', verbose_name='Tipo de Empresa'),
        ),
        migrations.AddField(
            model_name='avaliacao',
            name='factor1',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.PROTECT, related_name='factor1', to='admin_avaliacao.fatores', verbose_name='Abrangência'),
        ),
        migrations.AddField(
            model_name='avaliacao',
            name='factor2',
            field=models.ForeignKey(default=2, on_delete=django.db.models.deletion.PROTECT, related_name='factor2', to='admin_avaliacao.fatores', verbose_name='Comunicação'),
        ),
        migrations.AddField(
            model_name='avaliacao',
            name='factor3',
            field=models.ForeignKey(default=3, on_delete=django.db.models.deletion.PROTECT, related_name='factor3', to='admin_avaliacao.fatores', verbose_name='Contribuição'),
        ),
        migrations.AddField(
            model_name='avaliacao',
            name='factor4',
            field=models.ForeignKey(default=4, on_delete=django.db.models.deletion.PROTECT, related_name='factor4', to='admin_avaliacao.fatores', verbose_name='Escopo'),
        ),
        migrations.AddField(
            model_name='avaliacao',
            name='factor5',
            field=models.ForeignKey(default=5, on_delete=django.db.models.deletion.PROTECT, related_name='factor5', to='admin_avaliacao.fatores', verbose_name='Formacão'),
        ),
        migrations.AddField(
            model_name='avaliacao',
            name='factor6',
            field=models.ForeignKey(default=6, on_delete=django.db.models.deletion.PROTECT, related_name='factor6', to='admin_avaliacao.fatores', verbose_name='Gestão'),
        ),
        migrations.AddField(
            model_name='avaliacao',
            name='factor7',
            field=models.ForeignKey(default=7, on_delete=django.db.models.deletion.PROTECT, related_name='factor7', to='admin_avaliacao.fatores', verbose_name='Liderança'),
        ),
        migrations.AddField(
            model_name='avaliacao',
            name='factor8',
            field=models.ForeignKey(default=8, on_delete=django.db.models.deletion.PROTECT, related_name='factor8', to='admin_avaliacao.fatores', verbose_name='Nivel Organizacional'),
        ),
        migrations.AddField(
            model_name='avaliacao',
            name='family',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.PROTECT, to='admin_avaliacao.familias', verbose_name='Familia'),
        ),
        migrations.AddField(
            model_name='avaliacao',
            name='formation',
            field=models.ForeignKey(blank=True, default='', null=True, on_delete=django.db.models.deletion.PROTECT, to='admin_descricao.formacao', verbose_name='Formacao'),
        ),
        migrations.AddField(
            model_name='avaliacao',
            name='governanca',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.PROTECT, to='admin_geral.governanca', verbose_name='Governança'),
        ),
        migrations.AddField(
            model_name='avaliacao',
            name='level1',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.PROTECT, related_name='level1', to='admin_avaliacao.niveis', verbose_name='Nível'),
        ),
        migrations.AddField(
            model_name='avaliacao',
            name='level2',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.PROTECT, related_name='level2', to='admin_avaliacao.niveis', verbose_name='Nível'),
        ),
        migrations.AddField(
            model_name='avaliacao',
            name='level3',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.PROTECT, related_name='level3', to='admin_avaliacao.niveis', verbose_name='Nível'),
        ),
        migrations.AddField(
            model_name='avaliacao',
            name='level4',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.PROTECT, related_name='level4', to='admin_avaliacao.niveis', verbose_name='Nível'),
        ),
        migrations.AddField(
            model_name='avaliacao',
            name='level5',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.PROTECT, related_name='level5', to='admin_avaliacao.niveis', verbose_name='Nível'),
        ),
        migrations.AddField(
            model_name='avaliacao',
            name='level6',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.PROTECT, related_name='level6', to='admin_avaliacao.niveis', verbose_name='Nível'),
        ),
        migrations.AddField(
            model_name='avaliacao',
            name='level7',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.PROTECT, related_name='level7', to='admin_avaliacao.niveis', verbose_name='Nível'),
        ),
        migrations.AddField(
            model_name='avaliacao',
            name='level8',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.PROTECT, related_name='level8', to='admin_avaliacao.niveis', verbose_name='Nível'),
        ),
        migrations.AddField(
            model_name='avaliacao',
            name='manage_team',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.PROTECT, to='admin_descricao.gerencia', verbose_name='Gerencia'),
        ),
        migrations.AddField(
            model_name='avaliacao',
            name='origin',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.PROTECT, to='admin_geral.origemcapital', verbose_name='Origem de Capital'),
        ),
        migrations.AddField(
            model_name='avaliacao',
            name='size',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.PROTECT, to='admin_geral.dimensao', verbose_name='Dimensão'),
        ),
        migrations.AddField(
            model_name='avaliacao',
            name='sub_familia',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.PROTECT, to='admin_avaliacao.subfamilias', verbose_name='SubFamilia'),
        ),
        migrations.AddField(
            model_name='avaliacao',
            name='title_super',
            field=models.CharField(blank=True, default='', max_length=255, null=True, verbose_name='Cargo do Superior'),
        ),
    ]
