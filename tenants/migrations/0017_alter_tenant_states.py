# Generated by Django 3.2.1 on 2024-03-05 12:24

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('tenants', '0016_alter_tenant_size'),
    ]

    operations = [
        migrations.AlterField(
            model_name='tenant',
            name='states',
            field=models.CharField(choices=[('--', '---------'), ('AC', 'Acre'), ('AL', 'Alagoas'), ('AP', 'Amapá'), ('AM', 'Amazonas'), ('BA', 'Bahia '), ('CE', 'Ceará'), ('DF', 'Distrito Federal '), ('ES', 'Espírito Santo'), ('GO', 'Goiás'), ('MA', 'Maranhão'), ('MT', 'Mato Grosso'), ('MS', 'Mato Grosso do Sul'), ('MG', 'Minas Gerais'), ('PA', 'Pará'), ('PB', 'Paraíba'), ('PR', 'Paraná'), ('PE', 'Pernambuco'), ('PI', 'Piauí'), ('RJ', 'Rio de Janeiro'), ('RN', 'Rio Grande do Norte'), ('RS', 'Rio Grande do Sul'), ('RO', 'Rondônia'), ('RR', 'Roraima'), ('SC', 'Santa Catarina'), ('SP', 'São Paulo'), ('SE', 'Sergipe'), ('TO', 'Tocantins')], default='', max_length=15, verbose_name='Estado'),
        ),
    ]
