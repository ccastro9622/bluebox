import csv
import os

from django.db.models import ProtectedError
from django.http import FileResponse, HttpResponse, HttpResponseRedirect
from django.urls import reverse_lazy
from django.views.generic import DeleteView, CreateView, UpdateView
from django.views.generic.detail import DetailView
from django.views.generic.list import ListView
from django.contrib.auth.mixins import LoginRequiredMixin

from admin_avaliacao.models import Niveis, Combinacoes
from descricao.models import Descricao
from master.models import Diretoria
from report.mixins import PdfResponseMixin
from tenants.utils import tenant_from_request, user_from_request

from .models import Avaliacao, Area, SubFamilias, Superior
from .forms import AvaliacaoForm, AvaliacaoModeloForm
from tenants.models import Tenant

from django.shortcuts import render, redirect

from django.db.models.deletion import ProtectedError
import json


from django.contrib import messages


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

    def delete(self, request, *args, **kwargs):

        self.object = self.get_object()
        success_url = self.get_success_url()

        idsuper=self.object.id

        # try:
        #     self.object.delete()
        #     data = {'success': 'ok'}
        # except ProtectedError:
        #     data = {'success': 'violation_protected'}
        #
        # return HttpResponse(json.dumps(data), mimetype="application/json")

        # Deleta da tabela de superior imediato
        super = Superior.objects.filter(evaluation_id=idsuper)
        super.delete()

        self.object.delete()

        # try:
        #     messages.add_message(request, messages.ERROR, 'Can not delete: this parent has a child!')
        #     return redirect('master:diretoria-list') # The url of the delete view (or whatever you want)

        return HttpResponseRedirect(success_url)

    # def delete(self, request, *args, **kwargs):
    #     self.object = self.get_object()
    #     try:
    #         self.object.delete()
    #         data = {'success': 'ok'}
    #     except ProtectedError:
    #         data = {'success': 'violation_protected'}
    #     return HttpResponse(json.dumps(data), mimetype="application/json")

#
# class DiretoriaDeleteView(LoginRequiredMixin, DeleteView):
#     model = Diretoria
#     context_object_name = "diretoria"
#     success_url = reverse_lazy("master:diretoria-list")
#
#     def delete(self, request, *args, **kwargs):
#
#         """
#         Call the delete() method on the fetched object and then redirect to the
#         success URL. If the object is protected, send an error message.
#         """
#         self.object = self.get_object()
#
#         try:
#             self.object.delete()
#         except ProtectedError:
#             messages.add_message(request, messages.ERROR, 'Can not delete: this parent has a child!')
#             return redirect('master:diretoria-list') # The url of the delete view (or whatever you want)
#
#         return HttpResponseRedirect(reverse_lazy("master:diretoria-list"))
#
#
# def delete_product(request, pk, group):
#     from django.db.models import ProtectedError
#     product = get_object_or_404(Product, pk=pk)
#
#     if request.method == 'POST':
#         try:
#             product.delete()
#             Inventory.objects.filter(product=product).delete()
#             messages.success(request, _("Product deleted"))
#         except ProtectedError:
#             messages.error(request, _('Cannot delete product'))
#
#         return redirect(list_products, group)
#
#     action = request.path
#     return render(request, 'products/remove.html', locals())


class AvaliacaoCreateView(LoginRequiredMixin, CreateView):
    model = Avaliacao
    form_class = AvaliacaoForm
    success_url = reverse_lazy("avaliacao:avaliacao-list")

    def get_initial(self, *args, **kwargs):
        initial = super(AvaliacaoCreateView, self).get_initial(**kwargs)
        tenant_id = tenant_from_request(self.request)

        empresa = Tenant.objects.filter(id=tenant_id).first()
        if empresa:
            initial['origin'] = empresa.origin
            initial['governanca'] = empresa.governanca
            initial['company'] = empresa.company
            initial['size'] = empresa.size_id

        # avaliacao = Avaliacao.objects.filter(tenant_id=tenant_id, ceo=True).first()
        # if avaliacao:
        #     initial['ceo'] = False
        # else:
        #     initial['ceo'] = True

        return initial

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
        avaliacao = Avaliacao.objects.filter(tenant_id=tenant_id, ceo=True).first()
        if avaliacao:
            form.instance.ceo = False
        else:
            form.instance.ceo = True

        form.save()
        # Insere na tabela superiror imediado a avaliação cadastrada.
        Superior.objects.create(title=form.instance.title, tenant_id=tenant_id, evaluation_id=form.instance.id)

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

        # avaliacao = Avaliacao.objects.filter(tenant_id=tenant_id, ceo=True).first()
        # if avaliacao:
        #     initial['ceo'] = False
        # else:
        #     initial['ceo'] = True

        return initial

    # Forçar o preenchimento do tenant_id com o tenant_id do usuario logado
    def form_valid(self, form):
        tenant_id = tenant_from_request(self.request)
        form.instance.tenant_id = tenant_id
        user_id = user_from_request(self.request)
        form.instance.user_id = user_id
        avaliacao = Avaliacao.objects.filter(tenant_id=tenant_id, ceo=True).first()
        if avaliacao:
            form.instance.ceo = False
        else:
            form.instance.ceo = True

        form.save()
        # Insere na tabela superiror imediado a avaliação cadastrada.
        Superior.objects.create(title=form.instance.title, tenant_id=tenant_id, evaluation_id=form.instance.id)

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


# Carregar as sub familias de acordo com as familias
def load_sub_familias(request):
    family_id = request.GET.get('family')
    sub_familias = SubFamilias.objects.filter(family_id=family_id).order_by('name')
    return render(request, 'avaliacao/sub_familia_dropdown_list_options.html', {'sub_familias': sub_familias})


# Carregar as nivel 1 Conhecimento de acordo com 1 Executivo
def load1_levels1(request):
    ceo_id = request.GET.get('ceo')
    size_id = request.GET.get('size')

    if ceo_id == '0': #não é CEO
        levels = Niveis.objects.filter(factor_id=1).order_by('id')
    elif size_id == '1':
        levels = Niveis.objects.filter(factor_id=1, code__in=[1]).order_by('id')
    elif size_id == '2':
        levels = Niveis.objects.filter(factor_id=1, code__in=[2]).order_by('id')
    else:
        levels = Niveis.objects.filter(factor_id=1, code__in=[4]).order_by('id')

    return render(request, 'avaliacao/level1_dropdown_list_options.html', {'levels': levels})


# Carregar as nivel 2 Nivel Organizacional de acordo com 1 Executivo
def load1_levels2(request):
    ceo_id = request.GET.get('ceo')

    if ceo_id == '1':
        levels = Niveis.objects.filter(factor_id=2, code__in=[4]).order_by('id')
    elif ceo_id == '0':
        levels = Niveis.objects.filter(factor_id=2).order_by('id')

    return render(request, 'avaliacao/level1_dropdown_list_options.html', {'levels': levels})


# Carregar o nivel 3 Escopo de acordo com 1 Executivo
def load1_levels3(request):
    ceo_id = request.GET.get('ceo')

    if ceo_id == '1':
        levels = Niveis.objects.filter(factor_id=3, code__in=[11, 12]).order_by('id')
    elif ceo_id == '0':
        levels = Niveis.objects.filter(factor_id=3).order_by('id')

    return render(request, 'avaliacao/level1_dropdown_list_options.html', {'levels': levels})


# Carregar o nivel 5 Contribuição de acordo com 1 Executivo
def load1_levels5(request):
    ceo_id = request.GET.get('ceo')

    if ceo_id == '1':
        levels = Niveis.objects.filter(factor_id=5, code__in=[6]).order_by('id')
    elif ceo_id == '0':
        levels = Niveis.objects.filter(factor_id=5).order_by('id')

    return render(request, 'avaliacao/level1_dropdown_list_options.html', {'levels': levels})


# Carregar o nivel 7 Liderança de acordo com 1 Executivo
def load1_levels7(request):
    ceo_id = request.GET.get('ceo')

    if ceo_id == '1':
        levels = Niveis.objects.filter(factor_id=7, code__in=[2, 3]).order_by('id')
    elif ceo_id == '0':
        levels = Niveis.objects.filter(factor_id=7).order_by('id')

    return render(request, 'avaliacao/level1_dropdown_list_options.html', {'levels': levels})


# Carregar o nivel 8 comunicacao de acordo com 1 Executivo
def load1_levels8(request):
    ceo_id = request.GET.get('ceo')

    if ceo_id == '1':
        levels = Niveis.objects.filter(factor_id=8, code__in=[3]).order_by('id')
    elif ceo_id == '0':
        levels = Niveis.objects.filter(factor_id=8).order_by('id')

    return render(request, 'avaliacao/level1_dropdown_list_options.html', {'levels': levels})


# Carregar as nivel 1 formação de acordo com a formação do cargo
def load_levels1(request):
    super_id = request.GET.get('title_super')
    superior = Superior.objects.filter(id=super_id).first()

    if superior:
        avaliacao = Avaliacao.objects.filter(id=superior.evaluation_id).first()

        if avaliacao:
            levels = Niveis.objects.filter(factor_id=1, code__lte=avaliacao.level1_id).order_by('id')
        else:
            levels = Niveis.objects.filter(factor_id=1).order_by('id')
    else:
        levels = Niveis.objects.filter(factor_id=1).order_by('id')

    return render(request, 'avaliacao/level1_dropdown_list_options.html', {'levels': levels})


# Carregar as nivel 2 Nivel Organizacional de acordo com o conhecimento
def load_levels2(request):

    level1_id = int(request.GET.get('level1'))
    if level1_id < 7:
        levels = Niveis.objects.filter(factor_id=2, code__in=[1]).order_by('id')
    elif level1_id < 10:
        levels = Niveis.objects.filter(factor_id=2, code__in=[2]).order_by('id')
    else:
        levels = Niveis.objects.filter(factor_id=2, code__in=[2, 3, 4]).order_by('id')

    return render(request, 'avaliacao/level1_dropdown_list_options.html', {'levels': levels})


# Carregar o nivel 3 Escopo com o nivel2 Nivel organizacional
def load_levels3(request):
    level2_id = int(request.GET.get('level2')) #nivel organizacional
    level1_id = int(request.GET.get('level1')) # conhecimento

    super_id = int(request.GET.get('title_super'))
    superior = Superior.objects.filter(id=super_id).first()
    avaliacao = Avaliacao.objects.filter(id=superior.evaluation_id).first()
    escopo_super = int(avaliacao.level3_id)


    # messages.add_message(request, messages.ERROR, 'Can not delete: this parent has a child!')

    # Monta o escopo maximo de acordo com o escopo do gestor - slide 14
    if escopo_super == 30 or escopo_super == 31:
        escopo = 10
    elif escopo_super == 28 or escopo_super == 29:
        escopo = 8
    elif escopo_super == 26 or escopo_super == 27:
        escopo = 6
    elif escopo_super == 24 or escopo_super == 25:
        escopo = 5
    elif escopo_super == 23:
        escopo = 3
    elif escopo_super <= 22:
        escopo = 2

    # levels = Niveis.objects.filter(factor_id=3, code=1).order_by('id')

    # filra o escopo de acordo com o conhecimento, nivel organizacional e escopo do gestor - slide 13
    if level1_id == 1 or  level1_id == 2:
        levels = Niveis.objects.filter(factor_id=3, code=1).order_by('id')
    elif level1_id == 3:
        levels = Niveis.objects.filter(factor_id=3, code__in=[2, 3], code__lte=escopo).order_by('id')
    elif level1_id == 4:
        levels = Niveis.objects.filter(factor_id=3, code__in=[3, 4], code__lte=escopo).order_by('id')
    elif 5 <= level1_id <= 8:
        levels = Niveis.objects.filter(factor_id=3, code=4, code__lte=escopo).order_by('id')
    elif level1_id == 9:
        levels = Niveis.objects.filter(factor_id=3, code__in=[5,6], code__lte=escopo).order_by('id')
    else:
        if level2_id == 17:
            levels = Niveis.objects.filter(factor_id=3, code__in=[5, 6], code__lte=escopo).order_by('id')
        elif level2_id == 18:
            levels = Niveis.objects.filter(factor_id=3, code__in=[7, 8], code__lte=escopo).order_by('id')
        else:
            levels = Niveis.objects.filter(factor_id=3, code__in=[9, 10], code__lte=escopo).order_by('id')

    return render(request, 'avaliacao/level1_dropdown_list_options.html', {'levels': levels})


# Carregar as nivel 4 abrangencia pelo escopo
def load_levels4(request):
    level3_id = int(request.GET.get('level3'))

    if level3_id <= 22 :
        levels = Niveis.objects.filter(factor_id=4, code__in=[1]).order_by('id')
    elif 23 <= level3_id <= 26 :
        levels = Niveis.objects.filter(factor_id=4, code__in=[2, 3, 4]).order_by('id')
    elif level3_id == 27 or level3_id == 29:
        levels = Niveis.objects.filter(factor_id=4, code__in=[5, 6]).order_by('id')
    elif level3_id == 28 :
        levels = Niveis.objects.filter(factor_id=4, code__in=[2, 3, 4]).order_by('id')
    elif level3_id == 30 or level3_id == 31 :
        levels = Niveis.objects.filter(factor_id=4, code__in=[7, 8]).order_by('id')

    return render(request, 'avaliacao/level1_dropdown_list_options.html', {'levels': levels})


# Carregar as nivel 5 liderança de acordo com 1 executivo
def load_levels5(request):
    level3_id = int(request.GET.get('level3'))

    if level3_id <= 22 :
        levels = Niveis.objects.filter(factor_id=5, code__in=[1]).order_by('id')
    elif 23 <= level3_id <= 25 :
        levels = Niveis.objects.filter(factor_id=5, code__in=[2, 3]).order_by('id')
    elif 26 <= level3_id <= 29 :
        levels = Niveis.objects.filter(factor_id=5, code__in=[4, 5]).order_by('id')
    elif level3_id == 30 or level3_id == 31 :
        levels = Niveis.objects.filter(factor_id=4, code__in=[6]).order_by('id')

    return render(request, 'avaliacao/level1_dropdown_list_options.html', {'levels': levels})


# Carregar o conhecimento pelo superior imediato
# def load_title_super(request):
#     super_id = request.GET.get('title_super')
#     superior = Superior.objects.filter(id=super_id).first()
#
#     if superior:
#         avaliacao = Avaliacao.objects.filter(id=superior.evaluation_id).first()
#
#         if avaliacao:
#             levels = Niveis.objects.filter(factor_id=1, code__lte=avaliacao.level1_id).order_by('id')
#         else:
#             levels = Niveis.objects.filter(factor_id=1).order_by('id')
#     else:
#         levels = Niveis.objects.filter(factor_id=1).order_by('id')
#
#     return render(request, 'avaliacao/level1_dropdown_list_options.html', {'levels': levels})


# Carregar as nivel 6 Gestao Recebida de acordo com o 3 escopo e com o 1 conhecimento
def load_levels6(request):
    level3_id = int(request.GET.get('level3')) # Escopo
    level1_id = int(request.GET.get('level1')) # conhecimento

    if level3_id <= 23:
        levels = Niveis.objects.filter(factor_id=6, code__in=[1]).order_by('id')
    elif level3_id == 24 and level1_id == 9:
        levels = Niveis.objects.filter(factor_id=6, code__in=[2, 3]).order_by('id')
    elif level3_id == 24 and level1_id > 9:
        levels = Niveis.objects.filter(factor_id=6, code__in=[3]).order_by('id')
    elif level3_id == 25:
        levels = Niveis.objects.filter(factor_id=6, code__in=[3, 4]).order_by('id')
    elif 26 <= level3_id <= 29:
        levels = Niveis.objects.filter(factor_id=6, code__in=[4]).order_by('id')
    elif level3_id == 28 and level3_id == 29:
        levels = Niveis.objects.filter(factor_id=6, code__in=[4]).order_by('id')
    elif level3_id == 30:
        levels = Niveis.objects.filter(factor_id=6, code__in=[5]).order_by('id')
    elif level3_id == 31:
        levels = Niveis.objects.filter(factor_id=6, code__in=[6]).order_by('id')

    return render(request, 'avaliacao/level1_dropdown_list_options.html', {'levels': levels})


# Carregar as nivel 7 Liderança  de acordo com o 2 Nivel Organizacional
def load_levels7(request):
    level2_id = int(request.GET.get('level2')) #nivel organizacional
    # manage_team_id = int(request.GET.get('manage_team')) # Gestão de Equipe
    # level3_id = int(request.GET.get('level3'))  # escopo

    if 18 <= level2_id <= 19:
        levels = Niveis.objects.filter(factor_id=7, code__in=[2, 3]).order_by('id')
    else:
        levels = Niveis.objects.filter(factor_id=7, code__in=[1, 2]).order_by('id')
        # if level2_id == 17 and manage_team_id == 2:
        #     levels = Niveis.objects.filter(factor_id=7, code__in=[2]).order_by('id')
        # elif manage_team_id == 1:
        #     levels = Niveis.objects.filter(factor_id=7, code__in=[1]).order_by('id')
        # elif level2_id == 16 and manage_team_id == 2 and 22 <= level3_id <= 23:
        #     levels = Niveis.objects.filter(factor_id=7, code__in=[2]).order_by('id')
        # elif level2_id == 16 and manage_team_id == 2 and 20 <= level3_id <= 21:
        #     levels = Niveis.objects.filter(factor_id=7, code__in=[1]).order_by('id')

    return render(request, 'avaliacao/level1_dropdown_list_options.html', {'levels': levels})


# Carregar as nivel 8 - Comunicação  de acordo com a gerencia
def load_levels8(request):
    level7_id = int(request.GET.get('level7')) # Liderança
    level1_id = int(request.GET.get('level1')) # conhecimento

    if level7_id == 52:
        if level1_id <= 4:
            levels = Niveis.objects.filter(factor_id=8, code=1).order_by('id')
        elif 5 <= level1_id <= 12:
            levels = Niveis.objects.filter(factor_id=8, code__in=[2, 3]).order_by('id')
        elif level1_id >= 13:
            levels = Niveis.objects.filter(factor_id=8, code__in=[3]).order_by('id')
    else:
        levels = Niveis.objects.filter(factor_id=8, code=3).order_by('id')

    return render(request, 'avaliacao/level1_dropdown_list_options.html', {'levels': levels})


# Carregar o grade
def load_grade(request):

    level1_id = request.GET.get('level1') # conhecimento
    level2_id = str(int(request.GET.get('level2')) - 15) # Nivel organizacional
    level3_id = str(int(request.GET.get('level3')) - 19) # escopo
    level4_id = str(int(request.GET.get('level4')) - 31) # abrangencia
    level5_id = str(int(request.GET.get('level5')) - 39) # gestão recebida
    level6_id = str(int(request.GET.get('level6')) - 45) # liderança
    level7_id = str(int(request.GET.get('level7')) - 51) # comunicação
    level8_id = str(int(request.GET.get('level8')) - 54) # Liderança

    niveis = level1_id + ';' + level2_id + ';' + level3_id + ';' + level4_id + ';' + level5_id + ';' + level6_id + ';' + level7_id + ';' + level8_id

    # Combinacoes.objects.create(name=niveis, grade='teste') # só para teste.

    combinacoes = Combinacoes.objects.filter(name=niveis).order_by('id')
    # grade = "BX22" #combinacao.grade

    return render(request, 'avaliacao/grade_list_options.html', {'combinacoes': combinacoes})


# Carregar o detalhe do nivel
def load_detalhe(request):

    level_id = request.GET.get('level')

    detalhes = Niveis.objects.filter(id=level_id).order_by('id')

    # detalhe = niveis.detail
    #
    # # grade = "BX22" #combinacao.grade

    return render(request, 'avaliacao/niveis_detalhe.html', {'detalhes': detalhes})