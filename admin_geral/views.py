from django.views.generic.detail import DetailView
from django.contrib.auth.mixins import LoginRequiredMixin

from .models import Plans, Sector, Nivelcargo, Origemcapital, Tipoempresa, Governanca, Dimensao


class PlansDetailView(LoginRequiredMixin, DetailView):
    model = Plans
    context_object_name = "plans"


class SectorDetailView(LoginRequiredMixin, DetailView):
    model = Sector
    context_object_name = "sector"


class NivelcargoDetailView(LoginRequiredMixin, DetailView):
    model = Nivelcargo
    context_object_name = "nivelcargo"


class OrigemcapitalDetailView(LoginRequiredMixin, DetailView):
    model = Origemcapital
    context_object_name = "origemcapital"


class TipoempresaDetailView(LoginRequiredMixin, DetailView):
    model = Tipoempresa
    context_object_name = "tipoempresa"


class GovernancaDetailView(LoginRequiredMixin, DetailView):
    model = Governanca
    context_object_name = "governanca"


class DimensaoDetailView(LoginRequiredMixin, DetailView):
    model = Dimensao
    context_object_name = "dimensao"