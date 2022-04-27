from django import forms
from rest_framework.fields import ReadOnlyField

from tenants.utils import user_from_request
from .models import *


class DescricaoForm(forms.ModelForm):
    # #Verifica se o campo aprovador foi marcado quando status = a em aprovação e aprovado.
    # def clean_approver(self):
    #     status = int(self.data.get('status'))
    #     approver = self.cleaned_data['approver']
    #     if status ==3:
    #         if not approver:
    #             raise forms.ValidationError('O campo Arovador é obrigatório para o Status: Em Aprovação')
    #     return approver

    class Meta:
        model = Descricao
        fields = ['title', 'cbo', 'function', 'summary', 'summary_goal', 'summary_coverage', 'responsibility', 'formation', 'areas', 'areas2', 'areas3', 'areas4',
                  'formation_desired', 'areas_desired', 'specialization', 'area_specialization', 'area_specialization2', 'area_specialization3', 'area_specialization4', 'experience',
                  'qualification', 'qualification2', 'qualification3', 'qualification4', 'board', 'area', 'title_super','family', 'sub_familia', 'manage_team',
                  'position_team', 'idioma', 'proficiency', 'knowledge', 'information',
                  'approver', 'date_approval', 'status', 'date_conclusion', 'is_active', 'user_id']

# Filtrar a dropdow
    def __init__(self, *args, **kwargs):
        tenant_id = kwargs.pop('tenant_id', None)
        super().__init__(*args, **kwargs)
        self.fields['board'].queryset = Diretoria.objects.filter(tenant_id=tenant_id)
        self.fields['approver'].queryset = CustomUser.objects.filter(default_tenant=tenant_id)
        self.fields['area'].queryset = Area.objects.none()
        self.fields['sub_familia'].queryset = SubFamilias.objects.none()
        self.fields['status'].queryset = Status.objects.filter(id__in=[1])

# Filtra a area pela diretoria
        if 'board' in self.data:
            try:
                board_id = int(self.data.get('board'))
                self.fields['area'].queryset = Area.objects.filter(board_id=board_id).order_by('name')
            except (ValueError, TypeError):
                pass  # invalid input from the client; ignore and fallback to empty City queryset
        elif self.instance.id:
            board_id = Descricao.objects.filter(id=self.instance.id).first()
            if board_id:
                self.fields['area'].queryset = Area.objects.filter(board_id=board_id.board_id).order_by('name')

# Filtra a sub_familia pela familia.
        if 'family' in self.data:
            try:
                family_id = int(self.data.get('family'))
                self.fields['sub_familia'].queryset = SubFamilias.objects.filter(family_id=family_id).order_by('name')
            except (ValueError, TypeError):
                pass  # invalid input from the client; ignore and fallback to empty City queryset
        elif self.instance.id:
            family_id = Descricao.objects.filter(id=self.instance.id).first()
            if family_id:
                self.fields['sub_familia'].queryset = SubFamilias.objects.filter(family_id=family_id.family_id).order_by('name')


class DescricaoModeloForm(forms.ModelForm):

    class Meta:
        model = Descricao
        fields = ['title', 'cbo', 'function' ,'summary', 'summary_goal', 'summary_coverage', 'responsibility', 'formation', 'areas',
                  'formation_desired', 'areas_desired', 'specialization', 'area_specialization', 'experience',
                  'qualification', 'board', 'area', 'title_super','family', 'sub_familia', 'manage_team',
                  'position_team', 'idioma', 'proficiency', 'knowledge', 'information',
                  'approver', 'date_approval', 'status', 'date_conclusion']


    # Filtrar a dropdow
    def __init__(self, *args, **kwargs):
        tenant_id = kwargs.pop('tenant_id', None)
        super().__init__(*args, **kwargs)
        self.fields['board'].queryset = Diretoria.objects.filter(tenant_id=tenant_id)
        self.fields['approver'].queryset = CustomUser.objects.filter(default_tenant=tenant_id)
        self.fields['area'].queryset = Area.objects.none()
        self.fields['sub_familia'].queryset = SubFamilias.objects.none()
        self.fields['status'].queryset = Status.objects.filter(id__in=[1])

        # Filtra a area pela diretoria
        if 'board' in self.data:
            try:
                board_id = int(self.data.get('board'))
                self.fields['area'].queryset = Area.objects.filter(board_id=board_id).order_by('name')
            except (ValueError, TypeError):
                pass  # invalid input from the client; ignore and fallback to empty City queryset
        elif self.instance.id:
            self.fields['area'].queryset = self.instance.board.area_set.order_by('name')

        # Filtra a sub_familia pela familia.
        if 'family' in self.data:
            try:
                family_id = int(self.data.get('family'))
                self.fields['sub_familia'].queryset = SubFamilias.objects.filter(family_id=family_id).order_by(
                    'name')
            except (ValueError, TypeError):
                pass  # invalid input from the client; ignore and fallback to empty City queryset
        elif self.instance.id:
            self.fields['sub_familia'].queryset = self.instance.family.sub_familia_set.order_by('name')


# Definie aprovador
class DescricaoAprovadorForm(forms.ModelForm):

    #Verifica se o campo aprovador foi marcado quando status = a em aprovação e aprovado.
    def clean_approver(self):
        status = int(self.data.get('status'))
        approver = self.cleaned_data['approver']
        if status == 3:
            if not approver:
                raise forms.ValidationError('O campo Aprovador é obrigatório para Status: Em Aprovaçao')
        return approver


    class Meta:
        model = Descricao
        fields = ['title', 'cbo', 'function', 'summary', 'summary_goal', 'summary_coverage', 'responsibility', 'formation', 'areas',
                  'formation_desired', 'areas_desired', 'specialization', 'area_specialization', 'experience',
                  'qualification', 'board', 'area', 'title_super','family', 'sub_familia', 'manage_team',
                  'position_team', 'idioma', 'proficiency', 'knowledge', 'information',
                  'approver', 'date_approval', 'status', 'date_conclusion']

# Filtrar a dropdow
    def __init__(self, *args, **kwargs):
        tenant_id = kwargs.pop('tenant_id', None)
        super().__init__(*args, **kwargs)
        self.fields['board'].queryset = Diretoria.objects.filter(tenant_id=tenant_id)
        self.fields['approver'].queryset = CustomUser.objects.filter(default_tenant=tenant_id)
        self.fields['area'].queryset = Area.objects.none()
        self.fields['sub_familia'].queryset = SubFamilias.objects.none()
        self.fields['status'].queryset = Status.objects.filter(id__in=[3])

# Filtra a area pela diretoria
        if 'board' in self.data:
            try:
                board_id = int(self.data.get('board'))
                self.fields['area'].queryset = Area.objects.filter(board_id=board_id).order_by('name')
            except (ValueError, TypeError):
                pass  # invalid input from the client; ignore and fallback to empty City queryset
        elif self.instance.id:
            board_id = Descricao.objects.filter(id=self.instance.id).first()
            if board_id:
                self.fields['area'].queryset = Area.objects.filter(board_id=board_id.board_id).order_by('name')

# Filtra a sub_familia pela familia.
        if 'family' in self.data:
            try:
                family_id = int(self.data.get('family'))
                self.fields['sub_familia'].queryset = SubFamilias.objects.filter(family_id=family_id).order_by('name')
            except (ValueError, TypeError):
                pass  # invalid input from the client; ignore and fallback to empty City queryset
        elif self.instance.id:
            family_id = Descricao.objects.filter(id=self.instance.id).first()
            if family_id:
                self.fields['sub_familia'].queryset = SubFamilias.objects.filter(family_id=family_id.family_id).order_by('name')


class DescricaoAprovacaoForm(forms.ModelForm):


    #Verifica se o campo aprovador foi preenchido.
    def clean_approver(self):
        approver = self.cleaned_data['approver']
        if not approver:
            raise forms.ValidationError('O campo Aprovador é obrigatório.')
        return approver



    class Meta:
        model = Descricao
        fields = ['title', 'cbo', 'function', 'summary', 'summary_goal', 'summary_coverage', 'responsibility', 'formation', 'areas',
                  'formation_desired', 'areas_desired', 'specialization', 'area_specialization', 'experience',
                  'qualification', 'board', 'area', 'title_super','family', 'sub_familia', 'manage_team',
                  'position_team', 'idioma', 'proficiency', 'knowledge', 'information',
                  'approver', 'date_approval', 'status', 'date_conclusion']

# Filtrar a dropdow
    def __init__(self, *args, **kwargs):
        tenant_id = kwargs.pop('tenant_id', None)
        user_id = kwargs.pop('user_id', None)
        super().__init__(*args, **kwargs)
        self.fields['board'].queryset = Diretoria.objects.filter(tenant_id=tenant_id)
        self.fields['approver'].queryset = CustomUser.objects.filter(default_tenant=tenant_id, name=user_id)
        self.fields['area'].queryset = Area.objects.none()
        self.fields['sub_familia'].queryset = SubFamilias.objects.none()
        self.fields['status'].queryset = Status.objects.filter(id__in=[3])

# Filtra a area pela diretoria
        if 'board' in self.data:
            try:
                board_id = int(self.data.get('board'))
                self.fields['area'].queryset = Area.objects.filter(board_id=board_id).order_by('name')
            except (ValueError, TypeError):
                pass  # invalid input from the client; ignore and fallback to empty City queryset
        elif self.instance.id:
            board_id = Descricao.objects.filter(id=self.instance.id).first()
            if board_id:
                self.fields['area'].queryset = Area.objects.filter(board_id=board_id.board_id).order_by('name')

# Filtra a sub_familia pela familia.
        if 'family' in self.data:
            try:
                family_id = int(self.data.get('family'))
                self.fields['sub_familia'].queryset = SubFamilias.objects.filter(family_id=family_id).order_by('name')
            except (ValueError, TypeError):
                pass  # invalid input from the client; ignore and fallback to empty City queryset
        elif self.instance.id:
            family_id = Descricao.objects.filter(id=self.instance.id).first()
            if family_id:
                self.fields['sub_familia'].queryset = SubFamilias.objects.filter(family_id=family_id.family_id).order_by('name')


# Aprovação Final
class DescricaoAprovacaoFinalForm(forms.ModelForm):

    # #Verifica se o campo aprovador foi marcado quando status = a em aprovação e aprovado.
    # def clean_approver(self):
    #     status = int(self.data.get('status'))
    #     approver = self.cleaned_data['approver']
    #     if status == 3:
    #         if not approver:
    #             raise forms.ValidationError('O campo Aprovador é obrigatório para Status: Em Aprovaçao')
    #     return approver


    class Meta:
        model = Descricao
        fields = ['title', 'cbo', 'function', 'summary', 'summary_goal', 'summary_coverage', 'responsibility', 'formation', 'areas',
                  'formation_desired', 'areas_desired', 'specialization', 'area_specialization', 'experience',
                  'qualification', 'board', 'area', 'title_super','family', 'sub_familia', 'manage_team',
                  'position_team', 'idioma', 'proficiency', 'knowledge', 'information',
                  'approver', 'date_approval', 'status', 'date_conclusion']

# Filtrar a dropdow
    def __init__(self, *args, **kwargs):
        tenant_id = kwargs.pop('tenant_id', None)
        user_id = kwargs.pop('user_id', None)
        super().__init__(*args, **kwargs)
        self.fields['board'].queryset = Diretoria.objects.filter(tenant_id=tenant_id)
        self.fields['approver'].queryset = CustomUser.objects.filter(default_tenant=tenant_id)
        self.fields['area'].queryset = Area.objects.none()
        self.fields['sub_familia'].queryset = SubFamilias.objects.none()
        self.fields['status'].queryset = Status.objects.filter(id__in=[5])

# Filtra a area pela diretoria
        if 'board' in self.data:
            try:
                board_id = int(self.data.get('board'))
                self.fields['area'].queryset = Area.objects.filter(board_id=board_id).order_by('name')
            except (ValueError, TypeError):
                pass  # invalid input from the client; ignore and fallback to empty City queryset
        elif self.instance.id:
            board_id = Descricao.objects.filter(id=self.instance.id).first()
            if board_id:
                self.fields['area'].queryset = Area.objects.filter(board_id=board_id.board_id).order_by('name')

# Filtra a sub_familia pela familia.
        if 'family' in self.data:
            try:
                family_id = int(self.data.get('family'))
                self.fields['sub_familia'].queryset = SubFamilias.objects.filter(family_id=family_id).order_by('name')
            except (ValueError, TypeError):
                pass  # invalid input from the client; ignore and fallback to empty City queryset
        elif self.instance.id:
            family_id = Descricao.objects.filter(id=self.instance.id).first()
            if family_id:
                self.fields['sub_familia'].queryset = SubFamilias.objects.filter(family_id=family_id.family_id).order_by('name')