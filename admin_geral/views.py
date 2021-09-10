from django.views.generic.detail import DetailView
from django.contrib.auth.mixins import LoginRequiredMixin

from .models import Plans, Sector, Nivelcargo


class PlansDetailView(LoginRequiredMixin, DetailView):
    model = Plans
    context_object_name = "plans"


class SectorDetailView(LoginRequiredMixin, DetailView):
    model = Sector
    context_object_name = "sector"


class NivelcargoDetailView(LoginRequiredMixin, DetailView):
    model = Nivelcargo
    context_object_name = "nivelcargo"
