from django.shortcuts import render
from django.urls import reverse_lazy
from django.views.generic import DeleteView, CreateView, UpdateView
from django.views.generic.detail import DetailView
from django.views.generic.list import ListView
from django.contrib.auth.mixins import LoginRequiredMixin

from tenants.utils import tenant_from_request
from report.mixins import PdfResponseMixin
from .forms import DescricaoForm
from .models import Descricao, Area
from admin_descricao.models import Descricoes


class DescricaoDetailView(LoginRequiredMixin, DetailView):
    model = Descricao
    context_object_name = "descricao"


class DescricaoListView(LoginRequiredMixin, ListView):
    model = Descricao
    context_object_name = "descricao"

    def get_queryset(self):
        tenant_id = tenant_from_request(self.request)
        return super().get_queryset().filter(tenant_id=tenant_id).all()


class DescricaoDeleteView(LoginRequiredMixin, DeleteView):
    model = Descricao
    context_object_name = "descricao"
    success_url = reverse_lazy("descricao:descricao-list")


class DescricaoCreateView(LoginRequiredMixin, CreateView):
    model = Descricao
    form_class = DescricaoForm
    success_url = reverse_lazy("descricao:descricao-list")

    # Forçar o preenchimento do tenant_id com o tenant_id do usuario logado
    def form_valid(self, form):
        tenant_id = tenant_from_request(self.request)
        form.instance.tenant_id = tenant_id
        return super(DescricaoCreateView, self).form_valid(form)

    # pegar o tenant do usuario logado para filtrar a dropdonw
    def get_form_kwargs(self, *args, **kwargs):
        kwargs = super(DescricaoCreateView, self).get_form_kwargs()
        tenant_id = tenant_from_request(self.request)
        kwargs['tenant_id'] = tenant_id
        return kwargs


class DescricaoModeloCreateView(LoginRequiredMixin, CreateView):
    model = Descricao
    form_class = DescricaoForm
    success_url = reverse_lazy("descricao:descricao-list")

    # Forçar o preenchimento do tenant_id com o tenant_id do usuario logado
    def form_valid(self, form):
        tenant_id = tenant_from_request(self.request)
        form.instance.tenant_id = tenant_id
        return super(DescricaoModeloCreateView, self).form_valid(form)

    # pegar o tenant do usuario logado para filtrar a dropdonw
    def get_form_kwargs(self, *args, **kwargs):
        kwargs = super(DescricaoModeloCreateView, self).get_form_kwargs()
        tenant_id = tenant_from_request(self.request)
        cbo = "testem"
        kwargs['tenant_id'] = tenant_id
        kwargs['cbo'] = cbo
        return kwargs


class DescricaoUpdateView(LoginRequiredMixin, UpdateView):
    model = Descricao
    form_class = DescricaoForm
    success_url = reverse_lazy("descricao:descricao-list")

    # pegar o tenant do usuario logado para filtrar a dropdonw
    def get_form_kwargs(self, *args, **kwargs):
        kwargs = super(DescricaoUpdateView, self).get_form_kwargs()
        tenant_id = tenant_from_request(self.request)
        kwargs['tenant_id'] = tenant_id
        return kwargs


class DescricaoPdfDetailView(PdfResponseMixin, DetailView):
    model = Descricao
    context_object_name = 'descricao'


# Carregar as areas de acordo com os diretorias
def load_areas(request):
    board_id = request.GET.get('board')
    areas = Area.objects.filter(board_id=board_id).order_by('name')
    return render(request, 'descricao/area_dropdown_list_options.html', {'areas': areas})

