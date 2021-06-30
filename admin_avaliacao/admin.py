from django.contrib import admin
from .models import Familias, SubFamilias, Fatores, Niveis, Matrizes, Grades


@admin.register(Familias)
class FamiliasAdmin(admin.ModelAdmin):
    pass


@admin.register(SubFamilias)
class SubFamiliasAdmin(admin.ModelAdmin):
    pass


@admin.register(Fatores)
class FatoresAdmin(admin.ModelAdmin):
    pass


@admin.register(Niveis)
class NiveisAdmin(admin.ModelAdmin):
    pass


@admin.register(Matrizes)
class MatrizesAdmin(admin.ModelAdmin):
    pass


@admin.register(Grades)
class GradesAdmin(admin.ModelAdmin):
    pass
