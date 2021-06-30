from django import forms
from .models import *


class DiretoriaForm(forms.ModelForm):
    name = forms.CharField(widget=forms.TextInput(
        attrs={'class': 'form-control', 'required': 'true'}), label="Nome")
    tenant_id = forms.CharField(widget=forms.TextInput(
        attrs={'class': 'form-control', 'required': 'true'}), label="tenant_id")

class Meta:
    model = Diretoria
    fields = ['name', 'tenant_id']
