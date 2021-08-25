from django.db import models

from admin_descricao.models import Formacao, Areas, Especializacoes, Experiencias, Habilitacoes, Idiomas
from master.models import Diretoria, Area
from admin_avaliacao.models import Fatores, Niveis
from tenants.models import TenantAwareModel


class Avaliacao(TenantAwareModel):
    title = models.CharField(max_length=255, verbose_name='Nome', null=False, default="", unique=True)
    board = models.ForeignKey(Diretoria, null=True, blank=True, on_delete=models.PROTECT, verbose_name='Diretoria')
    area = models.ForeignKey(Area, null=True, blank=True, on_delete=models.PROTECT, verbose_name='Area')
    factor = models.ForeignKey(Fatores, on_delete=models.PROTECT, verbose_name='Fator')
    level = models.ForeignKey(Niveis, on_delete=models.PROTECT, verbose_name='Nível')


    def __str__(self):
        return f"{self.title}"

    class Meta:
        verbose_name = 'Avaliacao'
        verbose_name_plural = 'Avaliacao'
