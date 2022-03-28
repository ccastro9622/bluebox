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
    list_display = ['name', 'is_active']
    pass


# @admin.register(SubFamilias)
# class SubFamiliasAdmin(admin.ModelAdmin):
#     ordering = ('name',)
#     pass

class SubFamiliasAdmin(admin.ModelAdmin):
    ordering = ('name','name',)
    list_display = ['family', 'name', 'is_active']


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


@admin.register(Matrizes)
class MatrizesAdmin(admin.ModelAdmin):
    ordering = ('name',)
    list_display = ['name', 'is_active']
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
