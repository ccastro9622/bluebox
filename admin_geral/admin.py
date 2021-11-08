from django.contrib import admin
from .models import Plans, Sector, Nivelcargo, Origemcapital, Tipoempresa, Governanca, Dimensao


@admin.register(Plans)
class PlansAdmin(admin.ModelAdmin):
    ordering = ('name',)
    pass


@admin.register(Sector)
class Sectordmin(admin.ModelAdmin):
    ordering = ('name',)
    pass


@admin.register(Nivelcargo)
class Nivelcargoadmin(admin.ModelAdmin):
    ordering = ('name',)
    pass

@admin.register(Origemcapital)
class Origemcapitaladmin(admin.ModelAdmin):
    ordering = ('name',)
    pass

@admin.register(Tipoempresa)
class Tipoempresaadmin(admin.ModelAdmin):
    ordering = ('name',)
    pass

@admin.register(Governanca)
class Governancaadmin(admin.ModelAdmin):
    ordering = ('name',)
    pass

@admin.register(Dimensao)
class Dimensaoadmin(admin.ModelAdmin):
    ordering = ('name',)
    pass
