from django.db import models
from cpf_field.models import CPFField

from tenants.models import TenantAwareModel


class Person(TenantAwareModel):

    SEXO_CHOICES = (
        ("F", "Feminino"),
        ("M", "Masculino"),
    )
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

    ESTADO_CIVIL_CHOICES = (
        ("Solteiro", "Solteiro"),
        ("Casado", "Casado"),
        ("Divorciado", "Divorciado"),
        ("Viúvo", "Viúvo")
    )

    name = models.CharField(max_length=255, verbose_name='Nome', null=False, default="", unique=True)
    cpf = CPFField('cpf', unique=True)
    birth_date = models.DateField( default='1900-01-01', verbose_name="Data de Nascimento")
    sex = models.CharField(null=False, verbose_name="Sexo", choices=SEXO_CHOICES, max_length=10,default="")
    civil_status = models.CharField(null=False, verbose_name="Estado Civil", choices=ESTADO_CIVIL_CHOICES,
                                    max_length=10, default="")
    phone = models.CharField(verbose_name="Telefone", max_length=19,default="")
    address = models.CharField(default="", null=False, max_length=150, verbose_name="Endereço")
    number = models.CharField(null=False, verbose_name="Número", max_length=4, default="")
    complement = models.CharField(max_length=200, verbose_name="Complemento", default="", blank=True)
    states = models.CharField(null=False, verbose_name="Estado", choices=ESTADO_CHOICES, max_length=15, default="")
    city = models.CharField(null=False, max_length=40, verbose_name="Cidade", default="")


    def __str__(self):
        return f"{self.name}"

    class Meta:
        verbose_name = 'Pessoa'
        verbose_name_plural = 'Pessoas'
