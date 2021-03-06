# Generated by Django 3.2.1 on 2021-07-08 18:47

from django.db import migrations, models
import django.db.models.deletion
import django_cpf_cnpj.fields


class Migration(migrations.Migration):

    dependencies = [
        ('admin_geral', '0001_initial'),
        ('tenants', '0002_auto_20210705_1001'),
    ]

    operations = [
        migrations.AlterField(
            model_name='tenant',
            name='address',
            field=models.CharField(blank=True, default='', max_length=150, null=True, verbose_name='Endereço'),
        ),
        migrations.AlterField(
            model_name='tenant',
            name='capital',
            field=models.CharField(blank=True, default='', max_length=150, null=True, verbose_name='Origem do Capital'),
        ),
        migrations.AlterField(
            model_name='tenant',
            name='city',
            field=models.CharField(blank=True, default='', max_length=40, null=True, verbose_name='Cidade'),
        ),
        migrations.AlterField(
            model_name='tenant',
            name='cnpj',
            field=django_cpf_cnpj.fields.CNPJField(blank=True, max_length=18, null=True),
        ),
        migrations.AlterField(
            model_name='tenant',
            name='number',
            field=models.CharField(blank=True, default='', max_length=4, null=True, verbose_name='Número'),
        ),
        migrations.AlterField(
            model_name='tenant',
            name='phone',
            field=models.CharField(blank=True, default='', max_length=19, null=True, verbose_name='Telefone'),
        ),
        migrations.AlterField(
            model_name='tenant',
            name='sector',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.PROTECT, to='admin_geral.sector', verbose_name='Setor de Atuação'),
        ),
        migrations.AlterField(
            model_name='tenant',
            name='states',
            field=models.CharField(blank=True, choices=[('AC', 'Acre'), ('AL', 'Alagoas'), ('AP', 'Amapá'), ('AM', 'Amazonas'), ('BA', 'Bahia '), ('CE', 'Ceará'), ('DF', 'Distrito Federal '), ('ES', 'Espírito Santo'), ('GO', 'Goiás'), ('MA', 'Maranhão'), ('MT', 'Mato Grosso'), ('MS', 'Mato Grosso do Sul'), ('MG', 'Minas Gerais'), ('PA', 'Pará'), ('PB', 'Paraíba'), ('PR', 'Paraná'), ('PE', 'Pernambuco'), ('PI', 'Piauí'), ('RJ', 'Rio de Janeiro'), ('RN', 'Rio Grande do Norte'), ('RS', 'Rio Grande do Sul'), ('RO', 'Rondônia'), ('RR', 'Roraima'), ('SC', 'Santa Catarina'), ('SP', 'São Paulo'), ('SE', 'Sergipe'), ('TO', 'Tocantins')], default='', max_length=15, null=True, verbose_name='Estado'),
        ),
    ]
