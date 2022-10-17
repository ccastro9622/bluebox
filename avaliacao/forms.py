from django import forms

from tenants.models import Tenant
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
        empresa = Tenant.objects.filter(id=tenant_id).first()

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
        # self.fields['grade'].queryset = Combinacoes.objects.filter(id=0)


        # Torna o campo  readonly
        self.fields['ceo'].widget.attrs['disabled'] = 'disabled'
        # self.fields['grade'].widget.attrs['disabled'] = 'disabled'
        # self.fields['factor1'].widget.attrs['disabled'] = 'disabled'
        # self.fields['factor2'].widget.attrs['disabled'] = 'disabled'
        # self.fields['factor3'].widget.attrs['disabled'] = 'disabled'
        # self.fields['factor4'].widget.attrs['disabled'] = 'disabled'
        # self.fields['factor5'].widget.attrs['disabled'] = 'disabled'
        # self.fields['factor6'].widget.attrs['disabled'] = 'disabled'
        # self.fields['factor7'].widget.attrs['disabled'] = 'disabled'
        # self.fields['factor8'].widget.attrs['disabled'] = 'disabled'

        avaliacao = Avaliacao.objects.filter(tenant_id=tenant_id, ceo=True).first()
        #Não é o primeiro cargo a ser avaliado.
        if avaliacao:
            self.fields['ceo'].initial = False
            self.fields['level1'].queryset = Niveis.objects.filter(factor_id=1).order_by('code')
            self.fields['level2'].queryset = Niveis.objects.filter(factor_id=2).order_by('code')
            self.fields['level3'].queryset = Niveis.objects.filter(factor_id=3).order_by('code')
            self.fields['level4'].queryset = Niveis.objects.filter(factor_id=4).order_by('code')
            self.fields['level5'].queryset = Niveis.objects.filter(factor_id=5).order_by('code')
            self.fields['level6'].queryset = Niveis.objects.filter(factor_id=6).order_by('code')
            self.fields['level7'].queryset = Niveis.objects.filter(factor_id=7).order_by('code')
            self.fields['level8'].queryset = Niveis.objects.filter(factor_id=8).order_by('code')
        else:
            self.fields['ceo'].initial = True
            self.fields['title_super'].widget.attrs['disabled'] = 'disabled' # Torna o campo ceo readonly

            if empresa.size_id == 1 or empresa.size_id == 2:
                self.fields['level1'].queryset = Niveis.objects.filter(factor_id=1, code__in=[10]).order_by('code')
            elif empresa.size_id == 3:
                self.fields['level1'].queryset = Niveis.objects.filter(factor_id=1, code__in=[10, 11]).order_by('code')
            elif empresa.size_id == 4:
                self.fields['level1'].queryset = Niveis.objects.filter(factor_id=1, code__in=[11]).order_by('code')
            elif empresa.size_id == 5:
                self.fields['level1'].queryset = Niveis.objects.filter(factor_id=1, code__in=[11, 12]).order_by('code')
            elif empresa.size_id == 6:
                self.fields['level1'].queryset = Niveis.objects.filter(factor_id=1, code__in=[12]).order_by('code')
            elif empresa.size_id == 7:
                self.fields['level1'].queryset = Niveis.objects.filter(factor_id=1, code__in=[12, 13]).order_by('code')
            elif empresa.size_id == 8:
                self.fields['level1'].queryset = Niveis.objects.filter(factor_id=1, code__in=[13]).order_by('code')
            elif empresa.size_id == 9:
                self.fields['level1'].queryset = Niveis.objects.filter(factor_id=1, code__in=[13, 14]).order_by('code')
            elif empresa.size_id == 10:
                self.fields['level1'].queryset = Niveis.objects.filter(factor_id=1, code__in=[14]).order_by('code')
            elif empresa.size_id == 11:
                self.fields['level1'].queryset = Niveis.objects.filter(factor_id=1, code__in=[14, 15]).order_by('code')
            elif empresa.size_id == 12:
                self.fields['level1'].queryset = Niveis.objects.filter(factor_id=1, code__in=[15]).order_by('code')

            self.fields['level2'].queryset = Niveis.objects.filter(factor_id=2, code__in=[4]).order_by('code')
            self.fields['level3'].queryset = Niveis.objects.filter(factor_id=3, code__in=[11, 12]).order_by('code')

            if empresa.core_id == 1 or empresa.core_id == 2:
                self.fields['level4'].queryset = Niveis.objects.filter(factor_id=4, code__in=[7]).order_by('code')
            else:
                self.fields['level4'].queryset = Niveis.objects.filter(factor_id=4, code__in=[8]).order_by('code')

            self.fields['level5'].queryset = Niveis.objects.filter(factor_id=5, code__in=[6]).order_by('code')

            if empresa.governanca_id == 1:
                self.fields['level6'].queryset = Niveis.objects.filter(factor_id=6, code__in=[6]).order_by('code')
            else:
                self.fields['level6'].queryset = Niveis.objects.filter(factor_id=6, code__in=[5]).order_by('code')

            self.fields['level7'].queryset = Niveis.objects.filter(factor_id=7, code__in=[2, 3]).order_by('code')
            self.fields['level8'].queryset = Niveis.objects.filter(factor_id=8, code__in=[3]).order_by('code')

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
        empresa = Tenant.objects.filter(id=tenant_id).first()

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

        # Torna o campo  readonly
        self.fields['ceo'].widget.attrs['disabled'] = 'disabled'
        # self.fields['grade'].widget.attrs['disabled'] = 'disabled'
        # self.fields['factor1'].widget.attrs['disabled'] = 'disabled'
        # self.fields['factor2'].widget.attrs['disabled'] = 'disabled'
        # self.fields['factor3'].widget.attrs['disabled'] = 'disabled'
        # self.fields['factor4'].widget.attrs['disabled'] = 'disabled'
        # self.fields['factor5'].widget.attrs['disabled'] = 'disabled'
        # self.fields['factor6'].widget.attrs['disabled'] = 'disabled'
        # self.fields['factor7'].widget.attrs['disabled'] = 'disabled'
        # self.fields['factor8'].widget.attrs['disabled'] = 'disabled'

        avaliacao = Avaliacao.objects.filter(tenant_id=tenant_id, ceo=True).first()
        #Não é o primeiro cargo a ser avaliado.
        if avaliacao:
            self.fields['ceo'].initial = False
            self.fields['level1'].queryset = Niveis.objects.filter(factor_id=1).order_by('code')
            self.fields['level2'].queryset = Niveis.objects.filter(factor_id=2).order_by('code')
            self.fields['level3'].queryset = Niveis.objects.filter(factor_id=3).order_by('code')
            self.fields['level4'].queryset = Niveis.objects.filter(factor_id=4).order_by('code')
            self.fields['level5'].queryset = Niveis.objects.filter(factor_id=5).order_by('code')
            self.fields['level6'].queryset = Niveis.objects.filter(factor_id=6).order_by('code')
            self.fields['level7'].queryset = Niveis.objects.filter(factor_id=7).order_by('code')
            self.fields['level8'].queryset = Niveis.objects.filter(factor_id=8).order_by('code')
        else:
            self.fields['ceo'].initial = True
            self.fields['title_super'].widget.attrs['disabled'] = 'disabled' # Torna o campo ceo readonly

            if empresa.size_id == 1 or empresa.size_id == 2:
                self.fields['level1'].queryset = Niveis.objects.filter(factor_id=1, code__in=[10]).order_by('code')
            elif empresa.size_id == 3:
                self.fields['level1'].queryset = Niveis.objects.filter(factor_id=1, code__in=[10, 11]).order_by('code')
            elif empresa.size_id == 4:
                self.fields['level1'].queryset = Niveis.objects.filter(factor_id=1, code__in=[11]).order_by('code')
            elif empresa.size_id == 5:
                self.fields['level1'].queryset = Niveis.objects.filter(factor_id=1, code__in=[11, 12]).order_by('code')
            elif empresa.size_id == 6:
                self.fields['level1'].queryset = Niveis.objects.filter(factor_id=1, code__in=[12]).order_by('code')
            elif empresa.size_id == 7:
                self.fields['level1'].queryset = Niveis.objects.filter(factor_id=1, code__in=[12, 13]).order_by('code')
            elif empresa.size_id == 8:
                self.fields['level1'].queryset = Niveis.objects.filter(factor_id=1, code__in=[13]).order_by('code')
            elif empresa.size_id == 9:
                self.fields['level1'].queryset = Niveis.objects.filter(factor_id=1, code__in=[13, 14]).order_by('code')
            elif empresa.size_id == 10:
                self.fields['level1'].queryset = Niveis.objects.filter(factor_id=1, code__in=[14]).order_by('code')
            elif empresa.size_id == 11:
                self.fields['level1'].queryset = Niveis.objects.filter(factor_id=1, code__in=[14, 15]).order_by('code')
            elif empresa.size_id == 12:
                self.fields['level1'].queryset = Niveis.objects.filter(factor_id=1, code__in=[15]).order_by('code')

            self.fields['level2'].queryset = Niveis.objects.filter(factor_id=2, code__in=[4]).order_by('code')
            self.fields['level3'].queryset = Niveis.objects.filter(factor_id=3, code__in=[11, 12]).order_by('code')

            if empresa.core_id == 1 or empresa.core_id == 2:
                self.fields['level4'].queryset = Niveis.objects.filter(factor_id=4, code__in=[7]).order_by('code')
            else:
                self.fields['level4'].queryset = Niveis.objects.filter(factor_id=4, code__in=[8]).order_by('code')

            self.fields['level5'].queryset = Niveis.objects.filter(factor_id=5, code__in=[6]).order_by('code')

            if empresa.governanca_id == 1:
                self.fields['level6'].queryset = Niveis.objects.filter(factor_id=6, code__in=[6]).order_by('code')
            else:
                self.fields['level6'].queryset = Niveis.objects.filter(factor_id=6, code__in=[5]).order_by('code')

            self.fields['level7'].queryset = Niveis.objects.filter(factor_id=7, code__in=[2, 3]).order_by('code')
            self.fields['level8'].queryset = Niveis.objects.filter(factor_id=8, code__in=[3]).order_by('code')


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