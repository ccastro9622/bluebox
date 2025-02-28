from django.db import models

from admin_avaliacao.models import Familias, SubFamilias


class Formacao(models.Model):
    code = models.IntegerField(verbose_name='Código*', unique=True, default=1)
    name = models.CharField(max_length=255, verbose_name='Nome*', unique=True)
    is_active = models.BooleanField(default=True, verbose_name='Ativo')

    def __str__(self):
        return f"{self.code}" f" - {self.name}"

    class Meta:
        ordering = ["code"]
        verbose_name = 'Formação'
        verbose_name_plural = 'Formações'


class Areas(models.Model):
    name = models.CharField(max_length=255, verbose_name='Nome*', unique=True)
    is_active = models.BooleanField(default=True, verbose_name='Ativo')

    def __str__(self):
        return f"{self.name}"

    class Meta:
        ordering = ["name"]
        verbose_name = 'Área Formação'
        verbose_name_plural = 'Áreas de Formação'


class Idiomas(models.Model):
    name = models.CharField(max_length=255, verbose_name='Nome*', unique=True)
    is_active = models.BooleanField(default=True, verbose_name='Ativo')

    def __str__(self):
        return f"{self.name}"

    class Meta:
        ordering = ["name"]
        verbose_name = 'Idioma'
        verbose_name_plural = 'Idiomas'


class Habilitacoes(models.Model):
    name = models.CharField(max_length=255, verbose_name='Nome*', unique=True)
    is_active = models.BooleanField(default=True, verbose_name='Ativo')

    def __str__(self):
        return f"{self.name}"

    class Meta:
        ordering = ["name"]
        verbose_name = 'Habilitação/Certificação'
        verbose_name_plural = 'Habilitações/Ceritificações'


class Especializacoes(models.Model):
    name = models.CharField(max_length=255, verbose_name='Nome*',unique=True)
    is_active = models.BooleanField(default=True, verbose_name='Ativo')

    def __str__(self):
        return f"{self.name}"

    class Meta:
        ordering = ["name"]
        verbose_name = 'Formação Complementar'
        verbose_name_plural = 'Formações Complementares'


class AreasEspecializacoes(models.Model):
    name = models.CharField(max_length=255, verbose_name='Nome*',unique=True)
    is_active = models.BooleanField(default=True, verbose_name='Ativo')

    def __str__(self):
        return f"{self.name}"

    class Meta:
        ordering = ["name"]
        verbose_name = 'Area de Formação Complementar'
        verbose_name_plural = 'Areas de Formações Complementares'


class Experiencias(models.Model):
    name = models.CharField(max_length=255, verbose_name='Nome*', unique=True)

    def __str__(self):
        return f"{self.name}"

    class Meta:
        ordering = ["id"]
        verbose_name = 'Experiência'
        verbose_name_plural = 'Experiências'


class Status(models.Model):
    name = models.CharField(max_length=255, verbose_name='Nome*', unique=True, null=False, default="")

    def __str__(self):
        return f"{self.name}"

    class Meta:
        verbose_name = 'Status'
        verbose_name_plural = 'Status'


class Gerencia(models.Model):
    name = models.CharField(max_length=255, verbose_name='Nome*', unique=True, null=False, default="")

    def __str__(self):
        return f"{self.name}"

    class Meta:
        verbose_name = 'Gestão de Equipe'
        verbose_name_plural = 'Gestão de Equipe'


class Descricoes(models.Model):
    title = models.CharField(max_length=255, verbose_name='Título do Cargo*', unique=True)
    summary_goal = models.TextField(max_length=1500, verbose_name='Missão do Cargo', blank=True, null=True)
    responsibility = models.TextField(max_length=1500, verbose_name='Principais Responsabilidades', blank=True, null=True)
    formation = models.ForeignKey(Formacao, on_delete=models.PROTECT, verbose_name='Formação', related_name='Formacao',blank=True, null=True)
    areas = models.ForeignKey(Areas, on_delete=models.PROTECT, verbose_name='Área de Formação Obrigatoria 1', related_name='Area1', blank=True, null=True)
    areas2 = models.ForeignKey(Areas, on_delete=models.PROTECT, verbose_name='Área de Formação Obrigatoria 2', related_name='Area2', blank=True, null=True)
    areas3 = models.ForeignKey(Areas, on_delete=models.PROTECT, verbose_name='Área de Formação Obrigatoria 3', related_name='Area3', blank=True, null=True)
    areas4 = models.ForeignKey(Areas, on_delete=models.PROTECT, verbose_name='Área de Formação Obrigatoria 4', related_name='Area4', blank=True, null=True)
    formation_desired = models.ForeignKey(Formacao, null=True, on_delete=models.PROTECT,
                                          related_name='formation_desired',
                                          verbose_name='Grau de Escolaridade Desejável', blank=True)
    areas_desired = models.ForeignKey(Areas, on_delete=models.PROTECT, related_name='areas_desired1',
                                      verbose_name='Area de Formação Desejada 1', blank=True, null=True)
    areas_desired2 = models.ForeignKey(Areas, on_delete=models.PROTECT, related_name='areas_desired2',
                                       verbose_name='Area de Formação Desejada 2', blank=True, null=True)
    areas_desired3 = models.ForeignKey(Areas, on_delete=models.PROTECT, related_name='areas_desired3',
                                       verbose_name='Area de Formação Desejada 3', blank=True, null=True)
    areas_desired4 = models.ForeignKey(Areas, on_delete=models.PROTECT, related_name='areas_desired4',
                                       verbose_name='Area de Formação Desejada 3', blank=True, null=True)
    specialization = models.ForeignKey(Especializacoes, on_delete=models.PROTECT, verbose_name='Formação Complementar', blank=True, null=True)

    area_specialization = models.ForeignKey(Areas, on_delete=models.PROTECT,
                                            verbose_name='Área de Formação Complementar 1',
                                            related_name='area_specialization1',
                                            blank=True, null=True)
    area_specialization2 = models.ForeignKey(Areas, on_delete=models.PROTECT,
                                             verbose_name='Área de Formação Complementar 2',
                                             related_name='area_specialization2',
                                             blank=True, null=True)
    area_specialization3 = models.ForeignKey(Areas, on_delete=models.PROTECT,
                                             verbose_name='Área de Formação Complementar 3',
                                             related_name='area_specialization3',
                                             blank=True, null=True)
    area_specialization4 = models.ForeignKey(Areas, on_delete=models.PROTECT,
                                             verbose_name='Área de Formação Complementar 4',
                                             related_name='area_specialization4',
                                             blank=True, null=True)
    experience = models.ForeignKey(Experiencias, on_delete=models.PROTECT, verbose_name='Experiência', blank=True, null=True)
    qualification = models.ForeignKey(Habilitacoes, on_delete=models.PROTECT, related_name='Habilitacao1',
                                      verbose_name='Habilitação/Certificação Obrigatória 1', null=True, blank=True)
    qualification2 = models.ForeignKey(Habilitacoes, on_delete=models.PROTECT, related_name='Habilitacao2',
                                      verbose_name='Habilitação/Certificação Obrigatória 2', null=True, blank=True)
    qualification3 = models.ForeignKey(Habilitacoes, on_delete=models.PROTECT, related_name='Habilitacao3',
                                      verbose_name='Habilitação/Certificação Obrigatória 3', null=True, blank=True)
    qualification4 = models.ForeignKey(Habilitacoes, on_delete=models.PROTECT, related_name='Habilitacao4',
                                      verbose_name='Habilitação/Certificação Obrigatória 4', null=True, blank=True)

    family = models.ForeignKey(Familias, null=True, blank=True, on_delete=models.PROTECT, verbose_name='Família do Cargo')
    sub_familia = models.ForeignKey(SubFamilias, null=True, blank=True, on_delete=models.PROTECT, verbose_name='SubFamília do Cargo')
    manage_team = models.ForeignKey(Gerencia, on_delete=models.PROTECT, verbose_name='Gestão de Equipe',
                                    related_name='gerencia1',null=True,blank=True)
    formation_desired = models.ForeignKey(Formacao, null=True,  on_delete=models.PROTECT,
                                          related_name='formation_desired',
                                          verbose_name='Grau de Escolaridade Desejável', blank=True)
    is_active = models.BooleanField(default=False, verbose_name='Ativo')

    def __str__(self):
        return f"{self.title}"

    class Meta:
        verbose_name = ' Modelo de Descrição'
        verbose_name_plural = 'Modelos de Descrições'


class Proficiencias(models.Model):
    name = models.CharField(max_length=255, verbose_name='Nome*', unique=True)
    is_active = models.BooleanField(default=True, verbose_name='Ativo')

    def __str__(self):
        return f"{self.name}"

    class Meta:
        verbose_name = 'Proficiencia'
        verbose_name_plural = 'Proficiencia'


class Niveis(models.Model):
    name = models.CharField(max_length=255, verbose_name='Nome*', unique=True)
    is_active = models.BooleanField(default=True, verbose_name='Ativo')

    def __str__(self):
        return f"{self.name}"

    class Meta:
        ordering = ["name"]
        verbose_name = 'Niveis'
        verbose_name_plural = 'Niveis'