from django import forms
from .models import *
from master.models import Diretoria


class DiretoriaForm(forms.ModelForm):
    name = forms.CharField(widget=forms.TextInput(
        attrs={'class': 'form-control', 'required': 'true'}), label="Nome")
    tenant_id = forms.CharField(widget=forms.TextInput(
        attrs={'class': 'form-control', 'required': 'true'}), label="tenant_id")
    is_active = forms.BooleanField()

    class Meta:
        model = Diretoria
        fields = ['name', 'tenant_id', 'is_active']


class AreaForm(forms.ModelForm):

    class Meta:
        model = Area
        fields = ['name', 'board', 'is_active']

# Filtrar a dropdow
    def __init__(self, *args, **kwargs):
        tenant_id = kwargs.pop('tenant_id', None)
        super(AreaForm, self).__init__(*args, **kwargs)
        self.fields['board'].queryset = Diretoria.objects.filter(tenant_id=tenant_id)
