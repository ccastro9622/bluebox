from django import forms
from .models import *
from input_mask.widgets import InputMask
# from django_localflavor_br.forms import BRCPFField, BRPhoneNumberField
# from input_mask.contrib.localflavor.br.widgets import BRCPFInput, BRPhoneNumberInput


class DataCustomInput(InputMask):
    mask = {
        'mask': '99/99/9999',
    }


class PersonForm(forms.ModelForm):
    name = forms.CharField(widget=forms.TextInput(
        attrs={'class': 'form-control', 'required': 'true'}), label="Nome Completo")

    cpf = forms.CharField(widget=forms.TextInput(
        attrs={'class': 'form-control', 'required': 'true', 'data-mask': '000.000.000-00'}), label="CPF")

    birth_date = forms.DateField(widget=forms.TextInput(
                attrs={'type': 'date'}), label="Data de Nascimento")

    sex = forms.Select(
        attrs={'class': 'form-control', 'required': 'true'})

    civil_status = forms.Select(
        attrs={'class': 'form-control', 'required': 'true'})

    phone = forms.CharField(widget=forms.TextInput(
        attrs={'class': 'form-control', 'data-mask': '(00) 00000-0000', 'required': 'true'}), label="Telefone")

    address = forms.CharField(widget=forms.TextInput(
        attrs={'class': 'form-control', 'required': 'true'}), label="Logradouro")

    number = forms.NumberInput(
        attrs={'class': 'form-control', 'required': 'true'})

    complement = forms.CharField(widget=forms.TextInput(
        attrs={'class': 'form-control', 'required': 'false'}), label="Complemento")

    states = forms.Select(
        attrs={'class': 'form-control', 'required': 'true'})

    city = forms.CharField(widget=forms.TextInput(
        attrs={'class': 'form-control', 'required': 'true'}),label="Cidade")

    class Meta:
        model = Person
        fields = ['name', 'cpf', 'birth_date', 'sex', 'civil_status', 'phone', 'address', 'number',
                  'complement', 'states', 'city']
