from django.db import models

from admin_descricao.models import Formacao, Areas, Especializacoes, Experiencias, Habilitacoes, Idiomas, Status, \
    Gerencia, Proficiencias
from master.models import Diretoria, Area
from admin_avaliacao.models import Familias, SubFamilias, Fatores
from user_account.models import CustomUser

from tenants.models import TenantAwareModel


class Descricao(TenantAwareModel):

    title = models.CharField(max_length=255, verbose_name='Título do Cargo', null=False, default="", unique=True, help_text=u'',)
    cbo = models.CharField(null=True,max_length=255, verbose_name='CBO', blank=True, default="")
    function = models.CharField(null=True,max_length=255, verbose_name='Função', blank=True, default="")
    summary = models.TextField(max_length=1000, verbose_name='Atividades', blank=True, null=True, default="")
    summary_goal = models.CharField(max_length=1000, verbose_name='Objetivo do Cargo', blank=True, null=True, default="")
    summary_coverage = models.CharField(max_length=1000, verbose_name='Abrangência do Cargo', blank=True, null=True, default="")
    responsibility = models.TextField(max_length=1000, verbose_name='Responsabilidades', blank=True, null=True, default="")
    formation = models.ForeignKey(Formacao, on_delete=models.PROTECT, related_name='formation', verbose_name='Formação',blank=True, null=True, default="")
    areas = models.ForeignKey(Areas, null=True, on_delete=models.PROTECT, related_name='areas', verbose_name='Area',blank=True, default="")
    formation_desired = models.ForeignKey(Formacao, null=True, on_delete=models.PROTECT, related_name='formation_desired', verbose_name='Formação Desejada',blank=True, default="")
    areas_desired = models.ForeignKey(Areas, on_delete=models.PROTECT, related_name='areas_desired', verbose_name='Area Desejada',blank=True, null=True, default="")
    specialization = models.ForeignKey(Especializacoes, on_delete=models.PROTECT, verbose_name='Especializacoes', blank=True, null=True, default="")
    area_specialization = models.CharField(max_length=255, verbose_name='Area Especializacao', blank=True, null=True, default="")
    experience = models.ForeignKey(Experiencias, on_delete=models.PROTECT, verbose_name='Experiencia',blank=True, null=True, default="")
    qualification = models.ManyToManyField(Habilitacoes, verbose_name='Habilitacoes',blank=True, null=True, default="")
    board = models.ForeignKey(Diretoria, null=True, blank=True, on_delete=models.PROTECT, verbose_name='Área')
    area = models.ForeignKey(Area, null=True, blank=True, on_delete=models.PROTECT, verbose_name='Subárea')
    title_super = models.CharField(max_length=255, verbose_name='Cargo do Superior', blank=True, null=True, default="")
    family = models.ForeignKey(Familias, null=True, blank=True, on_delete=models.PROTECT, verbose_name='Familia')
    sub_familia = models.ForeignKey(SubFamilias, null=True, blank=True, on_delete=models.PROTECT, verbose_name='SubFamilia')
    manage_team = models.ForeignKey(Gerencia, on_delete=models.PROTECT, verbose_name='Gerência', related_name='gerencia')
    position_team = models.CharField(max_length=255, verbose_name='Cargos da Equipe', blank=True, null=True, default="")
    idioma = models.ForeignKey(Idiomas, null=True, blank=True, on_delete=models.PROTECT, verbose_name='Idioma')
    proficiency = models.ForeignKey(Proficiencias, null=True, blank=True, on_delete=models.PROTECT, verbose_name='Proficiência')
    knowledge = models.CharField(max_length=255, verbose_name='Conhecimento', blank=True, null=True, default="")
    information = models.CharField(max_length=1000, verbose_name='Outras Informações', blank=True, null=True, default="")
    approver = models.ForeignKey(CustomUser, null=True, blank=True, on_delete=models.PROTECT, verbose_name='Aprovador', related_name='approver')
    date_approval = models.DateTimeField(null=True, blank=True, verbose_name='Data de Aprovação')
    status = models.ForeignKey(Status, on_delete=models.PROTECT, verbose_name='Status', related_name='status')
    user_id = models.ForeignKey(CustomUser, null=True, blank=True, on_delete=models.PROTECT, verbose_name='Criador', related_name='user_id')
    date_conclusion = models.DateTimeField(null=True, blank=True, verbose_name='Data de Conclusao')


    def __str__(self):
        return f"{self.title}"

    class Meta:
        verbose_name = 'Descricao'
        verbose_name_plural = 'Descricao'
