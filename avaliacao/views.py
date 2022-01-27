import csv
import os

from django.http import FileResponse, HttpResponse
from django.urls import reverse_lazy
from django.views.generic import DeleteView, CreateView, UpdateView
from django.views.generic.detail import DetailView
from django.views.generic.list import ListView
from django.contrib.auth.mixins import LoginRequiredMixin

from admin_avaliacao.models import Niveis
from descricao.models import Descricao
from master.models import Diretoria
from report.mixins import PdfResponseMixin
from tenants.utils import tenant_from_request, user_from_request

from .models import Avaliacao, Area, SubFamilias
from .forms import AvaliacaoForm, AvaliacaoModeloForm
from tenants.models import Tenant

from django.shortcuts import render


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
    form_class = AvaliacaoForm
    success_url = reverse_lazy("avaliacao:avaliacao-list")

    def get_initial(self, *args, **kwargs):
        initial = super(AvaliacaoCreateView, self).get_initial(**kwargs)
        initial['ceo'] = 'Desconhecido'
        tenant_id = tenant_from_request(self.request)
        empresa = Tenant.objects.filter(id=tenant_id).first()
        if empresa:
            initial['origin'] = empresa.origin
            initial['governanca'] = empresa.governanca
            initial['company'] = empresa.company
            initial['size'] = empresa.size
        # return initial

        # avaliacao = Avaliacao.objects.filter(tenant_id=tenant_id).first()
        # if avaliacao:
        #     initial['title_super'] = avaliacao.title
        # return initial

    # Forçar o preenchimento do tenant_id com o tenant_id do usuario logado
    def form_valid(self, form):
        tenant_id = tenant_from_request(self.request)
        form.instance.tenant_id = tenant_id
        user_id = user_from_request(self.request)
        form.instance.user_id = user_id
        return super(AvaliacaoCreateView, self).form_valid(form)

    # pegar o tenant do usuario logado para filtrar a dropdonw
    def get_form_kwargs(self, *args, **kwargs):
        kwargs = super(AvaliacaoCreateView, self).get_form_kwargs()
        tenant_id = tenant_from_request(self.request)
        kwargs['tenant_id'] = tenant_id
        return kwargs


class AvaliacaoModeloCreateView(LoginRequiredMixin, CreateView):
    model = Avaliacao
    form_class = AvaliacaoModeloForm
    success_url = reverse_lazy("avaliacao:avaliacao-list")

    def get_initial(self, *args, **kwargs):
        initial = super(AvaliacaoModeloCreateView, self).get_initial(**kwargs)
        initial['ceo'] = 'Desconhecido'
        tenant_id = tenant_from_request(self.request)
        empresa = Tenant.objects.filter(id=tenant_id).first()
        if empresa:
            initial['origin'] = empresa.origin
            initial['governanca'] = empresa.governanca
            initial['company'] = empresa.company
            initial['size'] = empresa.size

        descricao = Descricao.objects.filter(id=self.kwargs.get("pk")).first()
        if descricao:
            initial['title'] = descricao.title
            initial['board'] = descricao.board
            initial['area'] = descricao.area
            initial['family'] = descricao.family
            initial['sub_familia'] = descricao.sub_familia
            initial['formation'] = descricao.formation
            initial['manage_team'] = descricao.manage_team
        return initial

    # Forçar o preenchimento do tenant_id com o tenant_id do usuario logado
    def form_valid(self, form):
        tenant_id = tenant_from_request(self.request)
        form.instance.tenant_id = tenant_id
        user_id = user_from_request(self.request)
        form.instance.user_id = user_id
        return super(AvaliacaoModeloCreateView, self).form_valid(form)

    # pegar o tenant do usuario logado para filtrar a dropdonw
    def get_form_kwargs(self, *args, **kwargs):
        kwargs = super(AvaliacaoModeloCreateView, self).get_form_kwargs()
        tenant_id = tenant_from_request(self.request)
        kwargs['tenant_id'] = tenant_id
        return kwargs


class AvaliacaoUpdateView(LoginRequiredMixin, UpdateView):
    model = Avaliacao
    form_class = AvaliacaoForm
    success_url = reverse_lazy("avaliacao:avaliacao-list")

    # pegar o tenant do usuario logado para filtrar a dropdonw
    def get_form_kwargs(self, *args, **kwargs):
        kwargs = super(AvaliacaoUpdateView, self).get_form_kwargs()
        tenant_id = tenant_from_request(self.request)
        kwargs['tenant_id'] = tenant_id
        return kwargs


class AvaliacaoRelListView(LoginRequiredMixin, ListView):
    template_name = 'avaliacao/avaliacao_rel_list.html'
    model = Avaliacao
    context_object_name = "avaliacao"

    def get_queryset(self):
        tenant_id = tenant_from_request(self.request)
        return super().get_queryset().filter(tenant_id=tenant_id).all()


class AvaliacaoRelMatrizListView(LoginRequiredMixin, ListView):
    template_name = 'avaliacao/avaliacao_rel_list_matriz.html'
    model = Avaliacao
    context_object_name = "avaliacoes"

    def get_queryset(self):
        tenant_id = tenant_from_request(self.request)
        return super().get_queryset().filter(tenant_id=tenant_id).all()

    def get_context_data(self, **kwargs):
        context = super(AvaliacaoRelMatrizListView, self).get_context_data(**kwargs)
        tenant_id = tenant_from_request(self.request)
        context['diretorias'] = Diretoria.objects.filter(tenant_id=tenant_id)
        return context


class AvaliacaoRelHierarquicaListView(LoginRequiredMixin, ListView):
    template_name = 'avaliacao/avaliacao_rel_list_hierarquica.html'
    model = Avaliacao
    context_object_name = "avaliacoes"

    def get_queryset(self):
        tenant_id = tenant_from_request(self.request)
        return super().get_queryset().filter(tenant_id=tenant_id).all()


def mostra_pdf(request):
    filepath = os.path.join('static', '/home/cristiano/bluebox/staticfiles/pdf/manual_avaliacao.pdf')
    return FileResponse(open(filepath, 'rb'), content_type='application/pdf')


# Chamado no batao de gerar pdf do relatorio de acompanhamento
class AvaliacaoPdfListView(PdfResponseMixin, ListView):
    template_name = 'avaliacao/avaliacao_pdf_list.html'
    model = Avaliacao
    context_object_name = "avaliacao"

    def get_queryset(self):
        tenant_id = tenant_from_request(self.request)
        return self.model.objects.filter(tenant_id=tenant_id).all()


# Chamado no batao de gerar excel do relatorio de acompanhamento
def export_users_csv(request):
    response = HttpResponse(content_type='text/csv')
    response['Content-Disposition'] = 'attachment; filename="avaliacoes.csv"'

    writer = csv.writer(response)
    writer.writerow(['Cargo', 'Diretoria', 'Area', 'Grade', 'Formação', 'Nivel', 'Escopo','Abrangência',
                     'Contribuição','Gestão','Liderança','Comunicação'])

    avaliacoes = Avaliacao.objects.all()

    writer.writerows((avaliacao.title, avaliacao.board, avaliacao.area, avaliacao.grade, avaliacao.level1,
                      avaliacao.level2, avaliacao.level3, avaliacao.level4, avaliacao.level5,
                      avaliacao.level6, avaliacao.level7, avaliacao.level8
                      ) for avaliacao in avaliacoes)

    return response

# Chamado no batao de gerar excel do relatorio de acompanhamento
def export_matriz_csv(request):
    response = HttpResponse(content_type='text/csv')
    response['Content-Disposition'] = 'attachment; filename="avaliacoes_matriz.csv"'

    writer = csv.writer(response)
    writer.writerow(['Grade', 'Cargo', 'Diretoria', 'Area', ])

    avaliacoes = Avaliacao.objects.all()

    writer.writerows((avaliacao.grade, avaliacao.title, avaliacao.board, avaliacao.area
                      ) for avaliacao in avaliacoes)

    return response


# Carregar as areas de acordo com os diretorias
def load_areas(request):
    board_id = request.GET.get('board')
    areas = Area.objects.filter(board_id=board_id).order_by('name')
    return render(request, 'avaliacao/area_dropdown_list_options.html', {'areas': areas})


# Carregar as areas de acordo com os diretorias
def load_sub_familias(request):
    family_id = request.GET.get('family')
    sub_familias = SubFamilias.objects.filter(family_id=family_id).order_by('name')
    return render(request, 'avaliacao/sub_familia_dropdown_list_options.html', {'sub_familias': sub_familias})


# Carregar as nivel 1 formação de acordo com a formação do cargo
def load_levels1(request):
    formation_id = request.GET.get('formation')
    levels = Niveis.objects.filter(factor_id=1, code=formation_id).order_by('name')
    return render(request, 'avaliacao/level1_dropdown_list_options.html', {'levels': levels})


# Carregar as nivel 2 Nivel Organizacional de acordo com a formação do cargo
def load_levels2(request):
    formation_id = request.GET.get('formation')
    if formation_id != '11':
        levels = Niveis.objects.filter(factor_id=2, code__in=[1, 2]).order_by('id')
    else:
        levels = Niveis.objects.filter(factor_id=2, code__in=[2, 3, 4]).order_by('id')

    return render(request, 'avaliacao/level1_dropdown_list_options.html', {'levels': levels})


# Carregar o nivel 3 Escopo com o nivel2 Nivel organizacional
def load_levels3(request):
    level2_id = request.GET.get('level2')
    if level2_id == '12':
        levels = Niveis.objects.filter(factor_id=3, code__in=[1, 2, 3, 4]).order_by('id')
    elif level2_id == '13':
        levels = Niveis.objects.filter(factor_id=3, code__in=[4, 5, 6]).order_by('id')
    elif level2_id == '14':
        levels = Niveis.objects.filter(factor_id=3, code__in=[7, 8]).order_by('id')
    elif level2_id == '15':
        levels = Niveis.objects.filter(factor_id=3, code__in=[9, 10, 11, 12]).order_by('id')

    return render(request, 'avaliacao/level1_dropdown_list_options.html', {'levels': levels})


# Carregar as nivel 4 Gestão Recebida de acordo com 1 executivo
def load_levels4(request):
    ceo_id = request.GET.get('ceo')
    if ceo_id == 'true':
        levels = Niveis.objects.filter(factor_id=4, code__in=[7,8]).order_by('id')
    elif ceo_id == 'false':
        levels = Niveis.objects.filter(factor_id=4, code__in=[1,2,3,4,5,6]).order_by('id')
    else:
        levels = Niveis.objects.filter(factor_id=4).order_by('id')

    return render(request, 'avaliacao/level1_dropdown_list_options.html', {'levels': levels})


# Carregar as nivel 5 liderança de acordo com 1 executivo
def load_levels5(request):
    ceo_id = request.GET.get('ceo')
    if ceo_id == 'true':
        levels = Niveis.objects.filter(factor_id=5, code=6).order_by('id')
    elif ceo_id == 'false':
        levels = Niveis.objects.filter(factor_id=5, code__in=[1,2,3,4,5]).order_by('id')
    else:
        levels = Niveis.objects.filter(factor_id=5).order_by('id')

    return render(request, 'avaliacao/level1_dropdown_list_options.html', {'levels': levels})


# Carregar as nivel 6 Gestao Recebida de acordo com o nivel3
def load_levels6(request):
    # level3_id = request.GET.get('level3')
    levels = Niveis.objects.filter(factor_id=6).order_by('id')
    # if '16' <= level3_id <= '23':
    #     levels = Niveis.objects.filter(factor_id=6, code__in=[1, 2, 3]).order_by('id')
    # elif '24' <= level3_id <= '25':
    #     levels = Niveis.objects.filter(factor_id=6, code__in=[4]).order_by('id')
    # elif level3_id == '26':
    #     levels = Niveis.objects.filter(factor_id=6, code__in=[5]).order_by('id')
    # elif level3_id == '27':
    #     levels = Niveis.objects.filter(factor_id=6, code__in=[6]).order_by('id')

    return render(request, 'avaliacao/level1_dropdown_list_options.html', {'levels': levels})


# Carregar as nivel 7 Liderança  de acordo com a gerencia
def load_levels7(request):
    manage_team_id = request.GET.get('manage_team')
    if manage_team_id == '1':
        levels = Niveis.objects.filter(factor_id=7, code=1).order_by('id')
    elif manage_team_id == '2':
        levels = Niveis.objects.filter(factor_id=7, code__in=[2,3,4]).order_by('id')

    return render(request, 'avaliacao/level1_dropdown_list_options.html', {'levels': levels})


# Carregar as nivel 8 - Comunicação  de acordo com a gerencia
def load_levels8(request):
    manage_team_id = request.GET.get('manage_team')
    if manage_team_id == '1':
        levels = Niveis.objects.filter(factor_id=8, code__in=[1, 2, 3]).order_by('id')
    elif manage_team_id == '2':
        levels = Niveis.objects.filter(factor_id=8, code=3).order_by('id')

    return render(request, 'avaliacao/level1_dropdown_list_options.html', {'levels': levels})



