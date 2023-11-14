from django.db import models

from tenants.models import TenantAwareModel


class Diretoria(TenantAwareModel):

    name = models.CharField(max_length=255, verbose_name='Nome', null=False, default="")
    is_active = models.BooleanField(default=True, verbose_name='Ativo')

    def __str__(self):
        return f"{self.name}"

    class Meta:
        ordering = ["name"]
        unique_together = ('name', 'tenant_id',)
        verbose_name = 'Area da Empresa'
        verbose_name_plural = 'Áreas da Empresa'


class Area(TenantAwareModel):

    board = models.ForeignKey(Diretoria, on_delete=models.PROTECT, verbose_name='Área da Empresa')
    name = models.CharField(max_length=255, verbose_name='Subárea da Empresa', null=False, default="")
    is_active = models.BooleanField(default=True, verbose_name='Ativo')

    def __str__(self):
        return f"{self.name}"

    class Meta:
        ordering = ["name"]
        unique_together = ('name', 'tenant_id',)
        verbose_name = 'Subárea da Empresa'
        verbose_name_plural = 'Subáreas da Empresa'
