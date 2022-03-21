from django import forms

from user_account.models import CustomUser
from .models import *


class AvaliacaoForm(forms.ModelForm):

    # #Verifica se o campo aprovador foi marcado quando status = a em aprovação e aprovado.
    # def clean_approver(self):
    #     status = int(self.data.get('status'))
    #     approver = self.cleaned_data['approver']
    #     if status ==2:
    #         if not approver:
    #             raise forms.ValidationError('O campo Arovador é obrigatório para o Status: Em Aprovação')
    #     return approver



    class Meta:
        model = Avaliacao
        fields = ['title', 'manage_team', 'formation', 'board', 'area', 'family', 'sub_familia', 'title_super', 'origin',
                  'company', 'governanca', 'size', 'ceo', 'factor1',
                  'level1', 'factor2', 'level2', 'factor3','level3', 'factor4', 'level4',
                  'factor5', 'level5', 'factor6', 'level6', 'factor7', 'level7',
                  'factor8', 'level8', 'ceo', 'point', 'grade']

        title_super = forms.ModelChoiceField(queryset=Avaliacao.objects.all())

    # Filtrar a dropdow
    def __init__(self, *args, **kwargs):
        tenant_id = kwargs.pop('tenant_id', None)
        super().__init__(*args, **kwargs)
        self.fields['board'].queryset = Diretoria.objects.filter(tenant_id=tenant_id)
        self.fields['area'].queryset = Area.objects.none()
        self.fields['sub_familia'].queryset = SubFamilias.objects.none()
        # self.fields['title_super'].queryset = Avaliacao.objects.filter(tenant_id=tenant_id)

        self.fields['factor1'].queryset = Fatores.objects.filter(id=1)
        self.fields['factor2'].queryset = Fatores.objects.filter(id=2)
        self.fields['factor3'].queryset = Fatores.objects.filter(id=3)
        self.fields['factor4'].queryset = Fatores.objects.filter(id=4)
        self.fields['factor5'].queryset = Fatores.objects.filter(id=5)
        self.fields['factor6'].queryset = Fatores.objects.filter(id=6)
        self.fields['factor7'].queryset = Fatores.objects.filter(id=7)
        self.fields['factor8'].queryset = Fatores.objects.filter(id=8)

        self.fields['level1'].queryset = Niveis.objects.filter(factor_id=1)
        self.fields['level2'].queryset = Niveis.objects.filter(factor_id=2)
        self.fields['level3'].queryset = Niveis.objects.filter(factor_id=3)
        self.fields['level4'].queryset = Niveis.objects.filter(factor_id=4)
        self.fields['level5'].queryset = Niveis.objects.filter(factor_id=5)
        self.fields['level6'].queryset = Niveis.objects.filter(factor_id=6)
        self.fields['level7'].queryset = Niveis.objects.filter(factor_id=7)
        self.fields['level8'].queryset = Niveis.objects.filter(factor_id=8)




# Filtra a area pela diretoria
        if 'board' in self.data:
            try:
                board_id = int(self.data.get('board'))
                self.fields['area'].queryset = Area.objects.filter(board_id=board_id).order_by('name')
            except (ValueError, TypeError):
                pass  # invalid input from the client; ignore and fallback to empty City queryset
        elif self.instance.id:
            board_id = Avaliacao.objects.filter(id=self.instance.id).first()
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
            family_id = Avaliacao.objects.filter(id=self.instance.id).first()
            if family_id:
                self.fields['sub_familia'].queryset = SubFamilias.objects.filter(family_id=family_id.family_id).order_by('name')


class AvaliacaoModeloForm(forms.ModelForm):

    # #Verifica se o campo aprovador foi marcado quando status = a em aprovação e aprovado.
    # def clean_approver(self):
    #     status = int(self.data.get('status'))
    #     approver = self.cleaned_data['approver']
    #     if status ==2:
    #         if not approver:
    #             raise forms.ValidationError('O campo Arovador é obrigatório para o Status: Em Aprovação')
    #     return approver



    class Meta:
        model = Avaliacao
        fields = ['title', 'manage_team', 'formation', 'board', 'area', 'family', 'sub_familia', 'title_super', 'origin',
                  'company', 'governanca', 'size', 'ceo', 'factor1',
                  'level1', 'factor2', 'level2', 'factor3','level3', 'factor4', 'level4',
                  'factor5', 'level5', 'factor6', 'level6', 'factor7', 'level7',
                  'factor8', 'level8', 'ceo', 'point', 'grade']

    # Filtrar a dropdow
    def __init__(self, *args, **kwargs):
        tenant_id = kwargs.pop('tenant_id', None)
        initial_arguments = kwargs.get('initial', None)
        updated_initial = initial_arguments
        formation = str(initial_arguments['formation'])
        manage = str(initial_arguments['manage_team'])
        kwargs.update(initial=updated_initial)
        super().__init__(*args, **kwargs)
        self.fields['board'].queryset = Diretoria.objects.filter(tenant_id=tenant_id)
        # self.fields['area'].queryset = Area.objects.none()
        # self.fields['sub_familia'].queryset = SubFamilias.objects.none()

        self.fields['factor1'].queryset = Fatores.objects.filter(id=1)
        self.fields['factor2'].queryset = Fatores.objects.filter(id=2)
        self.fields['factor3'].queryset = Fatores.objects.filter(id=3)
        self.fields['factor4'].queryset = Fatores.objects.filter(id=4)
        self.fields['factor5'].queryset = Fatores.objects.filter(id=5)
        self.fields['factor6'].queryset = Fatores.objects.filter(id=6)
        self.fields['factor7'].queryset = Fatores.objects.filter(id=7)
        self.fields['factor8'].queryset = Fatores.objects.filter(id=8)

        self.fields['level1'].queryset = Niveis.objects.filter(factor_id=1) # , name=formation[5:])
        self.fields['level2'].queryset = Niveis.objects.filter(factor_id=2)
        self.fields['level3'].queryset = Niveis.objects.filter(factor_id=3)
        self.fields['level4'].queryset = Niveis.objects.filter(factor_id=4)
        self.fields['level5'].queryset = Niveis.objects.filter(factor_id=5)
        self.fields['level6'].queryset = Niveis.objects.filter(factor_id=6)

        if manage == 'Não tem Equipe':
            self.fields['level7'].queryset = Niveis.objects.filter(factor_id=7, code=1)
        elif manage == 'Tem Equipe':
            self.fields['level7'].queryset = Niveis.objects.filter(factor_id=7, code__in=(2,3,4))
        else:
            self.fields['level7'].queryset = Niveis.objects.filter(factor_id=7)

        if manage == 'Não tem Equipe':
            self.fields['level8'].queryset = Niveis.objects.filter(factor_id=8, code__in=(1, 2, 3))
        elif manage == 'Tem Equipe':
            self.fields['level8'].queryset = Niveis.objects.filter(factor_id=8, code=3)
        else:
            self.fields['level8'].queryset = Niveis.objects.filter(factor_id=8)


# Filtra a area pela diretoria
        if 'board' in self.data:
            try:
                board_id = int(self.data.get('board'))
                self.fields['area'].queryset = Area.objects.filter(board_id=board_id).order_by('name')
            except (ValueError, TypeError):
                pass  # invalid input from the client; ignore and fallback to empty City queryset
        elif self.instance.id:
            board_id = Avaliacao.objects.filter(id=self.instance.id).first()
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
            family_id = Avaliacao.objects.filter(id=self.instance.id).first()
            if family_id:
                self.fields['sub_familia'].queryset = SubFamilias.objects.filter(family_id=family_id.family_id).order_by('name')