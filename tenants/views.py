from django.urls import reverse_lazy
from django.views.generic import DeleteView, CreateView, UpdateView
from django.views.generic.detail import DetailView
from django.views.generic.list import ListView
from django.contrib.auth.mixins import LoginRequiredMixin

from .models import Tenant


class TenantDetailView(LoginRequiredMixin, DetailView):
    model = Tenant
    context_object_name = "tenant"


class TenantListView(LoginRequiredMixin, ListView):
    model = Tenant
    context_object_name = "tenant"


class TenantDeleteView(LoginRequiredMixin, DeleteView):
    model = Tenant
    context_object_name = "tenant"
    success_url = reverse_lazy("tenants:tenant-list")


class TenantCreateView(LoginRequiredMixin, CreateView):
    model = Tenant
    fields = ['name']  # preencher todos os da views.py
    success_url = reverse_lazy("tenants:tenant-list")


class TenantUpdateView(LoginRequiredMixin, UpdateView):
    model = Tenant
    fields = ['name']  # preencher todos os da views.py
    success_url = reverse_lazy("tenants:tenant-list")
