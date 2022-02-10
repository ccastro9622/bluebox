import csv

from django.urls import reverse_lazy
from django.views.generic import DeleteView, CreateView, UpdateView
from django.views.generic.detail import DetailView
from django.views.generic.list import ListView
from django.contrib.auth.mixins import LoginRequiredMixin

from tenants.utils import tenant_from_request, user_from_request
from report.mixins import PdfResponseMixin
from .forms import DescricaoForm, DescricaoModeloForm, DescricaoAprovadorForm, DescricaoAprovacaoForm
from .models import Descricao, Area, SubFamilias
from admin_descricao.models import Descricoes

from rest_framework import viewsets, status
from rest_framework.response import Response
from django.db.models import Q
from django.shortcuts import render
from api.serializers import DocumentSerializer

from django.http import FileResponse, HttpResponse


import os

DOCUMENT_COLUMNS = (
    (0, 'title'),
    (1, 'status'),
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


class DescricaoAprovadorListView(LoginRequiredMixin, ListView):
    template_name = 'descricao/descricao_list_aprovador.html'
    model = Descricao
    context_object_name = "descricao"

    def get_queryset(self):
        tenant_id = tenant_from_request(self.request)
        return super().get_queryset().filter(tenant_id=tenant_id, status=2).all()


class DescricaoAprovacaoListView(LoginRequiredMixin, ListView):
    template_name = 'descricao/descricao_list_aprovacao.html'
    model = Descricao
    context_object_name = "descricao"

    def get_queryset(self):
        tenant_id = tenant_from_request(self.request)
        user_id = user_from_request(self.request)
        return super().get_queryset().filter(tenant_id=tenant_id, status=3, approver_id=user_id).all()


# usado na avaliacao para buscar um modelo.
class DescricaomodeloListView(LoginRequiredMixin, ListView):
    template_name = 'descricao/descricaomodelo_list.html'
    model = Descricao
    context_object_name = "descricao"

    def get_queryset(self):
        tenant_id = tenant_from_request(self.request)
        return super().get_queryset().filter(tenant_id=tenant_id, status=4).all()


class DescricaoRelListView(LoginRequiredMixin, ListView):
    template_name = 'descricao/descricao_rel_list.html'
    model = Descricao
    context_object_name = "descricao"

    def get_queryset(self):
        tenant_id = tenant_from_request(self.request)
        return super().get_queryset().filter(tenant_id=tenant_id).all()


# Chamado no batao de gerar pdf do relatorio de acompanhamento
class DescricaoPdfListView(PdfResponseMixin, ListView):
    template_name = 'descricao/descricao_pdf_list.html'
    model = Descricao
    context_object_name = "descricao"

    def get_queryset(self):
        tenant_id = tenant_from_request(self.request)
        return self.model.objects.filter(tenant_id=tenant_id).all()


# Chamado no batao de gerar excel do relatorio de acompanhamento
def export_users_csv(request):
    response = HttpResponse(content_type='text/csv')
    response['Content-Disposition'] = 'attachment; filename="descricoes.csv"'

    writer = csv.writer(response)
    writer.writerow(['Titulo', 'Status', 'Usuário', 'Aprovador', 'Data'])

    # tenant_id = tenant_from_request(request)
    descricoes = Descricao.objects.all() #filter(tenant_id=tenant_id).all()


    # Descricoes = Descricao.objects.filter(tenant_id=tenant_id).all().values_list('username', 'first_name', 'last_name', 'email')
    # Descricao.objects.filter

    # users = User.objects.all().values_list('username', 'first_name', 'last_name', 'email')

    # for descricao in descricoes:
    writer.writerows((descricao.title, descricao.status, descricao.user_id, descricao.approver,descricao.date_conclusion) for descricao in descricoes)

    return response


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
        initial['status'] = 1
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
            initial['status'] = 1
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


class DescricaoAprovadorUpdateView(LoginRequiredMixin, UpdateView):
    template_name = 'descricao/descricao_form_aprovador.html'
    model = Descricao
    form_class = DescricaoAprovadorForm
    # success_url = reverse_lazy("descricao:descricao-list-aprovador")
    # success_url = reverse_lazy("descricao:descricao-email",
    #                            kwargs={'title':  , 'email: '})
    # reverse_lazy('accounts:detail', kwargs={'id': 10})
    # href = "{% url 'descricao:descricao-email' descricao.title descricao.approver.email %}"
    # render(request, 'descricao/area_dropdown_list_options.html', {'areas': areas})

    def get_initial(self, *args, **kwargs):
        initial = super(DescricaoAprovadorUpdateView, self).get_initial(**kwargs)
        initial['status'] = 3
        return initial

    # pegar o tenant do usuario logado para filtrar a dropdonw
    def get_form_kwargs(self, *args, **kwargs):
        kwargs = super(DescricaoAprovadorUpdateView, self).get_form_kwargs()
        tenant_id = tenant_from_request(self.request)
        kwargs['tenant_id'] = tenant_id
        return kwargs

    def get_success_url(self):
        descricao = self.get_object()
        return reverse_lazy("descricao:descricao-email", kwargs={'title': descricao.title, 'email': descricao.approver.email})


class DescricaoAprovacaoUpdateView(LoginRequiredMixin, UpdateView):
    template_name = 'descricao/descricao_form_aprovacao.html'
    model = Descricao
    form_class = DescricaoAprovacaoForm
    success_url = reverse_lazy("descricao:descricao-list-aprovacao")

    def get_initial(self, *args, **kwargs):
        initial = super(DescricaoAprovacaoUpdateView, self).get_initial(**kwargs)
        initial['status'] = 4
        return initial

    # pegar o tenant do usuario logado para filtrar a dropdonw
    def get_form_kwargs(self, *args, **kwargs):
        kwargs = super(DescricaoAprovacaoUpdateView, self).get_form_kwargs()
        tenant_id = tenant_from_request(self.request)
        user_id = user_from_request(self.request)
        kwargs['tenant_id'] = tenant_id
        kwargs['user_id'] = user_id
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
def query_documents_by_args(pk=1, **kwargs):
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

    queryset = Descricao.objects.all() #filter(tenant=1)

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


from django.core.mail import send_mail, BadHeaderError
from django.http import HttpResponse, HttpResponseRedirect


def envia_email(request, title, email):

    subject = 'Aprovação Pendente - BlueBox21' #request.POST.get('subject', '')
    message = 'Favor acessar o sistema Bluebox21 e aprovar o cargo pendente. (' + title + ')'
    from_email = 'pclinecomputadores@gmail.com' # request.POST.get('title', '')
    to_email = [email]

    if subject and message and from_email and to_email and to_email != None:
        try:
            send_mail(subject, message, from_email, to_email)
        except BadHeaderError:
            return HttpResponse('Dados do e-mail inválidos')
        return HttpResponseRedirect("/descricao/descricao_rel_list/") #HttpResponseRedirect('../descricao-rel-list')
    else:
        # In reality we'd use a form class
        # to get proper validation errors.
        return HttpResponse('Verifique os campos de envio.')