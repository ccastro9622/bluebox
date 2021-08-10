from django.db import models


class Familias(models.Model):
    name = models.CharField(max_length=255, verbose_name='Nome')
    detail = models.CharField(max_length=255, verbose_name='Descrição', blank=True, default="")

    def __str__(self):
        return f"{self.name}"

    class Meta:
        verbose_name = 'Familia'
        verbose_name_plural = 'Familias'


class SubFamilias(models.Model):
    name = models.CharField(max_length=255, verbose_name='Nome')
    family = models.ForeignKey(Familias, on_delete=models.PROTECT, verbose_name='Familia')
    detail = models.CharField(max_length=255, verbose_name='Descrição', blank=True, default="")

    def __str__(self):
        return f"{self.name}"

    class Meta:
        verbose_name = 'SubFamilia'
        verbose_name_plural = 'SubFamilias'


class Fatores(models.Model):
    name = models.CharField(max_length=255, verbose_name='Nome')
    detail = models.CharField(max_length=255, verbose_name='Descrição', blank=True, default="")

    def __str__(self):
        return f"{self.name}"

    class Meta:
        verbose_name = 'Fator'
        verbose_name_plural = 'Fatores'


class Niveis(models.Model):
    factor = models.ForeignKey(Fatores, on_delete=models.PROTECT, verbose_name='Fator')
    name = models.CharField(max_length=255, verbose_name='Nome')
    detail = models.CharField(max_length=255, verbose_name='Descrição', blank=True, default="")

    def __str__(self):
        return f"{self.name}"

    class Meta:
        verbose_name = 'Nivel'
        verbose_name_plural = 'Niveis'


class Matrizes(models.Model):
    name = models.CharField(max_length=255, verbose_name='Nome')
    factor = models.ForeignKey(Fatores, on_delete=models.PROTECT, verbose_name='Fator')
    level = models.ForeignKey(Niveis, on_delete=models.PROTECT, verbose_name='Nivel')
    score = models.IntegerField(blank=True, null=True, verbose_name='Pontos')
    detail = models.CharField(max_length=255, verbose_name='Descrição', blank=True, default="")

    def __str__(self):
        return f"{self.factor}" f" --- {self.level}" f" ---  {self.score}"

    class Meta:
        verbose_name = 'Matriz'
        verbose_name_plural = 'Matrizes'


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
        verbose_name_plural = 'Grades'
