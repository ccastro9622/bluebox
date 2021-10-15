from django.db import models


class Familias(models.Model):
    name = models.CharField(max_length=255, verbose_name='Nome',unique=True)
    detail = models.CharField(max_length=255, verbose_name='Descrição', blank=True, default="")
    is_active = models.BooleanField(default=True, verbose_name='Ativo')

    def __str__(self):
        return f"{self.name}"

    class Meta:
        verbose_name = 'Familia'
        verbose_name_plural = '      Familias de Cargo'


class SubFamilias(models.Model):
    name = models.CharField(max_length=255, verbose_name='Nome')
    family = models.ForeignKey(Familias, on_delete=models.PROTECT, verbose_name='Familia')
    detail = models.CharField(max_length=255, verbose_name='Descrição', blank=True, default="")
    is_active = models.BooleanField(default=True, verbose_name='Ativo')

    def __str__(self):
        return f"{self.name}"

    class Meta:
        verbose_name = ' SubFamilia'
        verbose_name_plural = '     Sub-Familias de Cargo'


class Fatores(models.Model):
    name = models.CharField(max_length=255, verbose_name='Nome',unique=True)
    detail = models.TextField(max_length=1000, verbose_name='Descrição', blank=True, default="")
    is_active = models.BooleanField(default=True, verbose_name='Ativo')

    def __str__(self):
        return f"{self.name}"

    class Meta:
        verbose_name = 'Fator'
        verbose_name_plural = '    Fatores de Avaliação'


class Niveis(models.Model):
    factor = models.ForeignKey(Fatores, on_delete=models.PROTECT, verbose_name='Fator')
    name = models.CharField(max_length=255, verbose_name='Nome')
    # order = models.IntegerField(verbose_name='Ordem')
    detail = models.TextField(max_length=1000, verbose_name='Descrição', blank=True, default="")
    is_active = models.BooleanField(default=True, verbose_name='Ativo')

    def __str__(self):
        return  f"{self.factor}" f" -----> {self.name}"

    class Meta:
        verbose_name = 'Fator / Nivel'
        verbose_name_plural = '   Niveis de Avaliação'


class Matrizes(models.Model):
    name = models.CharField(max_length=255, verbose_name='Nome', unique=True)
    factor = models.ForeignKey(Fatores, on_delete=models.PROTECT, verbose_name='Fator')
    level = models.ForeignKey(Niveis, on_delete=models.PROTECT, verbose_name='Nivel')
    score = models.IntegerField(blank=True, null=True, verbose_name='Pontos')
    detail = models.CharField(max_length=255, verbose_name='Descrição', blank=True, default="")
    is_active = models.BooleanField(default=True, verbose_name='Ativo')

    def __str__(self):
        return f"{self.factor}" f" --- {self.level}" f" ---  {self.score}"

    class Meta:
        verbose_name = 'Matriz'
        verbose_name_plural = ' Matrizes'


class Grades(models.Model):
    number = models.IntegerField(verbose_name='Numero')
    minimum = models.IntegerField(blank=True, null=True, verbose_name='Minimo')
    average = models.IntegerField(blank=True, null=True,verbose_name='Media')
    maximum= models.IntegerField(blank=True, null=True, verbose_name='Maximo')
    detail = models.CharField(max_length=255, verbose_name='Descrição', blank=True, default="")

    def __str__(self):
        return f"{self.number}"  f" --- {self.minimum}"  f" --- {self.average}" f" --- {self.maximum}"

    class Meta:
        verbose_name = 'Grade'
        verbose_name_plural = '  Grades'
