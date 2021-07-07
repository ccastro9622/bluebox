from django.urls import reverse_lazy
from django.views.generic import DeleteView, CreateView, UpdateView
from django.views.generic.detail import DetailView
from django.views.generic.list import ListView
from django.contrib.auth.mixins import LoginRequiredMixin

from tenants.utils import tenant_from_request
from .forms import AreaForm
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
    fields = ['name']  # preencher todos os da views.py
    success_url = reverse_lazy("master:diretoria-list")

    def form_valid(self, form):
        tenant_id = tenant_from_request(self.request)
        form.instance.tenant_id = tenant_id
        return super(DiretoriaCreateView, self).form_valid(form)


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
    form_class = AreaForm
    # fields = ['name', 'board']  # preencher todos os da views.py
    success_url = reverse_lazy("master:area-list")

# Forçar o preencimento do tenant_id com o tenant_id do usuario logado
    def form_valid(self, form):
        tenant_id = tenant_from_request(self.request)
        form.instance.tenant_id = tenant_id
        return super(AreaCreateView, self).form_valid(form)

# pegar o tenant do usuario logado para filtrar a dropdonw
    def get_form_kwargs(self, *args, **kwargs):
        kwargs = super(AreaCreateView, self).get_form_kwargs()
        tenant_id = tenant_from_request(self.request)
        kwargs['tenant_id'] = tenant_id
        return kwargs


class AreaUpdateView(LoginRequiredMixin, UpdateView):
    model = Area
    fields = ['name', 'board', 'tenant']  # preencher todos os da views.py
    success_url = reverse_lazy("master:area-list")
