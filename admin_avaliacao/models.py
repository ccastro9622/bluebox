from django.db import models


class Familias(models.Model):
    name = models.CharField(max_length=255, verbose_name='Nome*',unique=True)
    detail = models.TextField(max_length=1000, verbose_name='Descrição', blank=True, default="")
    is_active = models.BooleanField(default=True, verbose_name='Ativo')

    def __str__(self):
        return f"{self.name}"

    class Meta:
        verbose_name = 'Família'
        verbose_name_plural = '      Famílias de Cargo'


class SubFamilias(models.Model):
    name = models.CharField(max_length=255, verbose_name='SubFamília*')
    family = models.ForeignKey(Familias, on_delete=models.PROTECT, limit_choices_to={'is_active': True}, verbose_name='Familia*')
    detail = models.TextField(max_length=1000, verbose_name='Descrição', blank=True, default="")
    is_active = models.BooleanField(default=True, verbose_name='Ativo')

    def __str__(self):
        return f"{self.name}"

    class Meta:
        ordering = ["family"]
        verbose_name = ' SubFamília'
        verbose_name_plural = '     SubFamílias de Cargo'


class Fatores(models.Model):
    code = models.IntegerField(verbose_name='Código*', default=1, unique=True)
    name = models.CharField(max_length=255, verbose_name='Nome*')
    detail = models.TextField(max_length=1000, verbose_name='Descrição', blank=True, default="")
    is_active = models.BooleanField(default=True, verbose_name='Ativo')

    def __str__(self):
        return f"{self.code}" f" - {self.name}"

    class Meta:
        verbose_name = 'Fator'
        verbose_name_plural = '    Fatores de Avaliação'


class Niveis(models.Model):
    factor = models.ForeignKey(Fatores, on_delete=models.PROTECT, verbose_name='Fator*')
    code = models.IntegerField(verbose_name='Código*', default=1)
    name = models.CharField(max_length=255, verbose_name='Nome*')
    detail = models.TextField(max_length=1000, verbose_name='Descrição', blank=True, default="")
    is_active = models.BooleanField(default=True, verbose_name='Ativo')

    def __str__(self):
        return f"{self.name} " #f"{self.factor}" f" ---> {self.code}" f" - {self.name}"

    class Meta:
        verbose_name = 'Fator / Nível'
        verbose_name_plural = '   Níveis de Avaliação'


class Matrizes(models.Model):
    name = models.CharField(max_length=255, verbose_name='Nome*', unique=True)
    factor = models.ForeignKey(Fatores, on_delete=models.PROTECT, verbose_name='Fator*')
    level = models.ForeignKey(Niveis, on_delete=models.PROTECT, verbose_name='Nível*')
    score = models.IntegerField(blank=True, null=True, verbose_name='Pontos')
    detail = models.CharField(max_length=255, verbose_name='Descrição', blank=True, default="")
    is_active = models.BooleanField(default=True, verbose_name='Ativo')

    def __str__(self):
        return f"{self.factor}" f" --- {self.level}" f" ---  {self.score}"

    class Meta:
        verbose_name = 'Matriz'
        verbose_name_plural = ' Matrizes'


class Grades(models.Model):
    number = models.IntegerField(verbose_name='Número*')
    minimum = models.IntegerField(blank=True, null=True, verbose_name='Mínimo')
    average = models.IntegerField(blank=True, null=True,verbose_name='Média')
    maximum= models.IntegerField(blank=True, null=True, verbose_name='Máximo')
    detail = models.CharField(max_length=255, verbose_name='Descrição', blank=True, default="")

    def __str__(self):
        return f"{self.number}" # f" --- {self.minimum}"  f" --- {self.average}" f" --- {self.maximum}"

    class Meta:
        verbose_name = 'Grade'
        verbose_name_plural = '  Grades'


class Conhecimentos(models.Model):
    code = models.IntegerField(verbose_name='Código*', unique=True, default=1)
    name = models.CharField(max_length=255, verbose_name='Nome*', unique=True)
    is_active = models.BooleanField(default=True, verbose_name='Ativo')

    def __str__(self):
        return f"{self.code}" f" - {self.name}"

    class Meta:
        verbose_name = 'Conhecimento'
        verbose_name_plural = 'Conhecimentos'