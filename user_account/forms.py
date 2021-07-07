from django.contrib.auth.forms import UserCreationForm, UserChangeForm

from .models import CustomUser

from tenants.utils import tenant_from_request


class CustomUserCreationForm(UserCreationForm):
    class Meta(UserCreationForm):
        model = CustomUser
        fields = ('email', 'name', 'default_tenant')


class CustomUserChangeForm(UserChangeForm):
    class Meta:
        model = CustomUser
        fields = ('email', 'name', 'default_tenant')
