import tempfile
from datetime import datetime

from django.urls import reverse_lazy
from django.views.generic import DeleteView, CreateView, UpdateView
from django.views.generic.detail import DetailView
from django.views.generic.list import ListView
from django.contrib.auth.mixins import LoginRequiredMixin

from admin_descricao.models import Niveis
from admin_geral.models import Sector
from avaliacao.models import Avaliacao
from master.models import Diretoria, Area
from tenants.models import Tenant
from tenants.utils import tenant_from_request, user_from_request, userkind_from_request
from report.mixins import PdfResponseMixin
from user_account.models import CustomUser
from .forms import DescricaoForm, DescricaoModeloForm, DescricaoAprovadorForm, DescricaoAprovacaoForm, \
    DescricaoAprovacaoFinalForm, ImportarDadosForm
from .models import Descricao
from admin_avaliacao.models import Familias, SubFamilias
from admin_descricao.models import Descricoes

from django.db.models import Q

from django.http import FileResponse, Http404
from django.shortcuts import render, redirect, get_object_or_404
from . import models, forms
from descricao.enviaremail import enviodeemail

from io import BytesIO

import xlsxwriter

import requests
import json

from django.core.mail import BadHeaderError
from django.http import HttpResponse

import pandas as pd
from django.views import View

from django.core.management.color import no_style
from django.db import connection

from .tasks import processar_planilha_task
import os
# from django.http import JsonResponse
# from .models import ProgressoTarefa

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
        return super().get_queryset().filter(tenant_id=tenant_id, status__in=[4, 5]).all()


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
     'Gestao de Equipe', 'Cargos', 'Missao', 'Responsabilidades', 'Formacao_Desejada', 'Area_Formacao_Desejada',
     'Experiencia', 'Idioma', 'Proficiencia', 'Habilitacao', 'Conhecimento', 'Outros', 'Aprovador']])

    for descricao in descricoes:
        data += [[descricao.title, str(descricao.status) ,descricao.function, str(descricao.board) , str(descricao.area),
                  str(descricao.family), str(descricao.sub_familia), descricao.title_super , str(descricao.manage_team),
                  descricao.position_team, descricao.summary_goal, descricao.responsibility,
                  str(descricao.formation_desired), str(descricao.areas_desired), str(descricao.experience), str(descricao.idioma), str(descricao.proficiency),
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

        tenant_id = tenant_from_request(self.request)
        empresa = Tenant.objects.filter(id=tenant_id).first()
        sector_id = empresa.sector_id

        initial['sector'] = sector_id
        initial['status'] = 1
        return initial

    # Forçar o preenchimento do tenant_id com o tenant_id do usuario logado
    def form_valid(self, form):
        tenant_id = tenant_from_request(self.request)
        form.instance.tenant_id = tenant_id
        user_id = user_from_request(self.request)
        form.instance.user_id = user_id
        aprovado = self.request.POST.get('submit')
        form.instance.status_id = 1

        self.object = form.save()

        if aprovado == 'Finalizar':
            form.instance.status_id = 2

            cargo = form.instance.title
            titulo = ('Definir Aprovador - Bluebox21')
            message = 'Favor acessar o sistema Bluebox21 e definir o aprovador para o Cargo:  (' + cargo + ') Link: www.bluebox21.com.br'
            user = CustomUser.objects.filter(default_tenant_id=tenant_id, kind="Master").first()
            email = user.email

            envia_email(titulo, message, email)

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

        self.object = form.save()

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

        subject = 'Aprovacao Pendente - BlueBox21'  # request.POST.get('subject', '')
        message = 'Favor acessar o sistema Bluebox21 e aprovar o cargo pendente. (' + descricao.title + ') Link: www.bluebox21.com.br'
        to_email = descricao.approver.email

        envia_email(subject, message, to_email)

        return reverse_lazy("descricao:descricao-list-aprovador") #reverse_lazy("descricao:descricao-email", kwargs={'title': descricao.title, 'email': descricao.approver.email})
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

    # Forçar a data de aprovacao.
    def form_valid(self, form):
        form.instance.date_approval = datetime.now()

        self.object = form.save()

        return super(DescricaoAprovacaoUpdateView, self).form_valid(form)

    def get_success_url(self):
        descricao = self.get_object()


        titulo = ('Aprovado pelo Gestor - Bluebox21')
        message = 'O Cargo: (' + descricao.title + ')' + ' foi aprovado pelo gestor.'
        user_id = user_from_request(self.request)
        # user = CustomUser.objects.filter(id=user_id).first()
        email = descricao.user_id.email

        envia_email(titulo, message, email)

        return reverse_lazy("descricao:descricao-list-aprovacao")

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


    def get_success_url(self):
        descricao = self.get_object()


        titulo = ('Aprovado pelo Gestor Final - Bluebox21')
        message = 'O Cargo: (' + descricao.title + ')' + ' foi aprovado pelo gestor final.'
        user_id = user_from_request(self.request)
        # user = CustomUser.objects.filter(id=user_id).first()
        email = descricao.user_id.email


        envia_email(titulo, message, email)

        return reverse_lazy("descricao:descricao-list-aprovacao-final")


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



def envia_email_acompanhamento(request, title, email):


    titulo = ('Aprovacao Pendente - Bluebox21')
    message = 'Favor acessar o sistema Bluebox21 e aprovar o cargo pendente. (' + title + ') Link: www.bluebox21.com.br'

    retorno = envia_email(titulo, message, email)

    return HttpResponse(retorno)
    # return HttpResponseRedirect("/descricao/descricao_rel_list/")

def envia_email(titulo, message, email):

    if titulo and message and email != None:
        try:
            retorno = enviodeemail(titulo, message, email)
            return retorno

        except BadHeaderError:
            return 'Dados do e-mail inválidos'

    else:
        return 'Verifique os campos de envio.'

def envia_aprovacao(request, pk):
    aprovacao = get_object_or_404(models.Descricao, pk=pk)
    form = forms.DescricaoForm(request.POST or None, request.FILES or None, instance=aprovacao)


    # if form.is_valid():
    form_ = form.save(commit=False)
    form_.status_id = 2

    tenant_id = tenant_from_request(request)
    cargo = form_.title
    titulo = ('Definir Aprovador - Bluebox21')
    message = 'Favor acessar o sistema Bluebox21 e definir o aprovador para o Cargo:  (' + cargo + ')'
    user = CustomUser.objects.filter(default_tenant_id=tenant_id, kind="Master").first()
    email = user.email

    envia_email(titulo, message, email)

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

# Carregar as areas de acordo com os diretorias
def load_ia(request):

    title = request.GET.get('title')
    family_id = request.GET.get('family')
    sub_familia_id = request.GET.get('sub_familia')
    level_id = request.GET.get('level')
    sector_id = request.GET.get('sector')
    adicional = request.GET.get('adicional')

    # Buscar o name do respectivo id.
    familias = Familias.objects.filter(id=family_id).first()
    sub_familias = SubFamilias.objects.filter(id=sub_familia_id).first()
    level = Niveis.objects.filter(id=level_id).first()
    sector = Sector.objects.filter(id=sector_id).first()

    familias_name = familias.name
    sub_familias_name = sub_familias.name
    level_name = level.name
    sector_name = sector.name




    url = "https://neogem-bluebox-716723353548.us-east1.run.app/pesquisar_cargo_api"

    payload = json.dumps({
        "des_cargo": title,
        "familia": familias_name,
        "sub_familia": sub_familias_name,
        "setor": sector_name,
        "nivel": level_name,
        "adicional": adicional
    })

    headers = {
        'Content-Type': 'application/json'
    }

    # print(payload)

    response = requests.request("POST", url, headers=headers, data=payload)

    dadosjson = json.loads(response.text)

    missao = dadosjson.get('missao')

    responsabilidade = str(dadosjson.get('responsabilidades'))
    responsabilidades = responsabilidade.replace("[", "").replace("]","")

    competencia = str(dadosjson.get('competencias'))
    competencias = competencia.replace("[", "").replace("]", "").replace("'","")

    equipe = dadosjson.get('equipe')
    # gerencia = Gerencia.objects.filter(id=equipe).first()
    # equipe_name = gerencia.name

    escolaridade = dadosjson.get('escolaridade')
    # formacao = Formacao.objects.filter(id=escolaridade).first()
    # escolaridade_name = formacao.name

    complementar = dadosjson.get('formacao')
    # especializacao = Especializacoes.objects.filter(id=complementar).first()
    # complementar_name = especializacao.name

    experiencia = dadosjson.get('experiencia')
    # experiencias = Experiencias.objects.filter(id=experiencia).first()
    # experiencia_name = experiencias.name

    area_formacao = dadosjson.get('area')
    # areas = Areas.objects.filter(id=area_formacao).first()
    # area_formacao_name = areas.name

    habilitacao = dadosjson.get('habilidade')
    # habilitacoes = Habilitacoes.objects.filter(id=habilitacao).first()
    # habilitacao_name = habilitacoes.name

    # print(competencias)
    # print(complementar)
    # print(area_formacao)
    # print(experiencia)
    # print(escolaridade)
    # print(habilitacao)



    #Fixar para teste
    # missao = "Teste" #dadosjson.get('missao')
    # responsabilidades = "Teste" #dadosjson.get('responsabilidades')
    # competencias = "Teste" #dadosjson.get('competencias')
    # equipe = 1 #dadosjson.get('equipe')
    # escolaridade = 8 #dadosjson.get('escolaridade')
    # complementar = 1 #dadosjson.get('formacao')
    # experiencia = 2 #dadosjson.get('experiencia')
    # area_formacao = 15 #dadosjson.get('area')
    # habilitacao = 35 #dadosjson.get('habilidade')


    ia_list = []

    ia_list.append({'missao': missao,
                    'responsabilidades': responsabilidades,
                    'competencias': competencias,
                    'equipe': equipe,
                    'escolaridade': escolaridade,
                    'complementar': complementar,
                    'experiencia': experiencia,
                    'area_formacao': area_formacao,
                    'habilitacao': habilitacao,

                    })

    return render(request, 'descricao/ia_dropdown_list_options.html', {'ias': ia_list})



class ImportarDadosView(View):
    template_name = 'descricao/importar_dados.html'

    def get(self, request):
        descricoes = Descricao.objects.all()
        form = ImportarDadosForm()

        return render(request, self.template_name, {
            'form': form,
            'descricoes': descricoes
        })

    def post(self, request):
        form = ImportarDadosForm(request.POST, request.FILES)

        if form.is_valid():
            print('entrou no is_valid')
            arquivo = request.FILES['arquivo']
            df = pd.read_excel(arquivo)
            tenant_id = tenant_from_request(self.request)
            user_id = user_from_request(self.request)
            numrow = 1
            erro = 0
            msn = ''

            for _, row in df.iterrows():
                # Itera sobre as linhas do DataFrame lido do arquivo Excel
                # print(row)
                numrow += 1
                msn = self.validar_dados(row, tenant_id, numrow, msn, form)

            if msn != '':
                raise Http404(msn)
# Terminou a validação.        

            print('validou')
            # Pega os dados faltantes para importação da planilha
            last_desc = Descricao.objects.last()
            last_id = last_desc.id
            empresa = Tenant.objects.filter(id=tenant_id).first()
            sector_id = empresa.sector_id
            sector = Sector.objects.filter(id=sector_id).first()
            sector_name = sector.name


            # Começa a importação
            # Salva o arquivo temporariamente
            print('inicia salvou temporario')
            # temp_path = f'/tmp/{arquivo.name}'



            from openpyxl import load_workbook, Workbook
            temp_path = os.path.join('/tmp', arquivo.name)
            print(temp_path)

            # import os
            from django.core.files.storage import FileSystemStorage
            # from django.http import HttpResponse


            # Instancia o FileSystemStorage apontando para a pasta /tmp
            fs = FileSystemStorage(location='/tmp')

            # Salva o arquivo no diretório temporário
            nome_salvo = fs.save(arquivo.name, arquivo)
            print(nome_salvo)
            caminho_completo = fs.path(nome_salvo)
            print(caminho_completo)

            # Aqui você pode manipular o arquivo aberto em 'caminho_completo'
            # com bibliotecas como pandas ou openpyxl


            # temp_path = os.path.join('/tmp',arquivo.name)
            # with open(temp_path, 'wb+') as destination:
            #     for chunk in arquivo.chunks():
            #         destination.write(chunk)

            print('salvou temporario')
            user = user_id.id
            # Chama a tarefa em segundo plano
            processar_planilha_task(caminho_completo,last_id, sector_name, sector_id, tenant_id, user)

            print('processou')
            
            # for _, row in df.iterrows():
            #     # Itera sobre as linhas do DataFrame lido do arquivo Excel
            #     last_id += 1
            #     self.criar_descricao(row, last_id, sector_name, sector_id, tenant_id, user_id)

# Fim da importaçao                

            # Corrigir os index
            sequence_sql = connection.ops.sequence_reset_sql(no_style(), [Descricao])
            with connection.cursor() as cursor:
                for sql in sequence_sql:
                    cursor.execute(sql)


            # return redirect('/descricao/descricao_list')

        return render(request, self.template_name, {'form': form})

    def validar_dados(self, row, tenant_id, numrow, msn, form):
        id_diretoria = 0
        id_familia = 0
        # Trata a Area ou Diretoria que é o nome antigo.

        try:
            Descricao.objects.get(title=row['Titulodocargo'], tenant_id=tenant_id)
        except Descricao.DoesNotExist:
            msn = msn
        else:
            msn += 'Linha ' + str(numrow) + ' - O Título do Cargo "' + row['Titulodocargo'] + '" já existe!!\n'

        try:
            diretoria = Diretoria.objects.get(name=row['Area'], tenant_id=tenant_id)
        except Diretoria.DoesNotExist:
            msn += 'Linha ' + str(numrow) + ' - A área "' + row['Area'] + '" não existe!!\n'
        else:
            id_diretoria = diretoria.id

        # Trata a subarea ou area que é o nome antigo
        try:
            Area.objects.get(name=row['SubArea'], board_id = id_diretoria, tenant_id=tenant_id)
        except Area.DoesNotExist:
            msn += 'Linha ' + str(numrow) + ' - A Subárea "' + row['SubArea'] + '" não existe para a Diretoria "' + row['Area'] + '"!!\n'


        nome = row['Familia']
        nome = nome.replace("_", " ") # Foi necessario devido a regra de validação de dados do excell
        if Familias.objects.filter(name=nome).exists():
            familias = Familias.objects.filter(name=nome).first()
            id_familia = familias.id
        else:
            msn += 'Linha ' + str(numrow) + ' - A Familia "' + nome + '" não existe!!\n'

        # Trata e verifica se a  SubFamilia existe
        try:
            SubFamilias.objects.get(name=nome, family_id = id_familia)
        except SubFamilias.DoesNotExist:
            msn += 'Linha ' + str(numrow) + ' - A SubFamilia "' + row['SubFamilia'] + '" não existe para a Familia "' + \
                   row['Familia'] + '"!!\n'


        try:
            Niveis.objects.get(name=row['Nivel'])
            # subarea = Area.objects.get(name=row['SubArea'])
        except Niveis.DoesNotExist:
            msn += 'Linha ' + str(numrow) + ' - O Nivel "' + row['Nivel'] + '" não existe!!\n'


        return msn

        # finally:
        #     if erro ==1 :
        #         raise Http404(msn)


        # return HttpResponse("Nivel encontrado")
        # return render(request, "descricao/importar_dados.html", {'form': nivel})


        # print(row['Nivel'])
        # # Validar Nivel
        # nivel = Niveis.objects.filter(name=row['Nivel'])
        #
        # # if len(nivel) == 0:
        # return HttpResponseRedirect("<h1> Erro na validação </h1>")

    def criar_descricao(self, row, last_id, sector_name, sector_id, tenant_id, user_id):
        # Use get_or_create para evitar a necessidade de verificar a existência antes de criar

        diretoria = Diretoria.objects.get(name=row['Area'], tenant_id=tenant_id)
        id_diretoria = diretoria.id
        area = Area.objects.get(name=row['SubArea'], board_id=id_diretoria, tenant_id=tenant_id)
        id_area = area.id

        nome = row['Familia']
        nome = nome.replace("_", " ") # Foi necessario devido a regra de validação de dados do excell
        familia = Familias.objects.filter(name=nome).first()
        id_familia = familia.id
        familia_nome = familia.name
        subfamilia = SubFamilias.objects.filter(name=row['SubFamilia'], family_id=id_familia).first()
        id_subfamilia = subfamilia.id
        subfamilia_nome = subfamilia.name

        nivel = Niveis.objects.get(name=row['Nivel'])
        id_nivel = nivel.id
        nivel_nome = nivel.name

        #IA

        url = "https://neogem-bluebox-716723353548.us-east1.run.app/pesquisar_cargo_api"

        payload = json.dumps({
            "des_cargo": row['Titulodocargo'],
            "familia": familia_nome,
            "sub_familia": subfamilia_nome,
            "setor": sector_name,
            "nivel": nivel_nome,
            "adicional": row['Adicional']
        })
        headers = {
            'Content-Type': 'application/json'
        }

        response = requests.request("POST", url, headers=headers, data=payload)

        dadosjson = json.loads(response.text)

        missao = dadosjson.get('missao')

        responsabilidade = str(dadosjson.get('responsabilidades'))
        responsabilidades = responsabilidade.replace("[", "").replace("]", "")

        competencia = str(dadosjson.get('competencias'))
        competencias = competencia.replace("[", "").replace("]", "")

        equipe = str(dadosjson.get('equipe'))
        equipe = int(equipe.replace("{'codigo': ", "").replace("}", ""))

        if equipe is None:
            equipe = 1

        escolaridade = str(dadosjson.get('escolaridade'))
        escolaridade = int(escolaridade.replace("{'codigo': ", "").replace("}", ""))

        complementar = dadosjson.get('formacao')

        experiencia = str(dadosjson.get('experiencia'))
        experiencia = int(experiencia.replace("{'codigo': ", "").replace("}", ""))

        if experiencia is None:
            experiencia = 1

        area_formacao = 1 #str(dadosjson.get('area1'))
        # area_formacao = int(area_formacao.replace("{'codigo': ", "").replace("}", ""))

        habilitacao = str(dadosjson.get('habilidade'))
        habilitacao = int(habilitacao.replace("{'codigo': ", "").replace("}", ""))

        #Fim da IA -------------------------------


        created = Descricao(
                id = last_id,
                title = row['Titulodocargo'],
                area_id = id_area,
                board_id = id_diretoria,
                title_super = row['CargoSuperiorImediato'],
                family_id = id_familia,
                sub_familia_id = id_subfamilia,
                adicional = row['Adicional'],
                tenant_id = tenant_id,
                status_id = 1,
                is_active = True,
                sector_id = sector_id,
                level_id = id_nivel,
                user_id = user_id,

                summary_goal = missao, #dadosjson.get(missao),
                responsibility = responsabilidades,  #dadosjson.get(responsabilidades),
                information = competencias, #dadosjson.get(competencias)
                manage_team_id = equipe, #dadosjson.get(equipe)
                formation_desired_id = escolaridade, #dadosjson.get(escolaridade)
                specialization_id = complementar, #dadosjson.get(formacao)
                experience_id = experiencia, #dadosjson.get(experiencia)
                areas_desired_id = area_formacao, #dadosjson.get(area)
                qualification_id = habilitacao #dadosjson.get(habilidade)
                )

        created.save(force_insert=True)

def plano_contratado(request):
    # print("entrou")
    # tenant_id = tenant_from_request(request)
    # empresa = Tenant.objects.filter(id=tenant_id).first()
    # plano_id = empresa.plano_id
    # planos = Plans.objects.filter(id=1).first()
    # print(planos)
    # # Conta os itens atuais
    # contagem_atual = Descricao.objects.filter(tenant_id=tenant_id).count()
    # print(contagem_atual)
    # print(plano.value)
    #
    # # limite = "Seu plano({plano.name}) limita a {plano.value} Descrições."
    # if contagem_atual >= plano.value:
    #     return HttpResponse("Seu plano({plano.name}) limita a {plano.value} Descrições.")
    return render(request, 'descricao/plano_contratado.html', {'planos': planos})




# def verificar_progresso(request, tarefa_id):
#     try:
#         tarefa = ProgressoTarefa.objects.get(tarefa_id=tarefa_id)
#         return JsonResponse({'progresso': tarefa.progresso, 'status': tarefa.status})
#     except ProgressoTarefa.DoesNotExist:
#         return JsonResponse({'progresso': 0, 'status': 'Aguardando início...'})


# def verificar_progresso(request, task_id):
#     try:
#         print('Entrou para verificar progresso')
#         progress = ProgressoTarefa.objects.get(task_id=task_id)
#         print('vai retornar progresso')
#         return JsonResponse({'percentage': progress.progresso, 'status': progress.status})
#     except ProgressoTarefa.DoesNotExist:
#         return JsonResponse({'percentage': 0, 'status': 'Pending'})