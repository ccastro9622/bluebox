# Generated by Django 3.2.1 on 2022-03-21 18:09

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('admin_descricao', '0016_auto_20220321_1509'),
        ('admin_avaliacao', '0013_auto_20220321_1509'),
        ('avaliacao', '0008_alter_avaliacao_title_super'),
    ]

    operations = [
        migrations.AlterField(
            model_name='avaliacao',
            name='factor1',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.PROTECT, related_name='factor1', to='admin_avaliacao.fatores', verbose_name='Fatores de Avaliação'),
        ),
        migrations.AlterField(
            model_name='avaliacao',
            name='manage_team',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='admin_descricao.gerencia', verbose_name='Gestão de Equipe'),
        ),
        migrations.AlterField(
            model_name='avaliacao',
            name='title',
            field=models.CharField(default='', max_length=255, unique=True, verbose_name='Título do Cargo'),
        ),
        migrations.AlterField(
            model_name='avaliacao',
            name='title_super',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.PROTECT, to='avaliacao.superior', verbose_name='Cargo Superior Imediato'),
        ),
    ]
