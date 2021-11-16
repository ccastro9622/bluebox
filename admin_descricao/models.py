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
        verbose_name = 'Especializacao'
        verbose_name_plural = 'Especializacoes'


class Experiencias(models.Model):
    name = models.CharField(max_length=255, verbose_name='Nome', unique=True)

    def __str__(self):
        return f"{self.name}"

    class Meta:
        verbose_name = 'Experiencia'
        verbose_name_plural = 'Experiencias'


class Status(models.Model):
    name = models.CharField(max_length=255, verbose_name='Nome', unique=True)

    def __str__(self):
        return f"{self.name}"

    class Meta:
        verbose_name = 'Status'
        verbose_name_plural = 'Status'


class Gerencia(models.Model):
    name = models.CharField(max_length=255, verbose_name='Nome', unique=True)

    def __str__(self):
        return f"{self.name}"

    class Meta:
        verbose_name = 'Gerencia'
        verbose_name_plural = 'Gerencias'


class Descricoes(models.Model):
    title = models.CharField(max_length=255, verbose_name='Título do Cargo', unique=True)
    cbo = models.CharField(max_length=255, verbose_name='CBO', default="")
    summary = models.CharField(max_length=255, verbose_name='Sumário do Cargo', default="")
    summary_goal = models.CharField(max_length=255, verbose_name='Objetivo do Cargo', default="")
    summary_coverage = models.CharField(max_length=255, verbose_name='Abrangência do Cargo', default="")
    responsibility = models.CharField(max_length=255, verbose_name='Responsabilidades', default="")
    formation = models.ForeignKey(Formacao, on_delete=models.PROTECT, verbose_name='Formação')
    areas = models.ForeignKey(Areas, on_delete=models.PROTECT, verbose_name='Área de Formação')
    specialization = models.ForeignKey(Especializacoes, on_delete=models.PROTECT, verbose_name='Especializações')
    area_specialization = models.CharField(max_length=255, verbose_name='Área de Especialização', default="")
    experience = models.ForeignKey(Experiencias, on_delete=models.PROTECT, verbose_name='Experiência')
    qualification = models.ForeignKey(Habilitacoes, on_delete=models.PROTECT, verbose_name='Habilitação')

    def __str__(self):
        return f"{self.title}"

    class Meta:
        verbose_name = ' Modelo de Descrição'
        verbose_name_plural = 'Modelo de Descrições'
