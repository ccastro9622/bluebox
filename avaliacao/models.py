from django.db import models

from admin_descricao.models import Formacao, Gerencia, Descricoes
from admin_geral.models import Dimensao, Governanca, Tipoempresa, Origemcapital
from master.models import Diretoria, Area
from admin_avaliacao.models import Fatores, Niveis, SubFamilias, Familias
from tenants.models import TenantAwareModel


class Superior(TenantAwareModel):
    title = models.CharField(max_length=255, verbose_name='Nome', null=False, default="", unique=True)

    def __str__(self):
        return f"{self.title}"

    class Meta:
        verbose_name = 'Superior'
        verbose_name_plural = 'Superior'


class Avaliacao(TenantAwareModel):
    title = models.CharField(max_length=255, verbose_name='Título do Cargo', null=False, default="", unique=True)
    manage_team = models.ForeignKey(Gerencia, on_delete=models.PROTECT, verbose_name='Gestão de Equipe')
    formation = models.ForeignKey(Formacao, on_delete=models.PROTECT, verbose_name='Formacao',
                                  blank=True, null=True, default="")
    board = models.ForeignKey(Diretoria, null=True, blank=True, on_delete=models.PROTECT, verbose_name='Área')
    area = models.ForeignKey(Area, null=True, blank=True, on_delete=models.PROTECT, verbose_name='Subárea')
    family = models.ForeignKey(Familias, null=True, blank=True, on_delete=models.PROTECT, verbose_name='Familia')
    sub_familia = models.ForeignKey(SubFamilias, null=True, blank=True, on_delete=models.PROTECT,
                                    verbose_name='SubFamilia')
    title_super = models.ForeignKey(Superior, null=True, blank=True, on_delete=models.PROTECT,
                                    verbose_name='Cargo Superior Imediato')
    #models.CharField(max_length=255, verbose_name='Cargo do Superior', blank=True, null=True, default="")

    origin = models.ForeignKey(Origemcapital, null=True, blank=True, on_delete=models.PROTECT,
                               verbose_name='Origem de Capital')
    company = models.ForeignKey(Tipoempresa, null=True, blank=True, on_delete=models.PROTECT,
                                verbose_name='Tipo de Empresa')
    governanca = models.ForeignKey(Governanca, null=True, blank=True, on_delete=models.PROTECT,
                                   verbose_name='Governança')
    size = models.ForeignKey(Dimensao, null=True, blank=True, on_delete=models.PROTECT, verbose_name='Dimensão')
    ceo = models.BooleanField(default=False, blank=False, verbose_name='1º Executivo', null=False)

    factor1 = models.ForeignKey(Fatores, on_delete=models.PROTECT, verbose_name='Fatores de Avaliação', related_name='factor1', default = 1)
    level1 = models.ForeignKey(Niveis, on_delete=models.PROTECT, verbose_name='Níveis', related_name='level1')
    factor2 = models.ForeignKey(Fatores, on_delete=models.PROTECT, verbose_name=' ', related_name='factor2', default = 2)
    level2 = models.ForeignKey(Niveis, on_delete=models.PROTECT, verbose_name=' ', related_name='level2')
    factor3 = models.ForeignKey(Fatores, on_delete=models.PROTECT, verbose_name=' ', related_name='factor3', default = 3)
    level3 = models.ForeignKey(Niveis, on_delete=models.PROTECT, verbose_name=' ', related_name='level3')
    factor4 = models.ForeignKey(Fatores, on_delete=models.PROTECT, verbose_name=' ', related_name='factor4', default = 4)
    level4 = models.ForeignKey(Niveis, on_delete=models.PROTECT, verbose_name=' ', related_name='level4')
    factor5 = models.ForeignKey(Fatores, on_delete=models.PROTECT, verbose_name=' ', related_name='factor5', default = 5)
    level5 = models.ForeignKey(Niveis, on_delete=models.PROTECT, verbose_name=' ', related_name='level5' )
    factor6 = models.ForeignKey(Fatores, on_delete=models.PROTECT, verbose_name=' ', related_name='factor6', default = 6)
    level6 = models.ForeignKey(Niveis, on_delete=models.PROTECT, verbose_name=' ', related_name='level6')
    factor7 = models.ForeignKey(Fatores, on_delete=models.PROTECT, verbose_name=' ', related_name='factor7', default = 7)
    level7 = models.ForeignKey(Niveis, on_delete=models.PROTECT, verbose_name=' ', related_name='level7')
    factor8 = models.ForeignKey(Fatores, on_delete=models.PROTECT, verbose_name=' ', related_name='factor8', default = 8)
    level8 = models.ForeignKey(Niveis, on_delete=models.PROTECT, verbose_name=' ', related_name='level8')

    point = models.IntegerField(verbose_name='Pontos', default=0)
    grade = models.IntegerField(verbose_name='Grade', default=0)

    def __str__(self):
        return f"{self.title}"

    class Meta:
        verbose_name = 'Avaliacao'
        verbose_name_plural = 'Avaliacao'
