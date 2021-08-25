from django.contrib import admin
from .models import Plans, Sector


@admin.register(Plans)
class PlansAdmin(admin.ModelAdmin):
    ordering = ('name',)
    pass


@admin.register(Sector)
class Sectordmin(admin.ModelAdmin):
    ordering = ('name',)
    pass
