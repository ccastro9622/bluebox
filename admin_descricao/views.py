from django.views.generic.detail import DetailView
from django.contrib.auth.mixins import LoginRequiredMixin

from .models import Formacao, Areas, Idiomas, Habilitacoes, Descricoes, Especializacoes, Experiencias


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


class Especializacoes(LoginRequiredMixin, DetailView):
    model = Especializacoes
    context_object_name = "Especializacoes"

class Experiencias(LoginRequiredMixin, DetailView):
    model = Experiencias
    context_object_name = "Experiencias"


class DescricoesDetailView(LoginRequiredMixin, DetailView):
    model = Descricoes
    context_object_name = "Descricoes"

