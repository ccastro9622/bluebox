# Generated by Django 3.2.1 on 2022-10-03 13:21

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('admin_avaliacao', '0017_alter_combinacoes_grade'),
        ('avaliacao', '0015_alter_avaliacao_grade'),
    ]

    operations = [
        migrations.AlterField(
            model_name='avaliacao',
            name='grade',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, related_name='Grade', to='admin_avaliacao.combinacoes', verbose_name='Grade'),
        ),
    ]
