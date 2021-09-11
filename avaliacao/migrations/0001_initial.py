# Generated by Django 3.2.1 on 2021-08-24 23:10

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('admin_avaliacao', '0005_auto_20210824_2010'),
        ('master', '0003_alter_area_name'),
        ('tenants', '0003_auto_20210708_1547'),
    ]

    operations = [
        migrations.CreateModel(
            name='Avaliacao',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(default='', max_length=255, unique=True, verbose_name='Nome')),
                ('area', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.PROTECT, to='master.area', verbose_name='Area')),
                ('board', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.PROTECT, to='master.diretoria', verbose_name='Diretoria')),
                ('factor', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='admin_avaliacao.fatores', verbose_name='Fator')),
                ('level', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='admin_avaliacao.niveis', verbose_name='Nível')),
                ('tenant', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='tenants.tenant')),
            ],
            options={
                'verbose_name': 'Avaliacao',
                'verbose_name_plural': 'Avaliacao',
            },
        ),
    ]