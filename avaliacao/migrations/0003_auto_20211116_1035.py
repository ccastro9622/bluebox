# Generated by Django 3.2.1 on 2021-11-16 13:35

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('admin_avaliacao', '0009_auto_20211116_1035'),
        ('avaliacao', '0002_auto_20211108_2039'),
    ]

    operations = [
        migrations.AlterField(
            model_name='avaliacao',
            name='ceo',
            field=models.BooleanField(default=False, verbose_name='1º Executivo'),
        ),
        migrations.AlterField(
            model_name='avaliacao',
            name='factor1',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.PROTECT, related_name='factor1', to='admin_avaliacao.fatores', verbose_name='Fatores'),
        ),
        migrations.AlterField(
            model_name='avaliacao',
            name='factor2',
            field=models.ForeignKey(default=2, on_delete=django.db.models.deletion.PROTECT, related_name='factor2', to='admin_avaliacao.fatores', verbose_name=' '),
        ),
        migrations.AlterField(
            model_name='avaliacao',
            name='factor3',
            field=models.ForeignKey(default=3, on_delete=django.db.models.deletion.PROTECT, related_name='factor3', to='admin_avaliacao.fatores', verbose_name=' '),
        ),
        migrations.AlterField(
            model_name='avaliacao',
            name='factor4',
            field=models.ForeignKey(default=4, on_delete=django.db.models.deletion.PROTECT, related_name='factor4', to='admin_avaliacao.fatores', verbose_name=' '),
        ),
        migrations.AlterField(
            model_name='avaliacao',
            name='factor5',
            field=models.ForeignKey(default=5, on_delete=django.db.models.deletion.PROTECT, related_name='factor5', to='admin_avaliacao.fatores', verbose_name=' '),
        ),
        migrations.AlterField(
            model_name='avaliacao',
            name='factor6',
            field=models.ForeignKey(default=6, on_delete=django.db.models.deletion.PROTECT, related_name='factor6', to='admin_avaliacao.fatores', verbose_name=' '),
        ),
        migrations.AlterField(
            model_name='avaliacao',
            name='factor7',
            field=models.ForeignKey(default=7, on_delete=django.db.models.deletion.PROTECT, related_name='factor7', to='admin_avaliacao.fatores', verbose_name=' '),
        ),
        migrations.AlterField(
            model_name='avaliacao',
            name='factor8',
            field=models.ForeignKey(default=8, on_delete=django.db.models.deletion.PROTECT, related_name='factor8', to='admin_avaliacao.fatores', verbose_name=' '),
        ),
        migrations.AlterField(
            model_name='avaliacao',
            name='level1',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.PROTECT, related_name='level1', to='admin_avaliacao.niveis', verbose_name='Níveis'),
        ),
        migrations.AlterField(
            model_name='avaliacao',
            name='level2',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.PROTECT, related_name='level2', to='admin_avaliacao.niveis', verbose_name=' '),
        ),
        migrations.AlterField(
            model_name='avaliacao',
            name='level3',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.PROTECT, related_name='level3', to='admin_avaliacao.niveis', verbose_name=' '),
        ),
        migrations.AlterField(
            model_name='avaliacao',
            name='level4',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.PROTECT, related_name='level4', to='admin_avaliacao.niveis', verbose_name=' '),
        ),
        migrations.AlterField(
            model_name='avaliacao',
            name='level5',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.PROTECT, related_name='level5', to='admin_avaliacao.niveis', verbose_name=' '),
        ),
        migrations.AlterField(
            model_name='avaliacao',
            name='level6',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.PROTECT, related_name='level6', to='admin_avaliacao.niveis', verbose_name=' '),
        ),
        migrations.AlterField(
            model_name='avaliacao',
            name='level7',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.PROTECT, related_name='level7', to='admin_avaliacao.niveis', verbose_name=' '),
        ),
        migrations.AlterField(
            model_name='avaliacao',
            name='level8',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.PROTECT, related_name='level8', to='admin_avaliacao.niveis', verbose_name=' '),
        ),
    ]
