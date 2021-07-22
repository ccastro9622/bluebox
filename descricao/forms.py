from django import forms
from .models import *
from master.models import Diretoria
from admin_descricao.models import Descricoes


class DescricaoForm(forms.ModelForm):

    class Meta:
        model = Descricao
        fields = ['title', 'cbo', 'summary', 'summary_goal', 'summary_coverage', 'responsibility', 'formation', 'areas',
                  'formation_desired', 'areas_desired', 'specialization', 'area_specialization', 'experience',
                  'qualification', 'board', 'area', 'title_super','family', 'sub_familia', 'manage_team', 'position_team',
                  'idioma', 'proficiency', 'knowledge', 'supervision', 'information', 'approver', 'date_approval']# Filtrar a dropdow

    def __init__(self, *args, **kwargs):
        tenant_id = kwargs.pop('tenant_id', None)
        cbo = kwargs.pop('cbo', None)
        super().__init__(*args, **kwargs)
        self.fields['cbo'].initial = cbo
        self.fields['board'].queryset = Diretoria.objects.filter(tenant_id=tenant_id)
        self.fields['approver'].queryset = CustomUser.objects.filter(default_tenant=tenant_id)
        self.fields['area'].queryset = Area.objects.none()

# Filtra a area pela diretoria
        if 'board' in self.data:
            try:
                board_id = int(self.data.get('board'))
                self.fields['area'].queryset = Area.objects.filter(board_id=board_id).order_by('name')
            except (ValueError, TypeError):
                pass  # invalid input from the client; ignore and fallback to empty City queryset
        elif self.instance.id:
            self.fields['area'].queryset = self.instance.board.area_set.order_by('name')
