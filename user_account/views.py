from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.forms import AuthenticationForm, UserCreationForm
from django.shortcuts import render, redirect
from django.contrib import messages
# Create your views here.
from django.urls import reverse_lazy
from django.views.generic import DeleteView, CreateView, UpdateView
from django.views.generic.detail import DetailView
from django.views.generic.list import ListView
from django.contrib.auth.mixins import LoginRequiredMixin

from tenants.utils import tenant_from_request
from .models import CustomUser
from user_account.forms import CustomUserCreationForm, CustomUserChangeForm
from descricao.models import Descricao
from avaliacao.models import Avaliacao


class CustomuserDetailView(LoginRequiredMixin, DetailView):
    model = CustomUser
    context_object_name = "customuser"


class CustomuserListView(LoginRequiredMixin, ListView):
    model = CustomUser
    context_object_name = "customuser"

    def get_queryset(self):
        tenant_id = tenant_from_request(self.request)
        return super().get_queryset().filter(default_tenant_id=tenant_id).all()


class CustomuserDeleteView(LoginRequiredMixin, DeleteView):
    model = CustomUser
    context_object_name = "customuser"
    success_url = reverse_lazy("user_account:customuser-list")


# class CustomuserCreateView(LoginRequiredMixin, CreateView):
#     model = CustomUser
#     fields = ['name', 'email', 'default_tenant','person', 'password']  # preencher todos os da views.py
#     success_url = reverse_lazy("user_account:customuser-list")


# class CustomuserUpdateView(LoginRequiredMixin, UpdateView):
#     model = CustomUser
#     fields = ['name', 'email', 'default_tenant','person', 'password']  # preencher todos os da views.py
#     success_url = reverse_lazy("user_account:customuser-list")


def logar_usuario(request):
    if request.method == "POST":
        username = request.POST["username"]
        password = request.POST["password"]
        usuario = authenticate(request, username=username, password=password)
        if usuario is not None:
            login(request, usuario)
            return redirect('index.html')
        else:
            messages.error(request, "Usuário ou senha inválidos!!!!")
            form_login = AuthenticationForm()
    else:
        form_login = AuthenticationForm()
    return render(request, 'login.html', {'form_login': form_login})


def index(request):
    tenant_id = tenant_from_request(request)
    descricao = Descricao.objects.filter(tenant_id=tenant_id).count()
    avaliacao = Avaliacao.objects.filter(tenant_id=tenant_id).count()
    pendente = Descricao.objects.filter(tenant_id=tenant_id, status_id__in=[3]).count()

    return render(request, 'index.html', {'descricao': descricao, 'avaliacao':avaliacao, 'pendente':pendente})


def sair(request):
    logout(request)
    return redirect('login.html')


def cadastrar_usuario(request):
    if request.method == "POST":
        form_usuario = CustomUserCreationForm(request.POST)
        if form_usuario.is_valid():
            # Forçar o preenchimento do tenant_id com o tenant_id do usuario logado
            tenant_id = tenant_from_request(request)
            form_usuario.instance.default_tenant_id = tenant_id
            form_usuario.save()
            return redirect('/customuser/customuser_list/')
    else:
        form_usuario = CustomUserCreationForm()
    return render(request, 'user_account/customuser_add.html', {'form_usuario': form_usuario})


def alterar_usuario(request, pk):
    if request.method == "POST":
        form_usuario = CustomUserChangeForm(request.POST)
        if form_usuario.is_valid():
            form_usuario.save()
            return redirect('/customuser/customuser_list/')
    else:
        form_usuario = CustomUserChangeForm()
    return render(request, 'user_account/customuser_add.html', {'form_usuario': form_usuario})
