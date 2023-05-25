from django import forms
from rest_framework.fields import ReadOnlyField

from tenants.utils import user_from_request
from .models import *


class DescricaoForm(forms.ModelForm):
    position_team = forms.CharField(label="Cargos da Equipe",
                                   widget=forms.Textarea(attrs={'rows': 3, 'cols': 100, 'id': 'position_team'}))

    summary_goal = forms.CharField(label="Missão do Cargo",
                                   widget=forms.Textarea(attrs={'cols': 100, 'id': 'summary_goal'}))

    responsibility = forms.CharField(label="Principais Responsabilidades",
                                   widget=forms.Textarea(attrs={'cols': 100, 'id': 'responsibility'}))

    knowledge = forms.CharField(label="Conhecimentos Específicos", required=False,
                                   widget=forms.Textarea(attrs={'cols': 100, 'id': 'knowledge'}))

    information = forms.CharField(label="Outras Informações", required=False,
                                   widget=forms.Textarea(attrs={'cols': 100, 'id': 'information'}))

    #Valida preenchimento area de formacao complementar
    def clean_area_specialization(self):
        specialization = self.cleaned_data['specialization']
        area_specialization = self.cleaned_data['area_specialization']
        if specialization:
            if not area_specialization:
                raise forms.ValidationError('Informe pelo menos uma Área de Formação Complementar para a Formação acima.')
        return area_specialization

    def clean_proficiency(self):
        idioma = self.cleaned_data['idioma']
        proficiency = self.cleaned_data['proficiency']
        if idioma:
            if not proficiency:
                raise forms.ValidationError('Informe o nível de Proficiência para o Idioma acima.')
        return proficiency

    def clean_proficiency2(self):
        idioma2 = self.cleaned_data['idioma2']
        proficiency2 = self.cleaned_data['proficiency2']
        if idioma2:
            if not proficiency2:
                raise forms.ValidationError('Informe o nível de Proficiência para o Idioma acima.')
        return proficiency2

    def clean_proficiency3(self):
        idioma3 = self.cleaned_data['idioma3']
        proficiency3 = self.cleaned_data['proficiency3']
        if idioma3:
            if not proficiency3:
                raise forms.ValidationError('Informe o nível de Proficiência para o Idioma acima.')
        return proficiency3

    def clean_areas(self):
        formation_required = self.cleaned_data['formation']
        areas_required = self.cleaned_data['areas']
        formation = int(self.data.get('formation'))
        if formation_required:
            if formation in [4, 5, 6, 7, 8, 9, 10, 11]:
                if not areas_required:
                    raise forms.ValidationError('Informe pelo menos uma Área de Formação Obrigatória para o Grau de Escolaridade acima.')
        return areas_required

    def clean_areas_desired(self):
        formation_desired = self.cleaned_data['formation_desired']
        areas_desired = self.cleaned_data['areas_desired']
        formation = int(self.data.get('formation_desired'))
        if formation_desired:
            if formation in [4, 5, 6, 7, 8, 9, 10, 11]:
                if not areas_desired:
                    raise forms.ValidationError('Informe pelo menos uma Área de Formação Desejada para o Grau de Escolaridade acima.')
        return areas_desired



    class Meta:
        model = Descricao
        fields = ['title', 'cbo', 'function', 'summary_goal', 'responsibility', 'formation', 'areas', 'areas2', 'areas3', 'areas4',
                  'formation_desired', 'areas_desired', 'areas_desired2', 'areas_desired3', 'areas_desired4', 'specialization', 'area_specialization',
                  'area_specialization2', 'area_specialization3', 'area_specialization4', 'experience', 'position_team' ,
                  'qualification', 'qualification2', 'qualification3', 'board', 'area', 'title_super','family', 'sub_familia', 'manage_team',
                  'idioma', 'idioma2', 'idioma3', 'proficiency', 'proficiency2', 'proficiency3', 'knowledge', 'information',
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
        # self.fields['status'].widget.attrs['disabled'] = 'disabled'

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
    position_team = forms.CharField(label="Cargos da Equipe",
                                    widget=forms.Textarea(attrs={'rows': 3, 'cols': 100, 'id': 'position_team'}))

    summary_goal = forms.CharField(label="Missão do Cargo",
                                   widget=forms.Textarea(attrs={'cols': 100, 'id': 'summary_goal'}))

    responsibility = forms.CharField(label="Principais Responsabilidades",
                                     widget=forms.Textarea(attrs={'cols': 100, 'id': 'responsibility'}))

    knowledge = forms.CharField(label="Conhecimentos Específicos", required=False,
                                widget=forms.Textarea(attrs={'cols': 100, 'id': 'knowledge'}))

    information = forms.CharField(label="Outras Informações", required=False,
                                  widget=forms.Textarea(attrs={'cols': 100, 'id': 'information'}))

#Valida preenchimento area de formacao complementar
    def clean_area_specialization(self):
        specialization = self.cleaned_data['specialization']
        area_specialization = self.cleaned_data['area_specialization']
        if specialization:
            if not area_specialization:
                raise forms.ValidationError('Informe pelo menos uma Área de Formação Complementar para a Formação acima.')
        return area_specialization

    def clean_proficiency(self):
        idioma = self.cleaned_data['idioma']
        proficiency = self.cleaned_data['proficiency']
        if idioma:
            if not proficiency:
                raise forms.ValidationError('Informe o nível de Proficiência para o Idioma acima.')
        return proficiency

    def clean_proficiency2(self):
        idioma2 = self.cleaned_data['idioma2']
        proficiency2 = self.cleaned_data['proficiency2']
        if idioma2:
            if not proficiency2:
                raise forms.ValidationError('Informe o nível de Proficiência para o Idioma acima.')
        return proficiency2

    def clean_proficiency3(self):
        idioma3 = self.cleaned_data['idioma3']
        proficiency3 = self.cleaned_data['proficiency3']
        if idioma3:
            if not proficiency3:
                raise forms.ValidationError('Informe o nível de Proficiência para o Idioma acima.')
        return proficiency3

    def clean_areas(self):
        formation_required = self.cleaned_data['formation']
        areas_required = self.cleaned_data['areas']
        formation = int(self.data.get('formation'))
        if formation_required:
            if formation in [4, 5, 6, 7, 8, 9, 10, 11]:
                if not areas_required:
                    raise forms.ValidationError('Informe pelo menos uma Área de Formação Obrigatória para o Grau de Escolaridade acima.')
        return areas_required

    def clean_areas_desired(self):
        formation_desired = self.cleaned_data['formation_desired']
        areas_desired = self.cleaned_data['areas_desired']
        formation = int(self.data.get('formation_desired'))
        if formation_desired:
            if formation in [4, 5, 6, 7, 8, 9, 10, 11]:
                if not areas_desired:
                    raise forms.ValidationError('Informe pelo menos uma Área de Formação Desejada para o Grau de Escolaridade acima.')
        return areas_desired



    class Meta:
        model = Descricao
        # fields = ['title', 'cbo', 'function' ,'summary', 'summary_goal', 'summary_coverage', 'responsibility', 'formation', 'areas',
        #           'formation_desired', 'areas_desired', 'specialization', 'area_specialization', 'experience',
        #           'qualification', 'board', 'area', 'title_super','family', 'sub_familia', 'manage_team',
        #           'position_team', 'idioma', 'proficiency', 'knowledge', 'information',
        #           'approver', 'date_approval', 'status', 'date_conclusion']

        fields = ['title', 'cbo', 'function', 'summary_goal', 'responsibility', 'formation', 'areas', 'areas2', 'areas3', 'areas4',
                  'formation_desired', 'areas_desired', 'areas_desired2', 'areas_desired3', 'areas_desired4', 'specialization', 'area_specialization',
                  'area_specialization2', 'area_specialization3', 'area_specialization4', 'experience',
                  'qualification', 'qualification2', 'qualification3', 'board', 'area', 'title_super','family', 'sub_familia', 'manage_team',
                  'position_team', 'idioma', 'idioma2', 'idioma3', 'proficiency', 'proficiency2', 'proficiency3', 'knowledge', 'information',
                  'approver', 'date_approval', 'status', 'date_conclusion', 'is_active', 'user_id']


    # Filtrar a dropdow
    def __init__(self, *args, **kwargs):
        tenant_id = kwargs.pop('tenant_id', None)
        super().__init__(*args, **kwargs)
        self.fields['board'].queryset = Diretoria.objects.filter(tenant_id=tenant_id)
        self.fields['approver'].queryset = CustomUser.objects.filter(default_tenant=tenant_id)
        self.fields['area'].queryset = Area.objects.none()
        # self.fields['sub_familia'].queryset = SubFamilias.objects.none()
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
    position_team = forms.CharField(label="Cargos da Equipe",
                                    widget=forms.Textarea(attrs={'rows': 3, 'cols': 100, 'id': 'position_team'}))

    summary_goal = forms.CharField(label="Missão do Cargo",
                                   widget=forms.Textarea(attrs={'cols': 100, 'id': 'summary_goal'}))

    responsibility = forms.CharField(label="Principais Responsabilidades",
                                     widget=forms.Textarea(attrs={'cols': 100, 'id': 'responsibility'}))

    knowledge = forms.CharField(label="Conhecimentos Específicos", required=False,
                                widget=forms.Textarea(attrs={'cols': 100, 'id': 'knowledge'}))

    information = forms.CharField(label="Outras Informações", required=False,
                                  widget=forms.Textarea(attrs={'cols': 100, 'id': 'information'}))

    #Verifica se o campo aprovador foi marcado quando status = a em aprovação e aprovado.
    def clean_approver(self):
        status = int(self.data.get('status'))
        approver = self.cleaned_data['approver']
        if status == 3:
            if not approver:
                raise forms.ValidationError('O campo Aprovador é obrigatório para Status: Em Aprovaçao')
        return approver

    #Valida preenchimento area de formacao complementar
    def clean_area_specialization(self):
        specialization = self.cleaned_data['specialization']
        area_specialization = self.cleaned_data['area_specialization']
        if specialization:
            if not area_specialization:
                raise forms.ValidationError('Informe pelo menos uma Área de Formação Complementar para a Formação acima.')
        return area_specialization

    def clean_proficiency(self):
        idioma = self.cleaned_data['idioma']
        proficiency = self.cleaned_data['proficiency']
        if idioma:
            if not proficiency:
                raise forms.ValidationError('Informe o nível de Proficiência para o Idioma acima.')
        return proficiency

    def clean_proficiency2(self):
        idioma2 = self.cleaned_data['idioma2']
        proficiency2 = self.cleaned_data['proficiency2']
        if idioma2:
            if not proficiency2:
                raise forms.ValidationError('Informe o nível de Proficiência para o Idioma acima.')
        return proficiency2

    def clean_proficiency3(self):
        idioma3 = self.cleaned_data['idioma3']
        proficiency3 = self.cleaned_data['proficiency3']
        if idioma3:
            if not proficiency3:
                raise forms.ValidationError('Informe o nível de Proficiência para o Idioma acima.')
        return proficiency3

    def clean_areas(self):
        formation_required = self.cleaned_data['formation']
        areas_required = self.cleaned_data['areas']
        formation = int(self.data.get('formation'))
        if formation_required:
            if formation in [4, 5, 6, 7, 8, 9, 10, 11]:
                if not areas_required:
                    raise forms.ValidationError('Informe pelo menos uma Área de Formação Obrigatória para o Grau de Escolaridade acima.')
        return areas_required

    def clean_areas_desired(self):
        formation_desired = self.cleaned_data['formation_desired']
        areas_desired = self.cleaned_data['areas_desired']
        formation = int(self.data.get('formation_desired'))
        if formation_desired:
            if formation in [4, 5, 6, 7, 8, 9, 10, 11]:
                if not areas_desired:
                    raise forms.ValidationError('Informe pelo menos uma Área de Formação Desejada para o Grau de Escolaridade acima.')
        return areas_desired




    class Meta:
        model = Descricao
        fields = ['title', 'cbo', 'function', 'summary_goal', 'responsibility', 'formation', 'areas', 'areas2', 'areas3', 'areas4',
                  'formation_desired', 'areas_desired', 'areas_desired2', 'areas_desired3', 'areas_desired4', 'specialization', 'area_specialization',
                  'area_specialization2', 'area_specialization3', 'area_specialization4', 'experience', 'position_team' ,
                  'qualification', 'qualification2', 'qualification3', 'board', 'area', 'title_super','family', 'sub_familia', 'manage_team',
                  'idioma', 'idioma2', 'idioma3', 'proficiency', 'proficiency2', 'proficiency3', 'knowledge', 'information',
                  'approver', 'date_approval', 'status', 'date_conclusion', 'is_active', 'user_id']

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
    position_team = forms.CharField(label="Cargos da Equipe",
                                    widget=forms.Textarea(attrs={'rows': 3, 'cols': 100, 'id': 'position_team'}))

    summary_goal = forms.CharField(label="Missão do Cargo",
                                   widget=forms.Textarea(attrs={'cols': 100, 'id': 'summary_goal'}))

    responsibility = forms.CharField(label="Principais Responsabilidades",
                                     widget=forms.Textarea(attrs={'cols': 100, 'id': 'responsibility'}))

    knowledge = forms.CharField(label="Conhecimentos Específicos", required=False,
                                widget=forms.Textarea(attrs={'cols': 100, 'id': 'knowledge'}))

    information = forms.CharField(label="Outras Informações", required=False,
                                  widget=forms.Textarea(attrs={'cols': 100, 'id': 'information'}))
    #Valida preenchimento area de formacao complementar
    def clean_area_specialization(self):
        specialization = self.cleaned_data['specialization']
        area_specialization = self.cleaned_data['area_specialization']
        if specialization:
            if not area_specialization:
                raise forms.ValidationError('Informe pelo menos uma Área de Formação Complementar para a Formação acima.')
        return area_specialization

    def clean_proficiency(self):
        idioma = self.cleaned_data['idioma']
        proficiency = self.cleaned_data['proficiency']
        if idioma:
            if not proficiency:
                raise forms.ValidationError('Informe o nível de Proficiência para o Idioma acima.')
        return proficiency

    def clean_proficiency2(self):
        idioma2 = self.cleaned_data['idioma2']
        proficiency2 = self.cleaned_data['proficiency2']
        if idioma2:
            if not proficiency2:
                raise forms.ValidationError('Informe o nível de Proficiência para o Idioma acima.')
        return proficiency2

    def clean_proficiency3(self):
        idioma3 = self.cleaned_data['idioma3']
        proficiency3 = self.cleaned_data['proficiency3']
        if idioma3:
            if not proficiency3:
                raise forms.ValidationError('Informe o nível de Proficiência para o Idioma acima.')
        return proficiency3

    def clean_areas(self):
        formation_required = self.cleaned_data['formation']
        areas_required = self.cleaned_data['areas']
        formation = int(self.data.get('formation'))
        if formation_required:
            if formation in [4, 5, 6, 7, 8, 9, 10, 11]:
                if not areas_required:
                    raise forms.ValidationError('Informe pelo menos uma Área de Formação Obrigatória para o Grau de Escolaridade acima.')
        return areas_required

    def clean_areas_desired(self):
        formation_desired = self.cleaned_data['formation_desired']
        areas_desired = self.cleaned_data['areas_desired']
        formation = int(self.data.get('formation_desired'))
        if formation_desired:
            if formation in [4, 5, 6, 7, 8, 9, 10, 11]:
                if not areas_desired:
                    raise forms.ValidationError('Informe pelo menos uma Área de Formação Desejada para o Grau de Escolaridade acima.')
        return areas_desired


    #Verifica se o campo aprovador foi preenchido.
    def clean_approver(self):
        approver = self.cleaned_data['approver']
        if not approver:
            raise forms.ValidationError('O campo Aprovador é obrigatório.')
        return approver



    class Meta:
        model = Descricao
        fields = ['title', 'cbo', 'function', 'summary_goal', 'responsibility', 'formation', 'areas', 'areas2', 'areas3', 'areas4',
                  'formation_desired', 'areas_desired', 'areas_desired2', 'areas_desired3', 'areas_desired4', 'specialization', 'area_specialization',
                  'area_specialization2', 'area_specialization3', 'area_specialization4', 'experience', 'position_team' ,
                  'qualification', 'qualification2', 'qualification3', 'board', 'area', 'title_super','family', 'sub_familia', 'manage_team',
                  'idioma', 'idioma2', 'idioma3', 'proficiency', 'proficiency2', 'proficiency3', 'knowledge', 'information',
                  'approver', 'date_approval', 'status', 'date_conclusion', 'is_active', 'user_id']

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
    position_team = forms.CharField(label="Cargos da Equipe",
                                    widget=forms.Textarea(attrs={'rows': 3, 'cols': 100, 'id': 'position_team'}))

    summary_goal = forms.CharField(label="Missão do Cargo",
                                   widget=forms.Textarea(attrs={'cols': 100, 'id': 'summary_goal'}))

    responsibility = forms.CharField(label="Principais Responsabilidades",
                                     widget=forms.Textarea(attrs={'cols': 100, 'id': 'responsibility'}))

    knowledge = forms.CharField(label="Conhecimentos Específicos", required=False,
                                widget=forms.Textarea(attrs={'cols': 100, 'id': 'knowledge'}))

    information = forms.CharField(label="Outras Informações", required=False,
                                  widget=forms.Textarea(attrs={'cols': 100, 'id': 'information'}))

    # #Verifica se o campo aprovador foi marcado quando status = a em aprovação e aprovado.
    # def clean_approver(self):
    #     status = int(self.data.get('status'))
    #     approver = self.cleaned_data['approver']
    #     if status == 3:
    #         if not approver:
    #             raise forms.ValidationError('O campo Aprovador é obrigatório para Status: Em Aprovaçao')
    #     return approver

    #Valida preenchimento area de formacao complementar
    def clean_area_specialization(self):
        specialization = self.cleaned_data['specialization']
        area_specialization = self.cleaned_data['area_specialization']
        if specialization:
            if not area_specialization:
                raise forms.ValidationError('Informe pelo menos uma Área de Formação Complementar para a Formação acima.')
        return area_specialization

    def clean_proficiency(self):
        idioma = self.cleaned_data['idioma']
        proficiency = self.cleaned_data['proficiency']
        if idioma:
            if not proficiency:
                raise forms.ValidationError('Informe o nível de Proficiência para o Idioma acima.')
        return proficiency

    def clean_proficiency2(self):
        idioma2 = self.cleaned_data['idioma2']
        proficiency2 = self.cleaned_data['proficiency2']
        if idioma2:
            if not proficiency2:
                raise forms.ValidationError('Informe o nível de Proficiência para o Idioma acima.')
        return proficiency2

    def clean_proficiency3(self):
        idioma3 = self.cleaned_data['idioma3']
        proficiency3 = self.cleaned_data['proficiency3']
        if idioma3:
            if not proficiency3:
                raise forms.ValidationError('Informe o nível de Proficiência para o Idioma acima.')
        return proficiency3

    def clean_areas(self):
        formation_required = self.cleaned_data['formation']
        areas_required = self.cleaned_data['areas']
        formation = int(self.data.get('formation'))
        if formation_required:
            if formation in [4, 5, 6, 7, 8, 9, 10, 11]:
                if not areas_required:
                    raise forms.ValidationError('Informe pelo menos uma Área de Formação Obrigatória para o Grau de Escolaridade acima.')
        return areas_required

    def clean_areas_desired(self):
        formation_desired = self.cleaned_data['formation_desired']
        areas_desired = self.cleaned_data['areas_desired']
        formation = int(self.data.get('formation_desired'))
        if formation_desired:
            if formation in [4, 5, 6, 7, 8, 9, 10, 11]:
                if not areas_desired:
                    raise forms.ValidationError('Informe pelo menos uma Área de Formação Desejada para o Grau de Escolaridade acima.')
        return areas_desired


    class Meta:
        model = Descricao
        fields = ['title', 'cbo', 'function', 'summary_goal', 'responsibility', 'formation', 'areas', 'areas2', 'areas3', 'areas4',
                  'formation_desired', 'areas_desired', 'areas_desired2', 'areas_desired3', 'areas_desired4', 'specialization', 'area_specialization',
                  'area_specialization2', 'area_specialization3', 'area_specialization4', 'experience', 'position_team' ,
                  'qualification', 'qualification2', 'qualification3', 'board', 'area', 'title_super','family', 'sub_familia', 'manage_team',
                  'idioma', 'idioma2', 'idioma3', 'proficiency', 'proficiency2', 'proficiency3', 'knowledge', 'information',
                  'approver', 'date_approval', 'status', 'date_conclusion', 'is_active', 'user_id']

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