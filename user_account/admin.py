from django.contrib import admin
from django.contrib.auth.admin import UserAdmin

from .forms import CustomUserCreationForm, CustomUserChangeForm
from .models import CustomUser


class CustomUserAdmin(UserAdmin):
    add_form = CustomUserCreationForm
    form = CustomUserChangeForm
    model = CustomUser
    list_display = ['email', 'name', 'kind', 'is_staff', 'is_active', 'date_joined', 'default_tenant', 'list_tenants']
    list_filter = ('is_staff', 'is_active',)
    fieldsets = (
        (None, {'fields': ('name', 'email', 'kind', 'password', 'default_tenant', 'tenants')}),
        ('Permissions', {'fields': ('is_staff', 'is_active', 'is_superuser')}),
    )
    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('name', 'email', 'kind', 'password1', 'password2', 'default_tenant', 'tenants', 'is_staff', 'is_active', 'is_superuser')}
         ),
    )
    search_fields = ('email',)
    ordering = ('name',)

    filter_horizontal = ["tenants"]


admin.site.register(CustomUser, CustomUserAdmin)
