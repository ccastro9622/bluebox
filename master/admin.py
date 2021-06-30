from django.contrib import admin
from .models import Diretoria, Area


@admin.register(Diretoria)
class DiretoriaAdmin(admin.ModelAdmin):
    pass


@admin.register(Area)
class AreasAdmin(admin.ModelAdmin):
    pass
