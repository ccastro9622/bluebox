from django.urls import reverse_lazy
from django.views.generic import DeleteView, CreateView, UpdateView
from django.views.generic.detail import DetailView
from django.views.generic.list import ListView
from django.contrib.auth.mixins import LoginRequiredMixin

from tenants.utils import tenant_from_request

from .models import Avaliacao


class AvaliacaoDetailView(LoginRequiredMixin, DetailView):
    model = Avaliacao
    context_object_name = "avaliacao"


class AvaliacaoListView(LoginRequiredMixin, ListView):
    model = Avaliacao
    context_object_name = "avaliacao"

    def get_queryset(self):
        tenant_id = tenant_from_request(self.request)
        return super().get_queryset().filter(tenant_id=tenant_id).all()


class AvaliacaoDeleteView(LoginRequiredMixin, DeleteView):
    model = Avaliacao
    context_object_name = "avaliacao"
    success_url = reverse_lazy("avaliacao:avaliacao-list")


class AvaliacaoCreateView(LoginRequiredMixin, CreateView):
    model = Avaliacao
    # form_class = AvaliacaoForm
    success_url = reverse_lazy("avaliacao:avaliacao-list")

    def get_initial(self, *args, **kwargs):
        initial = super(AvaliacaoCreateView, self).get_initial(**kwargs)
        initial['status'] = "Aberto"
        return initial

class AvaliacaoUpdateView(LoginRequiredMixin, UpdateView):
    model = Avaliacao
    # form_class = AvaliacaoForm
    success_url = reverse_lazy("avaliacao:avaliacao-list")

    # pegar o tenant do usuario logado para filtrar a dropdonw
    def get_form_kwargs(self, *args, **kwargs):
        kwargs = super(AvaliacaoUpdateView, self).get_form_kwargs()
        tenant_id = tenant_from_request(self.request)
        kwargs['tenant_id'] = tenant_id
        return kwargs