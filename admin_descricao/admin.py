from django.contrib import admin
from .models import Formacao, Areas, Idiomas, Habilitacoes, Especializacoes, Descricoes, Experiencias, Status, Gerencia, \
    Proficiencias, AreasEspecializacoes

from import_export import resources
from import_export.admin import ImportExportModelAdmin

from django.forms import TextInput, Textarea
from django.db import models


@admin.register(Formacao)
class FormacaoAdmin(admin.ModelAdmin):
    ordering = ('code', 'name' )
    list_display = ['id','code','name', 'is_active']
    pass


@admin.register(Areas)
class AreasAdmin(admin.ModelAdmin):
    ordering = ('name',)
    list_display = ['id','name', 'is_active']
    pass


@admin.register(Idiomas)
class IdiomasAdmin(admin.ModelAdmin):
    ordering = ('name',)
    pass


@admin.register(Habilitacoes)
class HabilitacoesAdmin(admin.ModelAdmin):
    ordering = ('name',)
    list_display = ['id','name', 'is_active']
    pass


@admin.register(Especializacoes)
class EspecializacoesAdmin(admin.ModelAdmin):
    ordering = ('name',)
    list_display = ['id','name', 'is_active']
    pass


# @admin.register(AreasEspecializacoes)
# class AreasEspecializacoesAdmin(admin.ModelAdmin):
#     ordering = ('name',)
#     list_display = ['name', 'is_active']
#     pass


@admin.register(Experiencias)
class ExperienciasAdmin(admin.ModelAdmin):
    ordering = ('name',)
    list_display = ['id', 'name']
    pass


# excell
class DescricoesResource(resources.ModelResource):
    ordering = ('title',)
    class Meta:
        model = Descricoes
        skip_unchanged = True


class DescricoesAdminImp(ImportExportModelAdmin):
    resource_class = DescricoesResource
    formfield_overrides = {
        models.CharField: {'widget': TextInput(attrs={'size': '82'})},
    }


admin.site.register(Descricoes, DescricoesAdminImp)


@admin.register(Status)
class StatusAdmin(admin.ModelAdmin):
    ordering = ('id',)
    list_display = ['id', 'name']
    pass


@admin.register(Gerencia)
class GerenciaAdmin(admin.ModelAdmin):
    ordering = ('id',)
    list_display = ['id', 'name']
    pass


@admin.register(Proficiencias)
class ProficienciasAdmin(admin.ModelAdmin):
    ordering = ('id','name',)
    list_display = ['id', 'name', 'is_active']
    pass