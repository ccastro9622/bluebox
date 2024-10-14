import csv

from django.urls import reverse_lazy
from django.views.generic import DeleteView, CreateView, UpdateView
from django.views.generic.detail import DetailView
from django.views.generic.list import ListView
from django.contrib.auth.mixins import LoginRequiredMixin

from avaliacao.models import Avaliacao
from tenants.utils import tenant_from_request, user_from_request, userkind_from_request
from report.mixins import PdfResponseMixin
from .forms import DescricaoForm, DescricaoModeloForm, DescricaoAprovadorForm, DescricaoAprovacaoForm, \
    DescricaoAprovacaoFinalForm
from .models import Descricao, Area, SubFamilias
from admin_descricao.models import Descricoes

from rest_framework import viewsets, status
from rest_framework.response import Response
from django.db.models import Q
from django.shortcuts import render
from api.serializers import DocumentSerializer

from django.http import FileResponse
from django.shortcuts import render, redirect, get_object_or_404
from . import models, forms

import os

from io import BytesIO

import xlsxwriter

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
        user_id = user_from_request(self.request)
        user_kind = userkind_from_request(self.request)
        if user_kind == "Master":
            return super().get_queryset().filter(tenant_id=tenant_id).all()
        else:
            return super().get_queryset().filter(tenant_id=tenant_id, user_id_id=user_id).all()


class DescricaoAprovadorListView(LoginRequiredMixin, ListView):
    template_name = 'descricao/descricao_list_aprovador.html'
    model = Descricao
    context_object_name = "descricao"

    def get_queryset(self):
        tenant_id = tenant_from_request(self.request)
        return super().get_queryset().filter(tenant_id=tenant_id, status__in=[2, 3]).all()


class DescricaoAprovacaoListView(LoginRequiredMixin, ListView):
    template_name = 'descricao/descricao_list_aprovacao.html'
    model = Descricao
    context_object_name = "descricao"

    def get_queryset(self):
        tenant_id = tenant_from_request(self.request)
        user_id = user_from_request(self.request)
        return super().get_queryset().filter(tenant_id=tenant_id, status=3, approver_id=user_id).all()


class DescricaoAprovacaoFinalListView(LoginRequiredMixin, ListView):
    template_name = 'descricao/descricao_list_aprovacao_final.html'
    model = Descricao
    context_object_name = "descricao"

    def get_queryset(self):
        tenant_id = tenant_from_request(self.request)
        return super().get_queryset().filter(tenant_id=tenant_id, status=4).all()


# usado na avaliacao para buscar um modelo.
class DescricaomodeloListView(LoginRequiredMixin, ListView):
    template_name = 'descricao/descricaomodelo_list.html'
    model = Descricao
    context_object_name = "descricao"


    def get_queryset(self):
        tenant_id = tenant_from_request(self.request)
        avaliacao = Avaliacao.objects.filter(tenant_id=tenant_id, description__isnull=False).all()
        lista = []
        if avaliacao:
            for lavaliacao in avaliacao:
                lista.append(lavaliacao.description)
        else:
            lista = {0}

        return super().get_queryset().filter(tenant_id=tenant_id, status=5).exclude(id__in=lista)



# projects = Project.objects.filter(projectscores__profile=profile)
# score_list = [
#   {'name': a_project.project_name,
#    'scores': ProjectScores.objects.filter(project=a_project, profile=profile).values_list('score', flat=True)
#   }
#   for a_project in projects
# ]

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


def export_users_csv(request):
    # create our spreadsheet.  I will create it in memory with a StringIO

    output = BytesIO()
    workbook = xlsxwriter.Workbook(output)
    worksheet = workbook.add_worksheet("Planilha")

    tenant_id = tenant_from_request(request)
    descricoes = Descricao.objects.filter(tenant_id=tenant_id).order_by('title')

    format = workbook.add_format()

    format.set_pattern(1)
    format.set_bg_color('Blue')
    format.set_font_color('white')
    format.set_bold()
    format.set_border()

    data = ([['Titulo', 'Status', 'Função',  'Area', 'SubArea', 'Familia', 'Subfamilia', 'Cargo Superior',
     'Gestao de Equipe', 'Cargos', 'Missao', 'Responsabilidades', 'Formacao_Desejada',
     'Experiencia', 'Idioma', 'Proficiencia', 'Habilitacao', 'Conhecimento', 'Outros', 'Aprovador']])

    for descricao in descricoes:
        data += [[descricao.title, str(descricao.status) ,descricao.function, str(descricao.board) , str(descricao.area),
                  str(descricao.family), str(descricao.sub_familia), descricao.title_super , str(descricao.manage_team),
                  descricao.position_team, descricao.summary_goal, descricao.responsibility,
                  str(descricao.formation_desired), str(descricao.experience), str(descricao.idioma), str(descricao.proficiency),
                  str(descricao.qualification), descricao.knowledge, descricao.information, str(descricao.approver)]]

    for row_num , columns in enumerate(data):
        for col_num, cell_data in enumerate(columns):
            if row_num == 1:
                format = workbook.add_format()
                format.set_pattern(1)
                format.set_bg_color('white')
                format.set_font_color('black')
                format.set_bold(False)
                format.set_border()

            worksheet.write(row_num, col_num, cell_data, format)


    workbook.close()

    output.seek(0)

    # create a response
    response = HttpResponse(output, content_type='application/vnd.ms-excel')

    # tell the browser what the file is named
    response['Content-Disposition'] = 'attachment;filename="Descricoes.xlsx"'

    return response



# # Chamado no batao de gerar excel do relatorio de acompanhamento
# def export_users_csv(request):
#     response = HttpResponse(content_type='text/csv')
#     response['Content-Disposition'] = 'attachment; filename="descricoes.csv"'
#
#     writer = csv.writer(response)
#     # writer.writerow(['Titulo', 'Status', 'Usuário', 'Aprovador', 'Data'])
#
#     writer.writerow(['title', 'cbo', 'function',  'summary_goal', 'responsibility', 'formation', 'areas',
#      'formation_desired', 'areas_desired', 'specialization', 'area_specialization', 'experience',
#      'qualification', 'board', 'area', 'title_super', 'family', 'sub_familia', 'manage_team',
#      'position_team', 'idioma', 'proficiency', 'knowledge', 'information',
#      'approver', 'date_approval', 'status', 'date_conclusion'])
#
#     tenant_id = tenant_from_request(request)
#     descricoes = Descricao.objects.filter(tenant_id=tenant_id).all()
#
#
#     # Descricoes = Descricao.objects.filter(tenant_id=tenant_id).all().values_list('username', 'first_name', 'last_name', 'email')
#     # Descricao.objects.filter
#
#     # users = User.objects.all().values_list('username', 'first_name', 'last_name', 'email')
#
#     # for descricao in descricoes:
#     writer.writerows((descricao.title, descricao.cbo, descricao.function, descricao.summary_goal,
#                       descricao.responsibility , descricao.formation , descricao.areas ,
#                       descricao.qualification , descricao.board , descricao.area , descricao.title_super ,
#                       descricao.family , descricao.sub_familia , descricao.manage_team , descricao.position_team, descricao.idioma,
#                       descricao.proficiency, descricao.knowledge, descricao.information, descricao.approver, descricao.date_approval,
#                       descricao.status, descricao.date_conclusion) for descricao in descricoes)
#
#     return response


class DescricaoDeleteView(LoginRequiredMixin, DeleteView):
    model = Descricao
    context_object_name = "descricao"
    success_url = reverse_lazy("descricao:descricao-list")


class DescricaoCreateView(LoginRequiredMixin, CreateView):
    model = Descricao
    form_class = DescricaoForm
    success_url = reverse_lazy("descricao:descricao-list")

    # Do something else

    def get_initial(self, *args, **kwargs):
        initial = super(DescricaoCreateView, self).get_initial(**kwargs)
        initial['status'] = 1
        # initial['id'] = 50
        return initial

    # Forçar o preenchimento do tenant_id com o tenant_id do usuario logado
    def form_valid(self, form):
        tenant_id = tenant_from_request(self.request)
        form.instance.tenant_id = tenant_id
        user_id = user_from_request(self.request)
        form.instance.user_id = user_id
        aprovado = self.request.POST.get('submit')
        if aprovado == 'Aprovar':
            form.instance.status_id = 2

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
            initial['family'] = descricao_admin.family
            initial['sub_familia'] = descricao_admin.sub_familia
            initial['manage_team'] = descricao_admin.manage_team
            initial['summary_goal'] = descricao_admin.summary_goal
            initial['responsibility'] = descricao_admin.responsibility
            initial['formation'] = descricao_admin.formation
            initial['areas'] = descricao_admin.areas
            initial['areas2'] = descricao_admin.areas2
            initial['areas3'] = descricao_admin.areas3
            initial['areas4'] = descricao_admin.areas4
            initial['formation_desired'] = descricao_admin.formation_desired
            initial['areas_desired'] = descricao_admin.areas_desired
            initial['areas_desired2'] = descricao_admin.areas_desired2
            initial['areas_desired3'] = descricao_admin.areas_desired3
            initial['areas_desired4'] = descricao_admin.areas_desired4
            initial['specialization'] = descricao_admin.specialization
            initial['area_specialization'] = descricao_admin.area_specialization
            initial['area_specialization2'] = descricao_admin.area_specialization2
            initial['area_specialization3'] = descricao_admin.area_specialization3
            initial['area_specialization4'] = descricao_admin.area_specialization4
            initial['experience'] = descricao_admin.experience
            initial['qualification'] = descricao_admin.qualification
            initial['qualification2'] = descricao_admin.qualification2
            initial['qualification3'] = descricao_admin.qualification3
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

    # corrigir o problema de e-mail para descompentar
    def get_success_url(self):
        descricao = self.get_object()
        return reverse_lazy("descricao:descricao-email", kwargs={'title': descricao.title, 'email': descricao.approver.email})
# reverse_lazy("descricao:descricao-list-aprovador")


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


class DescricaoAprovacaoFinalUpdateView(LoginRequiredMixin, UpdateView):
    template_name = 'descricao/descricao_form_aprovacao_final.html'
    model = Descricao
    form_class = DescricaoAprovacaoFinalForm
    success_url = reverse_lazy("descricao:descricao-list-aprovacao-final")

    def get_initial(self, *args, **kwargs):
        initial = super(DescricaoAprovacaoFinalUpdateView, self).get_initial(**kwargs)
        initial['status'] = 5
        return initial

    # pegar o tenant do usuario logado para filtrar a dropdonw
    def get_form_kwargs(self, *args, **kwargs):
        kwargs = super(DescricaoAprovacaoFinalUpdateView, self).get_form_kwargs()
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
    message = 'Favor acessar o sistema Bluebox21 e aprovar o cargo pendente. (' + title + ') - https://bluebox21.herokuapp.com/'
    from_email = 'envioautomatico@bluebox21.com ' # request.POST.get('title', '')
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


def envia_aprovacao(request, pk):
    aprovacao = get_object_or_404(models.Descricao, pk=pk)
    form = forms.DescricaoForm(request.POST or None, request.FILES or None, instance=aprovacao)

    # if form.is_valid():
    form_ = form.save(commit=False)
    form_.status_id = 2
    form_.save()

    return redirect("/descricao/descricao_list")

    # return render(request, 'descricao//descricao_list.html', {'form': form})


def envia_reprovacao(request, pk):
    reprovacao = get_object_or_404(models.Descricao, pk=pk)
    form = forms.DescricaoForm(request.POST or None, request.FILES or None, instance=reprovacao)

    # if form.is_valid():
    form_ = form.save(commit=False)
    form_.status_id = 4
    form_.save()

    return redirect("/descricao/descricao_list_aprovacao/")

    # return render(request, 'descricao//descricao_list.html', {'form': form})