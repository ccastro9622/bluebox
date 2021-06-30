from django.db import models
from django.contrib.auth.models import PermissionsMixin
from django.contrib.auth.base_user import AbstractBaseUser
from person.models import Person
from tenants.models import Tenant

from .managers import CustomUserManager


class CustomUser(AbstractBaseUser, PermissionsMixin):
    email = models.EmailField(unique=True, verbose_name='E-mail')
    name = models.CharField(max_length=255, verbose_name='Nome')
    date_joined = models.DateTimeField(auto_now_add=True, verbose_name='Data de inscrição')
    is_staff = models.BooleanField(default=False, verbose_name='É da equipe')
    is_active = models.BooleanField(default=True, verbose_name='Ativo')
    person = models.OneToOneField(Person, on_delete=models.PROTECT, blank=True, null=True, verbose_name='Pessoa')
    tenants = models.ManyToManyField(Tenant)
    default_tenant = models.ForeignKey(Tenant, on_delete=models.CASCADE, related_name='default_tenant', default=1, verbose_name='Empresa')

    objects = CustomUserManager()

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = []

    class Meta:
        verbose_name = 'Usuário'
        verbose_name_plural = 'Usuários'

    def __str__(self):
        return self.name

    @property
    def list_tenants(self):
        list_tenants = [x.__str__() for x in self.tenants.all().order_by("name")]
        return list_tenants


