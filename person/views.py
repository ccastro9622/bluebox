from django.urls import reverse_lazy
from django.views.generic import DeleteView, CreateView, UpdateView
from django.views.generic.detail import DetailView
from django.views.generic.list import ListView
from django.contrib.auth.mixins import LoginRequiredMixin

from tenants.utils import tenant_from_request
from .models import Person


class PersonDetailView(LoginRequiredMixin, DetailView):
    model = Person
    context_object_name = "person"


class PersonListView(LoginRequiredMixin, ListView):
    model = Person
    context_object_name = "person"

    def get_queryset(self):
        tenant_id = tenant_from_request(self.request)
        return super().get_queryset().filter(tenant_id=tenant_id).all()


class PersonDeleteView(LoginRequiredMixin, DeleteView):
    model = Person
    context_object_name = "person"
    success_url = reverse_lazy("person:person-list")


class PersonCreateView(LoginRequiredMixin, CreateView):
    model = Person
    fields = ['name', 'cpf', 'birth_date', 'sex', 'civil_status', 'phone', 'address', 'number', 'complement','states', 'city', 'tenant']  # preencher todos os da views.py
    success_url = reverse_lazy("person:person-list")

    # def get_queryset(self):
    #     tenant_id = tenant_from_request(self.request)
    #     return super().get_queryset().filter(tenant_id=tenant_id).all()

    # def form_valid(self, form):
    #     tenant_id = tenant_from_request(self.request)
    #     return super().get_queryset().filter(tenant_id=tenant_id).all()

        # user = self.request.user
        # form.instance.user = user
        # return super(PersonCreateView, self).form_valid(form)

class PersonUpdateView(LoginRequiredMixin, UpdateView):
    model = Person
    fields = ['name', 'cpf', 'birth_date', 'sex', 'civil_status', 'phone', 'address', 'number', 'complement','states', 'city', 'tenant']  # preencher todos os da views.py
    success_url = reverse_lazy("person:person-list")

# from django.forms import ModelForm
# from django.shortcuts import render, redirect
# from .models import *
# from .forms import *

# Create your views here.


# def registrar(request, template_name="registrar.html"):
#     form = PersonForm(request.POST or None)
#     if form.is_valid():
#         usuario = form.save(commit=False)
#         usuario.save()
#         return redirect('registrado.html')
#     return render(request, template_name, {'form': form})
#
#
# def registrado(request, template_name="registrado.html"):
#     return render(request, template_name)
