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

        id = kwargs.pop('id', None)

        super().__init__(*args, **kwargs)
        self.fields['board'].queryset = Diretoria.objects.filter(tenant_id=tenant_id)
        self.fields['area'].queryset = Area.objects.none()
        self.fields['sub_familia'].queryset = SubFamilias.objects.none()
        self.fields['title_super'].queryset = Superior.objects.filter(tenant_id=tenant_id)

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
        self.fields['factor1'].widget.attrs['disabled'] = 'disabled'
        self.fields['factor2'].widget.attrs['disabled'] = 'disabled'
        self.fields['factor3'].widget.attrs['disabled'] = 'disabled'
        self.fields['factor4'].widget.attrs['disabled'] = 'disabled'
        self.fields['factor5'].widget.attrs['disabled'] = 'disabled'
        self.fields['factor6'].widget.attrs['disabled'] = 'disabled'
        self.fields['factor7'].widget.attrs['disabled'] = 'disabled'
        self.fields['factor8'].widget.attrs['disabled'] = 'disabled'

        avaliacao_ceo = Avaliacao.objects.filter(tenant_id=tenant_id, ceo=True).first()
        #Não é o primeiro cargo a ser avaliado.
        self.fields['ceo'].initial = False

        id = self.instance.id

        if avaliacao_ceo and avaliacao_ceo.id != id: # Ja existe ceo então este naõ pode ser ceo e tb não pode entrar se for atualização do ceo
            if not id: #inclusao
                self.fields['ceo'].initial = False
                self.fields['level1'].queryset = Niveis.objects.filter(factor_id=1).order_by('code')
                self.fields['level2'].queryset = Niveis.objects.filter(factor_id=2).order_by('code')
                self.fields['level3'].queryset = Niveis.objects.filter(factor_id=3).order_by('code')
                self.fields['level4'].queryset = Niveis.objects.filter(factor_id=4).order_by('code')
                self.fields['level5'].queryset = Niveis.objects.filter(factor_id=5).order_by('code')
                self.fields['level6'].queryset = Niveis.objects.filter(factor_id=6).order_by('code')
                self.fields['level7'].queryset = Niveis.objects.filter(factor_id=7).order_by('code')
                self.fields['level8'].queryset = Niveis.objects.filter(factor_id=8).order_by('code')
            else: #alteração
                # self.fields['level1'].queryset = Niveis.objects.filter(factor_id=1, code__lte=(3)).order_by('code')

                super_id = self.instance.title_super_id
                superior = Superior.objects.filter(id=super_id).first()
                avaliacao_superior = Avaliacao.objects.filter(id=superior.evaluation_id).first()

                self.fields['level1'].queryset = Niveis.objects.filter(factor_id=1).order_by('code')


                conhecimento_super = int(avaliacao_superior.level2_id)

# Filtra o conhecimento.
                level1_id = self.instance.level1_id
                if level1_id == 1:
                    self.fields['level2'].queryset = Niveis.objects.filter(factor_id=2, code__in=[1, 2, 3, 4, 5],
                                                   code__lte=(conhecimento_super - 5)).order_by('code')
                elif level1_id == 2:
                    self.fields['level2'].queryset = Niveis.objects.filter(factor_id=2, code__in=[6, 7, 8, 9, 10],
                                                   code__lte=(conhecimento_super - 5)).order_by('code')
                elif level1_id == 3:
                    self.fields['level2'].queryset = Niveis.objects.filter(factor_id=2, code__in=[9, 10, 11, 12],
                                                   code__lte=(conhecimento_super - 5)).order_by('code')
                else:
                    self.fields['level2'].queryset = Niveis.objects.filter(factor_id=2, code__in=[10, 11, 12],
                                                   code__lte=(conhecimento_super - 5)).order_by('code')

# Filtra o Escopo.
                level2_id = self.instance.level2_id
                escopo_super = int(avaliacao_superior.level3_id)

                # Monta o escopo maximo de acordo com o escopo do gestor - slide 14
                if escopo_super == 27 or escopo_super == 28:
                    escopo = 9
                elif escopo_super == 26:
                    escopo = 8
                elif escopo_super == 25:
                    escopo = 7
                elif escopo_super == 24:
                    escopo = 6
                elif escopo_super == 23:
                    escopo = 5
                elif escopo_super == 22:
                    escopo = 4
                elif escopo_super == 21:
                    escopo = 3
                elif escopo_super == 20:
                    escopo = 2
                elif escopo_super == 19:
                    escopo = 1

                if level1_id == 1:
                    if level2_id <= 6:
                        self.fields['level3'].queryset = Niveis.objects.filter(factor_id=3, code__in=[1, 2],
                                                    code__lte=escopo).order_by('code')
                    else:
                        self.fields['level3'].queryset = Niveis.objects.filter(factor_id=3, code__in=[3, 4],
                                                    code__lte=escopo).order_by('id')
                elif level1_id == 2:
                    if level2_id == 10:
                        self.fields['level3'].queryset = Niveis.objects.filter(factor_id=3, code=5,
                                                    code__lte=escopo).order_by('id')
                    else:
                        self.fields['level3'].queryset = Niveis.objects.filter(factor_id=3, code__in=[5, 6],
                                                    code__lte=escopo).order_by('id')
                elif level1_id == 3:
                    if level2_id == 13:
                        self.fields['level3'].queryset = Niveis.objects.filter(factor_id=3, code__in=[7, 8], code__lte=escopo).order_by('id')
                    else:
                        self.fields['level3'].queryset = Niveis.objects.filter(factor_id=3, code=7, code__lte=escopo).order_by('id')
                else:
                    self.fields['level3'].queryset = Niveis.objects.filter(factor_id=3, code__in=[8, 9], code__lte=escopo).order_by('id')

#Filtra Abrangencia

            level3_id = self.instance.level3_id

            if level3_id <= 20:
                self.fields['level4'].queryset = Niveis.objects.filter(factor_id=4, code__in=[1]).order_by('id')
            elif level3_id <= 25:
                self.fields['level4'].queryset = Niveis.objects.filter(factor_id=4, code__in=[2, 3, 4]).order_by('id')
            else:
                self.fields['level4'].queryset = Niveis.objects.filter(factor_id=4, code__in=[5, 6]).order_by('id')
#Filtra Contribuição

            level4_id = self.instance.level4_id

            if level3_id <= 20:
                self.fields['level5'].queryset = Niveis.objects.filter(factor_id=5, code__in=[1]).order_by('id')
            elif level3_id <= 23:
                if level4_id <= 31:
                    self.fields['level5'].queryset = Niveis.objects.filter(factor_id=5, code=2).order_by('id')
                else:
                    self.fields['level5'].queryset = Niveis.objects.filter(factor_id=5, code__in=[2, 3]).order_by('id')
            elif level3_id <= 25:
                if level4_id <= 31:
                    self.fields['level5'].queryset = Niveis.objects.filter(factor_id=5, code=4).order_by('id')
                else:
                    self.fields['level5'].queryset = Niveis.objects.filter(factor_id=5, code__in=[4, 5]).order_by('id')
            else:
                self.fields['level5'].queryset = Niveis.objects.filter(factor_id=5, code__in=[4, 5]).order_by('id')

#Filtra a Gestão recebida

            if level3_id <= 19:
                self.fields['level6'].queryset = Niveis.objects.filter(factor_id=6, code=1).order_by('id')
            elif level3_id <= 21:
                self.fields['level6'].queryset = Niveis.objects.filter(factor_id=6, code=2).order_by('id')
            elif level3_id == 22:
                self.fields['level6'].queryset = Niveis.objects.filter(factor_id=6, code=3).order_by('id')
            else:
                self.fields['level6'].queryset = Niveis.objects.filter(factor_id=6, code=4).order_by('id')

#Filtra Liderança

            manage_team_id = self.instance.manage_team

            if manage_team_id == 1:  # Não tem gestao de equipe
                self.fields['level7'].queryset = Niveis.objects.filter(factor_id=7, code=1).order_by('id')
            else:
                if level3_id <= 19:
                    self.fields['level7'].queryset = Niveis.objects.filter(factor_id=7, code=1).order_by('id')
                elif level3_id <= 21:
                    self.fields['level7'].queryset = Niveis.objects.filter(factor_id=7, code=2).order_by('id')
                else:
                    self.fields['level7'].queryset = Niveis.objects.filter(factor_id=7, code__in=[2, 3]).order_by('id')

#Filtra a comunicação

            level7_id = self.instance.level7_id # Liderança

            if level7_id == 49:
                if level2_id <= 8:
                    self.fields['level8'].queryset = Niveis.objects.filter(factor_id=8, code=1).order_by('id')
                else:
                    self.fields['level8'].queryset = Niveis.objects.filter(factor_id=8, code__in=[2, 3]).order_by('id')
            else:
                self.fields['level8'].queryset = Niveis.objects.filter(factor_id=8, code=3).order_by('id')


        else:# É CEO
            self.fields['ceo'].initial = True
            self.fields['title_super'].widget.attrs['disabled'] = 'disabled' # Torna o campo ceo readonly
# Fator 2 - Conhecimento
            if empresa.size_id == 1 or empresa.size_id == 2:
                self.fields['level2'].queryset = Niveis.objects.filter(factor_id=2, code__in=[8]).order_by('code')
            elif empresa.size_id == 3 or empresa.size_id == 4:
                self.fields['level2'].queryset = Niveis.objects.filter(factor_id=2, code__in=[9]).order_by('code')
            elif empresa.size_id == 5 or empresa.size_id == 6:
                self.fields['level2'].queryset = Niveis.objects.filter(factor_id=2, code__in=[10]).order_by('code')
            elif empresa.size_id == 7 or empresa.size_id == 8:
                self.fields['level2'].queryset = Niveis.objects.filter(factor_id=2, code__in=[11]).order_by('code')
            elif empresa.size_id == 9 or empresa.size_id == 10:
                self.fields['level2'].queryset = Niveis.objects.filter(factor_id=2, code__in=[12]).order_by('code')
            elif empresa.size_id == 11 or empresa.size_id == 12:
                self.fields['level2'].queryset = Niveis.objects.filter(factor_id=2, code__in=[13]).order_by('code')

# Fator 1 - Nivel Organizacional
            self.fields['level1'].queryset = Niveis.objects.filter(factor_id=1, code__in=[4]).order_by('code')

# Fator 3 - Escopo
            self.fields['level3'].queryset = Niveis.objects.filter(factor_id=3, code__in=[10, 11]).order_by('code')

# Fator 4 - Abrangencia
            if empresa.core_id == 1 or empresa.core_id == 2:
                self.fields['level4'].queryset = Niveis.objects.filter(factor_id=4, code__in=[7]).order_by('code')
            else:
                self.fields['level4'].queryset = Niveis.objects.filter(factor_id=4, code__in=[8]).order_by('code')

# Fator 5 - Contribuição
            self.fields['level5'].queryset = Niveis.objects.filter(factor_id=5, code__in=[6]).order_by('code')

# Fator 6 - Gestão Recebida
            if empresa.governanca_id == 1:
                self.fields['level6'].queryset = Niveis.objects.filter(factor_id=6, code__in=[6]).order_by('code')
            else:
                self.fields['level6'].queryset = Niveis.objects.filter(factor_id=6, code__in=[5]).order_by('code')

# Fator 7 - Liderança
            self.fields['level7'].queryset = Niveis.objects.filter(factor_id=7, code__in=[3]).order_by('code')

# Fator 8 - Comunicação
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

        # id = Avaliacao.objects.filter(id=self.instance.id).first()
        # if id:
        #     self.fields['level1'].queryset = Niveis.objects.filter(factor_id=1, code__lte=(3)).order_by('code')



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
        # self.fields['ceo'].widget.attrs['disabled'] = 'disabled'
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
        else:# É CEO
            self.fields['ceo'].initial = True
            self.fields['title_super'].widget.attrs['disabled'] = 'disabled' # Torna o campo ceo readonly
# Fator 2 - Conhecimento
            if empresa.size_id == 1 or empresa.size_id == 2:
                self.fields['level2'].queryset = Niveis.objects.filter(factor_id=2, code__in=[8]).order_by('code')
            elif empresa.size_id == 3 or empresa.size_id == 4:
                self.fields['level2'].queryset = Niveis.objects.filter(factor_id=2, code__in=[9]).order_by('code')
            elif empresa.size_id == 5 or empresa.size_id == 6:
                self.fields['level2'].queryset = Niveis.objects.filter(factor_id=2, code__in=[10]).order_by('code')
            elif empresa.size_id == 7 or empresa.size_id == 8:
                self.fields['level2'].queryset = Niveis.objects.filter(factor_id=2, code__in=[11]).order_by('code')
            elif empresa.size_id == 9 or empresa.size_id == 10:
                self.fields['level2'].queryset = Niveis.objects.filter(factor_id=2, code__in=[12]).order_by('code')
            elif empresa.size_id == 11 or empresa.size_id == 12:
                self.fields['level2'].queryset = Niveis.objects.filter(factor_id=2, code__in=[13]).order_by('code')

# Fator 1 - Nivel Organizacional
            self.fields['level1'].queryset = Niveis.objects.filter(factor_id=1, code__in=[4]).order_by('code')

# Fator 3 - Escopo
            self.fields['level3'].queryset = Niveis.objects.filter(factor_id=3, code__in=[10, 11]).order_by('code')

# Fator 4 - Abrangencia
            if empresa.core_id == 1 or empresa.core_id == 2:
                self.fields['level4'].queryset = Niveis.objects.filter(factor_id=4, code__in=[7]).order_by('code')
            else:
                self.fields['level4'].queryset = Niveis.objects.filter(factor_id=4, code__in=[8]).order_by('code')

# Fator 5 - Contribuição
            self.fields['level5'].queryset = Niveis.objects.filter(factor_id=5, code__in=[6]).order_by('code')

# Fator 6 - Gestão Recebida
            if empresa.governanca_id == 1:
                self.fields['level6'].queryset = Niveis.objects.filter(factor_id=6, code__in=[6]).order_by('code')
            else:
                self.fields['level6'].queryset = Niveis.objects.filter(factor_id=6, code__in=[5]).order_by('code')

# Fator 7 - Liderança
            self.fields['level7'].queryset = Niveis.objects.filter(factor_id=7, code__in=[3]).order_by('code')

# Fator 8 - Comunicação
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