from django.db import models
from django_cpf_cnpj.fields import CNPJField

from admin_geral.models import Sector, Origemcapital, Tipoempresa, Governanca, Dimensao


class Tenant(models.Model):
    ESTADO_CHOICES = (
        ("AC", "Acre"),
        ("AL", "Alagoas"),
        ("AP", "Amapá"),
        ("AM", "Amazonas"),
        ("BA", "Bahia "),
        ("CE", "Ceará"),
        ("DF", "Distrito Federal "),
        ("ES", "Espírito Santo"),
        ("GO", "Goiás"),
        ("MA", "Maranhão"),
        ("MT", "Mato Grosso"),
        ("MS", "Mato Grosso do Sul"),
        ("MG", "Minas Gerais"),
        ("PA", "Pará"),
        ("PB", "Paraíba"),
        ("PR", "Paraná"),
        ("PE", "Pernambuco"),
        ("PI", "Piauí"),
        ("RJ", "Rio de Janeiro"),
        ("RN", "Rio Grande do Norte"),
        ("RS", "Rio Grande do Sul"),
        ("RO", "Rondônia"),
        ("RR", "Roraima"),
        ("SC", "Santa Catarina"),
        ("SP", "São Paulo"),
        ("SE", "Sergipe"),
        ("TO", "Tocantins")
    )

    name = models.CharField(max_length=255, verbose_name='Nome', null=False, default="", unique=True)
    cnpj = CNPJField(masked=True, null=True, blank=True)
    phone = models.CharField(null=True, blank=True, verbose_name="Telefone", max_length=19, default="")
    address = models.CharField(default="", null=True, blank=True, max_length=150, verbose_name="Endereço")
    number = models.CharField(null=True, blank=True, verbose_name="Número", max_length=4, default="")
    complement = models.CharField(null=True, max_length=200, verbose_name="Complemento", default="", blank=True)
    states = models.CharField(null=True, blank=True, verbose_name="Estado", choices=ESTADO_CHOICES, max_length=15, default="")
    city = models.CharField(null=True, blank=True, max_length=40, verbose_name="Cidade", default="")
    sector = models.ForeignKey(Sector, null=True, blank=True, on_delete=models.PROTECT, verbose_name='Setor de Atuação')
    employees = models.IntegerField(blank=True, null=True, verbose_name='Colaboradores Próprios')
    outsource = models.IntegerField(blank=True, null=True, verbose_name='Colaboradores Terceirizados')
    origin = models.ForeignKey(Origemcapital, null=True, blank=True, on_delete=models.PROTECT, verbose_name='Origem de Capital')
    company = models.ForeignKey(Tipoempresa, null=True, blank=True, on_delete=models.PROTECT, verbose_name='Tipo de Empresa')
    governanca = models.ForeignKey(Governanca, null=True, blank=True, on_delete=models.PROTECT, verbose_name='Governança')
    size = models.ForeignKey(Dimensao, null=True, blank=True, on_delete=models.PROTECT, verbose_name='Dimensão Anual')

    # name = models.CharField(max_length=100)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = 'Empresa'
        verbose_name_plural = 'Empresas'


class TenantAwareModel(models.Model):
    tenant = models.ForeignKey(Tenant, on_delete=models.CASCADE)

    class Meta:
        abstract = True
