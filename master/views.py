from django.urls import reverse_lazy
from django.views.generic import DeleteView, CreateView, UpdateView
from django.views.generic.detail import DetailView
from django.views.generic.list import ListView
from django.contrib.auth.mixins import LoginRequiredMixin

from tenants.utils import tenant_from_request
from .models import Diretoria, Area


class DiretoriaDetailView(LoginRequiredMixin, DetailView):
    model = Diretoria
    context_object_name = "diretoria"


class DiretoriaListView(LoginRequiredMixin, ListView):
    model = Diretoria
    context_object_name = "diretoria"

    def get_queryset(self):
        tenant_id = tenant_from_request(self.request)
        return super().get_queryset().filter(tenant_id=tenant_id).all()


class DiretoriaDeleteView(LoginRequiredMixin, DeleteView):
    model = Diretoria
    context_object_name = "diretoria"
    success_url = reverse_lazy("master:diretoria-list")


class DiretoriaCreateView(LoginRequiredMixin, CreateView):
    model = Diretoria
    fields = ['name', 'tenant']  # preencher todos os da views.py
    success_url = reverse_lazy("master:diretoria-list")


class DiretoriaUpdateView(LoginRequiredMixin, UpdateView):
    model = Diretoria
    fields = ['name', 'tenant']  # preencher todos os da views.py
    success_url = reverse_lazy("master:diretoria-list")


class AreaDetailView(LoginRequiredMixin, DetailView):
    model = Diretoria
    context_object_name = "area"


class AreaListView(LoginRequiredMixin, ListView):
    model = Area
    context_object_name = "area"

    def get_queryset(self):
        tenant_id = tenant_from_request(self.request)
        return super().get_queryset().filter(tenant_id=tenant_id).all()


class AreaDeleteView(LoginRequiredMixin, DeleteView):
    model = Area
    context_object_name = "area"
    success_url = reverse_lazy("master:area-list")


class AreaCreateView(LoginRequiredMixin, CreateView):
    model = Area
    fields = ['name', 'board', 'tenant']  # preencher todos os da views.py
    success_url = reverse_lazy("master:area-list")


class AreaUpdateView(LoginRequiredMixin, UpdateView):
    model = Area
    fields = ['name', 'board', 'tenant']  # preencher todos os da views.py
    success_url = reverse_lazy("master:area-list")
