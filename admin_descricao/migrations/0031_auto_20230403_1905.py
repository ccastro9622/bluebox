# Generated by Django 3.2.1 on 2023-04-03 22:05

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('admin_descricao', '0030_auto_20230403_1728'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='experiencias',
            options={'ordering': ['name'], 'verbose_name': 'Experiência', 'verbose_name_plural': 'Experiências'},
        ),
        migrations.AlterModelOptions(
            name='formacao',
            options={'ordering': ['name'], 'verbose_name': 'Formação', 'verbose_name_plural': 'Formações'},
        ),
        migrations.AlterModelOptions(
            name='habilitacoes',
            options={'ordering': ['name'], 'verbose_name': 'Habilitação/Certificação', 'verbose_name_plural': 'Habilitações/Ceritificações'},
        ),
        migrations.AlterModelOptions(
            name='idiomas',
            options={'ordering': ['name'], 'verbose_name': 'Idioma', 'verbose_name_plural': 'Idiomas'},
        ),
    ]