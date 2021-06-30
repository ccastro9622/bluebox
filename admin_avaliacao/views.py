from django.views.generic.detail import DetailView
from django.contrib.auth.mixins import LoginRequiredMixin

from .models import Familias, SubFamilias, Fatores, Niveis, Matrizes, Grades


class FamiliasDetailView(LoginRequiredMixin, DetailView):
    model = Familias
    context_object_name = "familias"


class SubFamiliasDetailView(LoginRequiredMixin, DetailView):
    model = SubFamilias
    context_object_name = "subfamilias"


class FatoresDetailView(LoginRequiredMixin, DetailView):
    model = Fatores
    context_object_name = "fatores"


class NiveisDetailView(LoginRequiredMixin, DetailView):
    model = Niveis
    context_object_name = "niveis"


class MatrizesDetailView(LoginRequiredMixin, DetailView):
    model = Matrizes
    context_object_name = "matrizes"


class GradesDetailView(LoginRequiredMixin, DetailView):
    model = Grades
    context_object_name = "grades"
