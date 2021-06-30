from django.db import models


class Formacao(models.Model):

    name = models.CharField(max_length=255, verbose_name='Nome')

    def __str__(self):
        return f"{self.name}"

    class Meta:
        verbose_name = 'Formação'
        verbose_name_plural = 'Formação'


class Areas(models.Model):
    name = models.CharField(max_length=255, verbose_name='Nome')

    def __str__(self):
        return f"{self.name}"

    class Meta:
        verbose_name = 'Area Formação'
        verbose_name_plural = 'Areas de Formação'


class Idiomas(models.Model):
    name = models.CharField(max_length=255, verbose_name='Nome')

    def __str__(self):
        return f"{self.name}"

    class Meta:
        verbose_name = 'Idioma'
        verbose_name_plural = 'Idiomas'


class Habilitacoes(models.Model):
    name = models.CharField(max_length=255, verbose_name='Nome')
    detail = models.CharField(max_length=255, verbose_name='Descrição', blank=True, default="")

    def __str__(self):
        return f"{self.name}"

    class Meta:
        verbose_name = 'Habilitação/Certificação'
        verbose_name_plural = 'Habilitações/Ceritificações'


class Especializacoes(models.Model):
    name = models.CharField(max_length=255, verbose_name='Nome')

    def __str__(self):
        return f"{self.name}"

    class Meta:
        verbose_name = 'Especializacao'
        verbose_name_plural = 'Especializacoes'


class Experiencias(models.Model):
    name = models.CharField(max_length=255, verbose_name='Nome')

    def __str__(self):
        return f"{self.name}"

    class Meta:
        verbose_name = 'Experiencia'
        verbose_name_plural = 'Experiencias'


class Descricoes(models.Model):
    title = models.CharField(max_length=255, verbose_name='Nome')
    cbo = models.CharField(max_length=255, verbose_name='CBO', blank=True, default="")
    summary = models.CharField(max_length=255, verbose_name='Sumario', blank=True, default="")
    responsibility = models.CharField(max_length=255, verbose_name='Responsabilidades', blank=True, default="")
    formation = models.ForeignKey(Formacao, on_delete=models.PROTECT, verbose_name='Formacao')
    areas = models.ForeignKey(Areas, on_delete=models.PROTECT, verbose_name='Area')
    specialization = models.ForeignKey(Especializacoes, on_delete=models.PROTECT, verbose_name='Especializacoes')
    area_specialization = models.CharField(max_length=255, verbose_name='Area Especializacao', blank=True, default="")
    experience = models.ForeignKey(Experiencias, on_delete=models.PROTECT, verbose_name='Experiencia')
    qualification = models.ForeignKey(Habilitacoes, on_delete=models.PROTECT, verbose_name='Habilitacao')

    def __str__(self):
        return f"{self.title}"

    class Meta:
        verbose_name = ' Modelo de Descricao'
        verbose_name_plural = 'Modelo de Descricoes'
