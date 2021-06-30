from django.db import models

from tenants.models import TenantAwareModel


class Diretoria(TenantAwareModel):

    name = models.CharField(max_length=255, verbose_name='Nome', null=False, default="", unique=True)

    def __str__(self):
        return f"{self.name}"

    class Meta:
        verbose_name = 'Diretoria'
        verbose_name_plural = 'Diretoria'


class Area(TenantAwareModel):

    name = models.CharField(max_length=255, verbose_name='Nome', null=False, default="", unique=True)
    board = models.ForeignKey(Diretoria, on_delete=models.PROTECT, verbose_name='Diretoria')

    def __str__(self):
        return f"{self.name}"

    class Meta:
        verbose_name = 'Area da Diretoria'
        verbose_name_plural = 'Area da Diretoria'

