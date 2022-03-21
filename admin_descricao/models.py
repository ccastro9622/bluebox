from django.db import models


class Formacao(models.Model):
    code = models.IntegerField(verbose_name='Código', unique=True, default=1)
    name = models.CharField(max_length=255, verbose_name='Nome', unique=True)
    is_active = models.BooleanField(default=True, verbose_name='Ativo')

    def __str__(self):
        return f"{self.code}" f" - {self.name}"

    class Meta:
        verbose_name = 'Formação'
        verbose_name_plural = 'Formações'


class Areas(models.Model):
    name = models.CharField(max_length=255, verbose_name='Nome', unique=True)
    is_active = models.BooleanField(default=True, verbose_name='Ativo')

    def __str__(self):
        return f"{self.name}"

    class Meta:
        verbose_name = 'Area Formação'
        verbose_name_plural = 'Areas de Formação'


class Idiomas(models.Model):
    name = models.CharField(max_length=255, verbose_name='Nome', unique=True)
    is_active = models.BooleanField(default=True, verbose_name='Ativo')

    def __str__(self):
        return f"{self.name}"

    class Meta:
        verbose_name = 'Idioma'
        verbose_name_plural = 'Idiomas'


class Habilitacoes(models.Model):
    name = models.CharField(max_length=255, verbose_name='Nome', unique=True)
    is_active = models.BooleanField(default=True, verbose_name='Ativo')

    def __str__(self):
        return f"{self.name}"

    class Meta:
        verbose_name = 'Habilitação/Certificação'
        verbose_name_plural = 'Habilitações/Ceritificações'


class Especializacoes(models.Model):
    name = models.CharField(max_length=255, verbose_name='Nome',unique=True)
    is_active = models.BooleanField(default=True, verbose_name='Ativo')

    def __str__(self):
        return f"{self.name}"

    class Meta:
        verbose_name = 'Formação Complementar'
        verbose_name_plural = 'Formações Complementares'


class Experiencias(models.Model):
    name = models.CharField(max_length=255, verbose_name='Nome', unique=True)

    def __str__(self):
        return f"{self.name}"

    class Meta:
        verbose_name = 'Experiencia'
        verbose_name_plural = 'Experiencias'


class Status(models.Model):
    name = models.CharField(max_length=255, verbose_name='Nome', unique=True, null=False, default="")

    def __str__(self):
        return f"{self.name}"

    class Meta:
        verbose_name = 'Status'
        verbose_name_plural = 'Status'


class Gerencia(models.Model):
    name = models.CharField(max_length=255, verbose_name='Nome', unique=True, null=False, default="")

    def __str__(self):
        return f"{self.name}"

    class Meta:
        verbose_name = 'Gestão de Equipe'
        verbose_name_plural = 'Gestão de Equipes'


class Descricoes(models.Model):
    title = models.CharField(max_length=255, verbose_name='Título do Cargo', unique=True)
    summary = models.TextField(max_length=1000, verbose_name='Sumário do Cargo', default="")
    summary_goal = models.TextField(max_length=1000, verbose_name='Objetivo do Cargo', default="")
    summary_coverage = models.TextField(max_length=1000, verbose_name='Abrangência do Cargo', default="")
    responsibility = models.TextField(max_length=1500, verbose_name='Principais Responsabilidades', default="")
    formation = models.ForeignKey(Formacao, on_delete=models.PROTECT, verbose_name='Formação', related_name='Formacao')
    areas = models.ForeignKey(Areas, on_delete=models.PROTECT, verbose_name='Área de Formação 1', related_name='Area')
    areas2 = models.ForeignKey(Areas, on_delete=models.PROTECT, verbose_name='Área de Formação 2', related_name='Area2', blank=True, null=True)
    areas3 = models.ForeignKey(Areas, on_delete=models.PROTECT, verbose_name='Área de Formação 3', related_name='Area3', blank=True, null=True)
    areas4 = models.ForeignKey(Areas, on_delete=models.PROTECT, verbose_name='Área de Formação 4', related_name='Area4', blank=True, null=True)
    specialization = models.ForeignKey(Especializacoes, on_delete=models.PROTECT, verbose_name='Formação Complementar', blank=True, null=True)
    area_specialization = models.CharField(max_length=255, verbose_name='Área de Especialização', default="")
    experience = models.ForeignKey(Experiencias, on_delete=models.PROTECT, verbose_name='Experiência')
    qualification = models.ForeignKey(Habilitacoes, on_delete=models.PROTECT, related_name='Habilitacao1',
                                      verbose_name='Habilitação/Certificação Obrigatória 1', null=True, blank=True)
    qualification2 = models.ForeignKey(Habilitacoes, on_delete=models.PROTECT, related_name='Habilitacao2',
                                      verbose_name='Habilitação/Certificação Obrigatória 2', null=True, blank=True)
    qualification3 = models.ForeignKey(Habilitacoes, on_delete=models.PROTECT, related_name='Habilitacao3',
                                      verbose_name='Habilitação/Certificação Obrigatória 3', null=True, blank=True)
    qualification4 = models.ForeignKey(Habilitacoes, on_delete=models.PROTECT, related_name='Habilitacao4',
                                      verbose_name='Habilitação/Certificação Obrigatória 4', null=True, blank=True)



    def __str__(self):
        return f"{self.title}"

    class Meta:
        verbose_name = ' Modelo de Descrição'
        verbose_name_plural = 'Modelo de Descrições'
