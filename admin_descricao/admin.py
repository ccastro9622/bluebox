from django.contrib import admin
from .models import Formacao, Areas, Idiomas, Habilitacoes, Especializacoes, Descricoes, Experiencias

from import_export import resources
from import_export.admin import ImportExportModelAdmin


@admin.register(Formacao)
class FormacaoAdmin(admin.ModelAdmin):
    pass


@admin.register(Areas)
class AreasAdmin(admin.ModelAdmin):
    pass


@admin.register(Idiomas)
class IdiomasAdmin(admin.ModelAdmin):
    pass


@admin.register(Habilitacoes)
class HabilitacoesAdmin(admin.ModelAdmin):
    pass


@admin.register(Especializacoes)
class EspecializacoesAdmin(admin.ModelAdmin):
    pass


@admin.register(Experiencias)
class ExperienciasAdmin(admin.ModelAdmin):
    pass


class DescricoesResource(resources.ModelResource):
    class Meta:
        model = Descricoes
        skip_unchanged = True


class DescricoesAdminImp(ImportExportModelAdmin):
    resource_class = DescricoesResource


admin.site.register(Descricoes, DescricoesAdminImp)

