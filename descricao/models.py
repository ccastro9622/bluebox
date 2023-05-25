from django.db import models

from admin_descricao.models import Formacao, Areas, Especializacoes, Experiencias, Habilitacoes, Idiomas, Status, \
    Gerencia, Proficiencias, AreasEspecializacoes
from master.models import Diretoria, Area
from admin_avaliacao.models import Familias, SubFamilias, Fatores
from user_account.models import CustomUser

from tenants.models import TenantAwareModel


class Descricao(TenantAwareModel):

    title = models.CharField(max_length=255, verbose_name='Título do Cargo', null=False, default="", help_text=u'',)
    cbo = models.CharField(null=True,max_length=255, verbose_name='CBO', blank=True, default="")
    function = models.CharField(null=True,max_length=255, verbose_name='Função', blank=True, default="")
    summary_goal = models.TextField(max_length=1000, verbose_name='Missão do Cargo', null=True, default="")
    responsibility = models.TextField(max_length=1000, verbose_name='Principais Responsabilidades', null=True, default="")
    formation = models.ForeignKey(Formacao, on_delete=models.PROTECT, related_name='formation', verbose_name='Grau de Escolaridade Obrigatório', null=True, blank=True, default="")
    areas = models.ForeignKey(Areas, on_delete=models.PROTECT, verbose_name='Área de Formação Obrigatória 1', related_name='Area_1',
                              blank=True, null=True)
    areas2 = models.ForeignKey(Areas, on_delete=models.PROTECT, verbose_name='Área de Formação Obrigatória 2', related_name='Area_2',
                               blank=True, null=True)
    areas3 = models.ForeignKey(Areas, on_delete=models.PROTECT, verbose_name='Área de Formação Obrigatória 3', related_name='Area_3',
                               blank=True, null=True)
    areas4 = models.ForeignKey(Areas, on_delete=models.PROTECT, verbose_name='Área de Formação Obrigatória 4', related_name='Area_4',
                               blank=True, null=True)
    formation_desired = models.ForeignKey(Formacao, null=True, on_delete=models.PROTECT, related_name='formation_desired1', verbose_name='Grau de Escolaridade Desejável', default="")
    areas_desired = models.ForeignKey(Areas, on_delete=models.PROTECT, related_name='areas_desired_1',
                                      verbose_name='Area de Formação Desejada 1',blank=True, null=True, default="")
    areas_desired2 = models.ForeignKey(Areas, on_delete=models.PROTECT, related_name='areas_desired_2',
                                      verbose_name='Area de Formação Desejada 2', blank=True, null=True, default="")
    areas_desired3 = models.ForeignKey(Areas, on_delete=models.PROTECT, related_name='areas_desired_3',
                                      verbose_name='Area de Formação Desejada 3', blank=True, null=True, default="")
    areas_desired4 = models.ForeignKey(Areas, on_delete=models.PROTECT, related_name='areas_desired_4',
                                      verbose_name='Area de Formação Desejada 4', blank=True, null=True, default="")
    specialization = models.ForeignKey(Especializacoes, on_delete=models.PROTECT, verbose_name='Formação Complementar', blank=True, null=True, default="")
    area_specialization = models.ForeignKey(Areas, on_delete=models.PROTECT, verbose_name='Área de Formação Complementar 1',
                                related_name='area_specialization_1',
                                blank=True, null=True)
    area_specialization2 = models.ForeignKey(Areas, on_delete=models.PROTECT, verbose_name='Área de Formação Complementar 2',
                               related_name='area_specialization_2',
                               blank=True, null=True)
    area_specialization3 = models.ForeignKey(Areas, on_delete=models.PROTECT, verbose_name='Área de Formação Complementar 3',
                               related_name='area_specialization_3',
                               blank=True, null=True)
    area_specialization4 = models.ForeignKey(Areas, on_delete=models.PROTECT, verbose_name='Área de Formação Complementar 4',
                               related_name='area_specialization_4',
                               blank=True, null=True)
    experience = models.ForeignKey(Experiencias, on_delete=models.PROTECT, verbose_name='Experiencia')
    qualification = models.ForeignKey(Habilitacoes, on_delete=models.PROTECT, related_name='Habilitacao_1',
                                      verbose_name='Habilitação/Certificação Obrigatória 1', null=True, blank=True)
    qualification2 = models.ForeignKey(Habilitacoes, on_delete=models.PROTECT, related_name='Habilitacao_2',
                                       verbose_name='Habilitação/Certificação Obrigatória 2', null=True, blank=True)
    qualification3 = models.ForeignKey(Habilitacoes, on_delete=models.PROTECT, related_name='Habilitacao_3',
                                       verbose_name='Habilitação/Certificação Obrigatória 3', null=True, blank=True)
    is_active = models.BooleanField(default=False, verbose_name='Ativo')
    board = models.ForeignKey(Diretoria, null=True, on_delete=models.PROTECT, verbose_name='Área')
    area = models.ForeignKey(Area, null=True, on_delete=models.PROTECT, verbose_name='Subárea')
    title_super = models.CharField(max_length=255, verbose_name='Título do Cargo do Superior Imediato',  null=True, default="")
    family = models.ForeignKey(Familias, null=True, blank=True, on_delete=models.PROTECT, verbose_name='Família do Cargo')
    sub_familia = models.ForeignKey(SubFamilias, null=True, blank=True, on_delete=models.PROTECT, verbose_name='SubFamília do Cargo')
    manage_team = models.ForeignKey(Gerencia, on_delete=models.PROTECT, verbose_name='Gestão de Equipe', related_name='gerencia')
    position_team = models.TextField(max_length=1000, verbose_name='Cargos da Equipe', blank=True, null=True, default="" )
    idioma = models.ForeignKey(Idiomas, null=True, blank=True, on_delete=models.PROTECT, verbose_name='Idioma 1',  related_name='idioma1')
    idioma2 = models.ForeignKey(Idiomas, null=True, blank=True, on_delete=models.PROTECT, verbose_name='Idioma 2', related_name='idioma2')
    idioma3 = models.ForeignKey(Idiomas, null=True, blank=True, on_delete=models.PROTECT, verbose_name='Idioma 3', related_name='idioma3')
    proficiency = models.ForeignKey(Proficiencias, null=True, blank=True, on_delete=models.PROTECT, verbose_name='Proficiência 1',  related_name='proficiencia1')
    proficiency2 = models.ForeignKey(Proficiencias, null=True, blank=True, on_delete=models.PROTECT,
                                    verbose_name='Proficiência 2',  related_name='proficiencia2')
    proficiency3 = models.ForeignKey(Proficiencias, null=True, blank=True, on_delete=models.PROTECT,
                                    verbose_name='Proficiência 3',  related_name='proficiencia3')
    knowledge = models.TextField(max_length=1000, verbose_name='Conhecimentos Específicos', blank=True, default="")
    information = models.TextField(max_length=1000, verbose_name='Outras Informações', blank=True, default="")
    approver = models.ForeignKey(CustomUser, null=True, blank=True, on_delete=models.PROTECT, verbose_name='Aprovador', related_name='approver')
    date_approval = models.DateTimeField(null=True, blank=True, verbose_name='Data de Aprovação')
    status = models.ForeignKey(Status, on_delete=models.PROTECT, verbose_name='Status', related_name='status')
    user_id = models.ForeignKey(CustomUser, null=True, blank=True, on_delete=models.PROTECT, verbose_name='Elaborador', related_name='user_id')
    date_conclusion = models.DateTimeField(null=True, blank=True, verbose_name='Data de Conclusao')
    is_active = models.BooleanField(default=True, verbose_name='Ativo')


    def __str__(self):
        return f"{self.title}"

    class Meta:
        unique_together = ('title', 'tenant_id', 'is_active')
        verbose_name = 'Descricao'
        verbose_name_plural = 'Descricao'