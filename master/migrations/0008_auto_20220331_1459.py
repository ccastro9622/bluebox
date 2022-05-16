# Generated by Django 3.2.1 on 2022-03-31 17:59

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('master', '0007_auto_20220328_2004'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='area',
            options={'verbose_name': 'Subárea da Empresa', 'verbose_name_plural': 'Subáreas da Empresa'},
        ),
        migrations.AlterModelOptions(
            name='diretoria',
            options={'verbose_name': 'Area da Empresa', 'verbose_name_plural': 'Áreas da Empresa'},
        ),
        migrations.AlterField(
            model_name='area',
            name='board',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='master.diretoria', verbose_name='Área da Empresa'),
        ),
        migrations.AlterField(
            model_name='area',
            name='name',
            field=models.CharField(default='', max_length=255, verbose_name='Subárea da Empresa'),
        ),
    ]