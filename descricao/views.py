from django.urls import reverse_lazy
from django.views.generic import DeleteView, CreateView, UpdateView
from django.views.generic.detail import DetailView
from django.views.generic.list import ListView
from django.contrib.auth.mixins import LoginRequiredMixin

from tenants.utils import tenant_from_request, user_from_request
from report.mixins import PdfResponseMixin
from .forms import DescricaoForm, DescricaoModeloForm
from .models import Descricao, Area, SubFamilias
from admin_descricao.models import Descricoes

from rest_framework import viewsets, status
from rest_framework.response import Response
from django.db.models import Q
from django.shortcuts import render
from api.serializers import DocumentSerializer

from django.http import FileResponse
import os

DOCUMENT_COLUMNS = (
    (0, 'id'),
    (1, 'name'),
    # (2, 'interview'),
    # (3, 'school'),
    # (4, 'created_date'),
    # (5, 'altered_date'),
    # (6, 'status'),
    # (7, 'submit_to_esignature'),
    # (8, 'send_email'),
)


class DescricaoDetailView(LoginRequiredMixin, DetailView):
    model = Descricao
    context_object_name = "descricao"


class DescricaoListView(LoginRequiredMixin, ListView):
    model = Descricao
    context_object_name = "descricao"

    def get_queryset(self):
        tenant_id = tenant_from_request(self.request)
        return super().get_queryset().filter(tenant_id=tenant_id).all()


class DescricaoRelListView(LoginRequiredMixin, ListView):
    template_name = 'descricao/descricao_rel_list.html'
    model = Descricao
    context_object_name = "descricao"

    def get_queryset(self):
        tenant_id = tenant_from_request(self.request)
        return super().get_queryset().filter(tenant_id=tenant_id).all()


class DescricaoPdfListView(PdfResponseMixin, ListView):
    template_name = 'descricao/descricao_pdf_list.html'
    model = Descricao
    context_object_name = "descricao"

    def get_queryset(self):
        tenant_id = tenant_from_request(self.request)
        return self.model.objects.filter(tenant_id=tenant_id).all()


class DescricaoDeleteView(LoginRequiredMixin, DeleteView):
    model = Descricao
    context_object_name = "descricao"
    success_url = reverse_lazy("descricao:descricao-list")


class DescricaoCreateView(LoginRequiredMixin, CreateView):
    model = Descricao
    form_class = DescricaoForm
    success_url = reverse_lazy("descricao:descricao-list")

    def get_initial(self, *args, **kwargs):
        initial = super(DescricaoCreateView, self).get_initial(**kwargs)
        initial['status'] = "Aberto"
        return initial

    # Forçar o preenchimento do tenant_id com o tenant_id do usuario logado
    def form_valid(self, form):
        tenant_id = tenant_from_request(self.request)
        form.instance.tenant_id = tenant_id
        user_id = user_from_request(self.request)
        form.instance.user_id = user_id
        return super(DescricaoCreateView, self).form_valid(form)

    # pegar o tenant do usuario logado para filtrar a dropdonw
    def get_form_kwargs(self, *args, **kwargs):
        kwargs = super(DescricaoCreateView, self).get_form_kwargs()
        tenant_id = tenant_from_request(self.request)
        kwargs['tenant_id'] = tenant_id
        return kwargs


class DescricaoModeloCreateView(LoginRequiredMixin, CreateView):
    model = Descricao
    form_class = DescricaoModeloForm
    success_url = reverse_lazy("descricao:descricao-list")

    def get_initial(self, *args, **kwargs):
        initial = super(DescricaoModeloCreateView, self).get_initial(**kwargs)
        descricao_admin = Descricoes.objects.filter(id=self.kwargs.get("pk")).first()
        if descricao_admin:
            initial['title'] = descricao_admin.title
            initial['cbo'] = descricao_admin.cbo
            initial['summary'] = descricao_admin.title
            initial['summary_goal'] = descricao_admin.summary_goal
            initial['summary_coverage'] = descricao_admin.summary_coverage
            initial['responsibility'] = descricao_admin.responsibility
            initial['formation'] = descricao_admin.formation
            initial['areas'] = descricao_admin.areas
            initial['specialization'] = descricao_admin.specialization
            initial['area_specialization'] = descricao_admin.area_specialization
            initial['experience'] = descricao_admin.experience
            initial['qualification'] = descricao_admin.qualification
            initial['status'] = "Aberto"
        return initial

    # Forçar o preenchimento do tenant_id com o tenant_id do usuario logado
    def form_valid(self, form):
        tenant_id = tenant_from_request(self.request)
        form.instance.tenant_id = tenant_id
        user_id = user_from_request(self.request)
        form.instance.user_id = user_id
        return super(DescricaoModeloCreateView, self).form_valid(form)

    # pegar o tenant do usuario logado para filtrar a dropdonw
    def get_form_kwargs(self, *args, **kwargs):
        kwargs = super(DescricaoModeloCreateView, self).get_form_kwargs()
        tenant_id = tenant_from_request(self.request)
        kwargs['tenant_id'] = tenant_id
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


# Carregar as areas de acordo com os diretorias
def load_sub_familias(request):
    family_id = request.GET.get('family')
    sub_familias = SubFamilias.objects.filter(family_id=family_id).order_by('name')
    return render(request, 'descricao/sub_familia_dropdown_list_options.html', {'sub_familias': sub_familias})


# Relatorio personalizado
def query_documents_by_args(pk=None, **kwargs):
    draw = int(kwargs.get('draw', None)[0])
    length = int(kwargs.get('length', None)[0])
    start = int(kwargs.get('start', None)[0])
    search_value = kwargs.get('search[value]', None)[0]
    order_column = int(kwargs.get('order[0][column]', None)[0])
    order = kwargs.get('order[0][dir]', None)[0]

    order_column = DOCUMENT_COLUMNS[order_column]
    # django orm '-' -> desc
    if order == 'desc':
        order_column = '-' + order_column[1]
    else:
        order_column = order_column[1]

    queryset = Descricao.objects.filter(tenant=1)
    total = queryset.count()

    if search_value:
        queryset = queryset.filter(Q(status_icontains=search_value))
        
    count = queryset.count()
    queryset = queryset.order_by(order_column)[start:start + length]
    data = {
        'items': queryset,
        'count': count,
        'total': total,
        'draw': draw,
    }
    return data


def mostra_pdf(request):
    filepath = os.path.join('static', '/home/cristiano/bluebox/staticfiles/pdf/manual_cargos.pdf')
    return FileResponse(open(filepath, 'rb'), content_type='application/pdf')