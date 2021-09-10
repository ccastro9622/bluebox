from django.db import models


class Plans(models.Model):
    name = models.CharField(max_length=255, verbose_name='Nome', unique=True)
    detail = models.CharField(max_length=255, verbose_name='Descrição', blank=True, default="")
    value = models.DecimalField(max_digits=8, decimal_places=2, default=0, verbose_name='Valor')
    discount = models.CharField(max_length=255, verbose_name='Cupom', blank=True, default="")
    percent = models.IntegerField(blank=True, null=True, default=0, verbose_name='Percentual')
    is_active = models.BooleanField(default=True, verbose_name='Ativo')

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = 'Plano'
        verbose_name_plural = 'Planos'


class Sector(models.Model):
    name = models.CharField(max_length=255, verbose_name='Nome', unique=True)
    is_active = models.BooleanField(default=True, verbose_name='Ativo')

    def __str__(self):
        return f"{self.name}"

    class Meta:
        verbose_name = 'Setor de Atuação'
        verbose_name_plural = 'Setores de Atuação'


class Nivelcargo(models.Model):
    name = models.CharField(max_length=255, verbose_name='Nome')
    is_active = models.BooleanField(default=True, verbose_name='Ativo')

    def __str__(self):
        return f"{self.name}"

    class Meta:
        verbose_name = 'Nivel do Cargo'
        verbose_name_plural = 'Niveis do Cargo'