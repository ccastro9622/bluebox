from django.contrib import admin
from django.http import HttpResponseRedirect
from django.shortcuts import redirect

from import_export import resources
from import_export.admin import ImportExportModelAdmin

from .models import Familias, SubFamilias, Fatores, Niveis, Matrizes, Grades, Conhecimentos, Combinacoes

from django.forms import TextInput
from django.db import models

@admin.register(Familias)
class FamiliasAdmin(admin.ModelAdmin):
    # self.message_user(request, "Sem Voltar")
    ordering = ('name',)
    list_display = ['id','name', 'is_active']
    pass

# @admin.register(SubFamilias)
# class SubFamiliasAdmin(admin.ModelAdmin):
#     ordering = ('name',)
#     pass


class SubFamiliasAdmin(admin.ModelAdmin):
    ordering = ('name','name',)
    list_display = ['id','name', 'family', 'is_active']


admin.site.register(SubFamilias, SubFamiliasAdmin)


@admin.register(Fatores)
class FatoresAdmin(admin.ModelAdmin):
    ordering = ('code', 'name',)
    list_display = ['code', 'name', 'is_active']
    pass


# @admin.register(Niveis)
# class NiveisAdmin(admin.ModelAdmin):
#     ordering = ('factor', 'name')
#     pass


# @admin.register(Matrizes)
# class MatrizesAdmin(admin.ModelAdmin):
#     ordering = ('name',)
#     list_display = ['name', 'is_active']
#     pass


# @admin.register(Grades)
# class GradesAdmin(admin.ModelAdmin):
#     ordering = ('number',)
#     list_display = ['number','minimum','average','maximum']
#     pass


# @admin.register(Conhecimentos)
# class ConhecimentosAdmin(admin.ModelAdmin):
#     ordering = ('code',)
#     list_display = ['code','name']
#     pass


# @admin.register(Combinacoes)
# class CombinacoesAdmin(admin.ModelAdmin):
#     ordering = ('name',)
#     list_display = ['name','grade']
#     pass


# excell
class CombinacoesResource(resources.ModelResource):
    class Meta:
        model = Combinacoes
        skip_unchanged = True


class CombinacoesAdminImp(ImportExportModelAdmin):
    ordering = ('id',)
    list_display = ['name','grade']
    resource_class = CombinacoesResource
    formfield_overrides = {
        models.CharField: {'widget': TextInput(attrs={'size': '82'})},
    }


admin.site.register(Combinacoes, CombinacoesAdminImp)


class NiveisResource(resources.ModelResource):
    class Meta:
        model = Niveis
        skip_unchanged = True


class NiveisAdminImp(ImportExportModelAdmin):
    ordering = ('factor', 'code', 'name',)
    list_display = ['factor', 'code', 'name']
    formfield_overrides = {
        models.CharField: {'widget': TextInput(attrs={'size':'82'})},
    }


admin.site.register(Niveis, NiveisAdminImp)
