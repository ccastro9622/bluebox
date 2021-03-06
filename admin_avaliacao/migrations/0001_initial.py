# Generated by Django 3.1.6 on 2021-04-01 00:52

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Familias',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255, verbose_name='Nome')),
                ('detail', models.CharField(blank=True, default='', max_length=255, verbose_name='Descrição')),
            ],
            options={
                'verbose_name': 'Familia',
                'verbose_name_plural': 'Familias',
            },
        ),
        migrations.CreateModel(
            name='Fatores',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255, verbose_name='Nome')),
                ('detail', models.CharField(blank=True, default='', max_length=255, verbose_name='Descrição')),
            ],
            options={
                'verbose_name': 'Fator',
                'verbose_name_plural': 'Fatores',
            },
        ),
        migrations.CreateModel(
            name='Grades',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('number', models.IntegerField(verbose_name='Numero')),
                ('minimum', models.IntegerField(blank=True, null=True, verbose_name='Minimo')),
                ('average', models.IntegerField(blank=True, null=True, verbose_name='Media')),
                ('maximum', models.IntegerField(blank=True, null=True, verbose_name='Maximo')),
                ('detail', models.CharField(blank=True, default='', max_length=255, verbose_name='Descrição')),
            ],
            options={
                'verbose_name': 'Grade',
                'verbose_name_plural': 'Grades',
            },
        ),
        migrations.CreateModel(
            name='Niveis',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255, verbose_name='Nome')),
                ('detail', models.CharField(blank=True, default='', max_length=255, verbose_name='Descrição')),
            ],
            options={
                'verbose_name': 'Nivel',
                'verbose_name_plural': 'Niveis',
            },
        ),
        migrations.CreateModel(
            name='SubFamilias',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255, verbose_name='Nome')),
                ('detail', models.CharField(blank=True, default='', max_length=255, verbose_name='Descrição')),
                ('family', models.OneToOneField(blank=True, null=True, on_delete=django.db.models.deletion.PROTECT, to='admin_avaliacao.familias', verbose_name='Familia')),
            ],
            options={
                'verbose_name': 'SubFamilia',
                'verbose_name_plural': 'SubFamilias',
            },
        ),
        migrations.CreateModel(
            name='Matrizes',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255, verbose_name='Nome')),
                ('score', models.IntegerField(blank=True, null=True, verbose_name='Pontos')),
                ('detail', models.CharField(blank=True, default='', max_length=255, verbose_name='Descrição')),
                ('factor', models.OneToOneField(on_delete=django.db.models.deletion.PROTECT, to='admin_avaliacao.fatores', verbose_name='Fator')),
                ('level', models.OneToOneField(on_delete=django.db.models.deletion.PROTECT, to='admin_avaliacao.niveis', verbose_name='Nivel')),
            ],
            options={
                'verbose_name': 'Matriz',
                'verbose_name_plural': 'Matrizes',
            },
        ),
    ]
