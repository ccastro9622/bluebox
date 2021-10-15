from django.contrib import admin
from .models import Formacao, Areas, Idiomas, Habilitacoes, Especializacoes, Descricoes, Experiencias, Status

from import_export import resources
from import_export.admin import ImportExportModelAdmin


@admin.register(Formacao)
class FormacaoAdmin(admin.ModelAdmin):
    ordering = ('name',)
    pass


@admin.register(Areas)
class AreasAdmin(admin.ModelAdmin):
    ordering = ('name',)
    pass


@admin.register(Idiomas)
class IdiomasAdmin(admin.ModelAdmin):
    ordering = ('name',)
    pass


@admin.register(Habilitacoes)
class HabilitacoesAdmin(admin.ModelAdmin):
    ordering = ('name',)
    pass


@admin.register(Especializacoes)
class EspecializacoesAdmin(admin.ModelAdmin):
    ordering = ('name',)
    pass


@admin.register(Experiencias)
class ExperienciasAdmin(admin.ModelAdmin):
    ordering = ('name',)
    pass


# excell
class DescricoesResource(resources.ModelResource):
    class Meta:
        model = Descricoes
        skip_unchanged = True


class DescricoesAdminImp(ImportExportModelAdmin):
    resource_class = DescricoesResource


admin.site.register(Descricoes, DescricoesAdminImp)


@admin.register(Status)
class StatusAdmin(admin.ModelAdmin):
    ordering = ('id',)
    pass