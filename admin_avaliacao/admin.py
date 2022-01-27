from django.contrib import admin
from django.http import HttpResponseRedirect
from django.shortcuts import redirect

from .models import Familias, SubFamilias, Fatores, Niveis, Matrizes, Grades

from django.forms import TextInput
from django.db import models





@admin.register(Familias)
class FamiliasAdmin(admin.ModelAdmin):
    # self.message_user(request, "Sem Voltar")
    ordering = ('name',)
    pass


# @admin.register(SubFamilias)
# class SubFamiliasAdmin(admin.ModelAdmin):
#     ordering = ('name',)
#     pass

class SubFamiliasAdmin(admin.ModelAdmin):
    ordering = ('family', 'name',)
    list_display = ['family', 'name']


admin.site.register(SubFamilias, SubFamiliasAdmin)


@admin.register(Fatores)
class FatoresAdmin(admin.ModelAdmin):
    ordering = ('code', 'name',)
    pass


# @admin.register(Niveis)
# class NiveisAdmin(admin.ModelAdmin):
#     ordering = ('factor', 'name')
#     pass


@admin.register(Matrizes)
class MatrizesAdmin(admin.ModelAdmin):
    ordering = ('name',)
    pass


@admin.register(Grades)
class GradesAdmin(admin.ModelAdmin):
    ordering = ('number',)
    list_display = ['number','minimum','average','maximum']
    pass


class NiveisAdmin(admin.ModelAdmin):
    ordering = ('factor', 'code', 'name',)
    list_display = ['factor', 'code', 'name']
    formfield_overrides = {
        models.CharField: {'widget': TextInput(attrs={'size':'82'})},
    }


admin.site.register(Niveis, NiveisAdmin)
