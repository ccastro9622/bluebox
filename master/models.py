from django.db import models

from tenants.models import TenantAwareModel


class Diretoria(TenantAwareModel):

    name = models.CharField(max_length=255, verbose_name='Nome', null=False, default="")
    is_active = models.BooleanField(default=True, verbose_name='Ativo')

    def __str__(self):
        return f"{self.name}"

    class Meta:
        unique_together = ('name', 'tenant_id',)
        verbose_name = 'Diretoria'
        verbose_name_plural = 'Diretorias'


class Area(TenantAwareModel):

    board = models.ForeignKey(Diretoria, on_delete=models.PROTECT, verbose_name='Diretoria')
    name = models.CharField(max_length=255, verbose_name='Area', null=False, default="")
    is_active = models.BooleanField(default=True, verbose_name='Ativo')

    def __str__(self):
        return f"{self.name}"

    class Meta:
        unique_together = ('name', 'tenant_id',)
        verbose_name = 'Area da Diretoria'
        verbose_name_plural = 'Areas da Diretoria'
