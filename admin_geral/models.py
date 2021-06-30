from django.db import models


class Plans(models.Model):
    name = models.CharField(max_length=255, verbose_name='Nome')
    detail = models.CharField(max_length=255, verbose_name='Descrição', blank=True, default="")
    value = models.DecimalField(max_digits=8, decimal_places=2, default=0, verbose_name='Valor')
    discount = models.CharField(max_length=255, verbose_name='Cupom', blank=True, default="")
    percent = models.IntegerField(blank=True, null=True, default=0, verbose_name='Percentual')

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = 'Plano'
        verbose_name_plural = 'Planos'


class Sector(models.Model):
    name = models.CharField(max_length=255, verbose_name='Nome')
    detail = models.CharField(max_length=255, verbose_name='Descrição', blank=True, default="")

    def __str__(self):
        return f"{self.name}"

    class Meta:
        verbose_name = 'Setor'
        verbose_name_plural = 'Setores'
