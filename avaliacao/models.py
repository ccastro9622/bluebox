from django.db import models

from admin_descricao.models import Formacao, Gerencia
from admin_geral.models import Dimensao, Governanca, Tipoempresa, Origemcapital
from master.models import Diretoria, Area
from admin_avaliacao.models import Fatores, Niveis, SubFamilias, Familias
from tenants.models import TenantAwareModel


class Avaliacao(TenantAwareModel):
    title = models.CharField(max_length=255, verbose_name='Nome', null=False, default="", unique=True)
    manage_team = models.ForeignKey(Gerencia, on_delete=models.PROTECT, verbose_name='Gerencia', default = 1)
    formation = models.ForeignKey(Formacao, on_delete=models.PROTECT, verbose_name='Formacao',
                                  blank=True, null=True, default="")
    board = models.ForeignKey(Diretoria, null=True, blank=True, on_delete=models.PROTECT, verbose_name='Diretoria')
    area = models.ForeignKey(Area, null=True, blank=True, on_delete=models.PROTECT, verbose_name='Area')
    family = models.ForeignKey(Familias, null=True, blank=True, on_delete=models.PROTECT, verbose_name='Familia')
    sub_familia = models.ForeignKey(SubFamilias, null=True, blank=True, on_delete=models.PROTECT,
                                    verbose_name='SubFamilia')
    title_super = models.CharField(max_length=255, verbose_name='Cargo do Superior', blank=True, null=True, default="")

    origin = models.ForeignKey(Origemcapital, null=True, blank=True, on_delete=models.PROTECT,
                               verbose_name='Origem de Capital')
    company = models.ForeignKey(Tipoempresa, null=True, blank=True, on_delete=models.PROTECT,
                                verbose_name='Tipo de Empresa')
    governanca = models.ForeignKey(Governanca, null=True, blank=True, on_delete=models.PROTECT,
                                   verbose_name='Governança')
    size = models.ForeignKey(Dimensao, null=True, blank=True, on_delete=models.PROTECT, verbose_name='Dimensão')
    ceo = models.BooleanField(default=False, verbose_name='CEO')

    factor1 = models.ForeignKey(Fatores, on_delete=models.PROTECT, verbose_name='Abrangência', related_name='factor1', default = 1)
    level1 = models.ForeignKey(Niveis, on_delete=models.PROTECT, verbose_name='Nível', related_name='level1', default = 1)
    factor2 = models.ForeignKey(Fatores, on_delete=models.PROTECT, verbose_name='Comunicação', related_name='factor2', default = 2)
    level2 = models.ForeignKey(Niveis, on_delete=models.PROTECT, verbose_name='Nível', related_name='level2', default = 1)
    factor3 = models.ForeignKey(Fatores, on_delete=models.PROTECT, verbose_name='Contribuição', related_name='factor3', default = 3)
    level3 = models.ForeignKey(Niveis, on_delete=models.PROTECT, verbose_name='Nível', related_name='level3', default = 1)
    factor4 = models.ForeignKey(Fatores, on_delete=models.PROTECT, verbose_name='Escopo', related_name='factor4', default = 4)
    level4 = models.ForeignKey(Niveis, on_delete=models.PROTECT, verbose_name='Nível', related_name='level4', default = 1)
    factor5 = models.ForeignKey(Fatores, on_delete=models.PROTECT, verbose_name='Formacão', related_name='factor5', default = 5)
    level5 = models.ForeignKey(Niveis, on_delete=models.PROTECT, verbose_name='Nível', related_name='level5', default = 1)
    factor6 = models.ForeignKey(Fatores, on_delete=models.PROTECT, verbose_name='Gestão', related_name='factor6', default = 6)
    level6 = models.ForeignKey(Niveis, on_delete=models.PROTECT, verbose_name='Nível', related_name='level6', default = 1)
    factor7 = models.ForeignKey(Fatores, on_delete=models.PROTECT, verbose_name='Liderança', related_name='factor7', default = 7)
    level7 = models.ForeignKey(Niveis, on_delete=models.PROTECT, verbose_name='Nível', related_name='level7', default = 1)
    factor8 = models.ForeignKey(Fatores, on_delete=models.PROTECT, verbose_name='Nivel Organizacional', related_name='factor8', default = 8)
    level8 = models.ForeignKey(Niveis, on_delete=models.PROTECT, verbose_name='Nível', related_name='level8', default = 1)

    def __str__(self):
        return f"{self.title}"

    class Meta:
        verbose_name = 'Avaliacao'
        verbose_name_plural = 'Avaliacao'
