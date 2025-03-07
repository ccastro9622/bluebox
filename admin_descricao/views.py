from django.views.generic import UpdateView
from django.views.generic.detail import DetailView
from django.views.generic.list import ListView
from django.contrib.auth.mixins import LoginRequiredMixin

from .models import Formacao, Areas, Idiomas, Habilitacoes, Descricoes, Especializacoes, Experiencias, Status, Gerencia, \
    AreasEspecializacoes, Niveis


class FormacaoDetailView(LoginRequiredMixin, DetailView):
    model = Formacao
    context_object_name = "Formação"


class AreasDetailView(LoginRequiredMixin, DetailView):
    model = Areas
    context_object_name = "Areas Formação"


class IdiomasDetailView(LoginRequiredMixin, DetailView):
    model = Idiomas
    context_object_name = "Idiomas"


class HabilitacoesDetailView(LoginRequiredMixin, DetailView):
    model = Habilitacoes
    context_object_name = "Habilitacoes/Cerificações"


class EspecializacoesDetailView(LoginRequiredMixin, DetailView):
    model = Especializacoes
    context_object_name = "Especializacoes"


class AreasEspecializacoesDetailView(LoginRequiredMixin, DetailView):
    model = AreasEspecializacoes
    context_object_name = "Especializacoes"


class ExperienciasDetailView(LoginRequiredMixin, DetailView):
    model = Experiencias
    context_object_name = "Experiencias"


class DescricoesDetailView(LoginRequiredMixin, DetailView):
    model = Descricoes
    context_object_name = "descricoes"


class DescricoesListView(LoginRequiredMixin, ListView):
    model = Descricoes
    context_object_name = "descricoes"


class StatusDetailView(LoginRequiredMixin, DetailView):
    model = Status
    context_object_name = "Situacao"


class GerenciaDetailView(LoginRequiredMixin, DetailView):
    model = Gerencia
    context_object_name = "Gerencia"


# class DescricaoDetailView(LoginRequiredMixin, DetailView):
#     model = Descricoes
#     context_object_name = 'Descricoes'


# class DescricaoUpdateView(LoginRequiredMixin, UpdateView):
#     model = Descricoes
#     fields = ['name', 'tenant']  # preencher todos os da views.py

class ProficienciaDetailView(LoginRequiredMixin, DetailView):
    model = Idiomas
    context_object_name = "Proficiencia"


class NiveisDetailView(LoginRequiredMixin, DetailView):
    model = Niveis
    context_object_name = "Niveis"
