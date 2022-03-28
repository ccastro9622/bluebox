from django.db import models
from django_cpf_cnpj.fields import CNPJField

from admin_geral.models import Sector, Origemcapital, Tipoempresa, Governanca, Dimensao, Core


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

    name = models.CharField(max_length=255, verbose_name='Nome da Empresa', null=False, default="", unique=True)
    cnpj = CNPJField(masked=True, null=False, default="",  verbose_name='CNPJ')
    phone = models.CharField(null=False, default="", verbose_name="Telefone", max_length=19)
    address = models.CharField(default="", null=False,   max_length=150, verbose_name="Endereço")
    number = models.CharField(null=False,  verbose_name="Número", max_length=4, default="")
    complement = models.CharField(null=True, blank=True, max_length=200, verbose_name="Complemento", default="")
    states = models.CharField(null=False, verbose_name="Estado", choices=ESTADO_CHOICES, max_length=15, default="")
    city = models.CharField(null=False,  max_length=40, verbose_name="Cidade", default="")
    sector = models.ForeignKey(Sector, null=False,  default="", on_delete=models.PROTECT, verbose_name='Setor de Atuação')
    employees = models.IntegerField(null=False, default=0, verbose_name='Colaboradores Próprios')
    outsource = models.IntegerField(null=False, default=0, verbose_name='Colaboradores Terceirizados')
    origin = models.ForeignKey(Origemcapital, null=False,  default="",  on_delete=models.PROTECT, verbose_name='Origem de Capital')
    company = models.ForeignKey(Tipoempresa, null=False, default="",  on_delete=models.PROTECT, verbose_name='Constituição do Capital')
    governanca = models.ForeignKey(Governanca, null=False, default="",  on_delete=models.PROTECT, verbose_name='Governança')
    size = models.ForeignKey(Dimensao, null=False, default="",  on_delete=models.PROTECT, verbose_name='Dimensão Financeira Anual')
    core = models.ForeignKey(Core, null=True, default="", on_delete=models.PROTECT,
                             verbose_name='Core da Empresa')

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
