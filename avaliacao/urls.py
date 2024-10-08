from django.urls import path

from api.views import TenantDocumentViewSet, DescricaoList
from .views import *

app_name = "avaliacao"


urlpatterns = [
    path("avaliacao_list/", AvaliacaoListView.as_view(), name="avaliacao-list"),
    path("avaliacao/create/", AvaliacaoCreateView.as_view(), name="avaliacao-create"),
    path("avaliacao/createmodelo/<int:pk>", AvaliacaoModeloCreateView.as_view(), name="avaliacao-modelo-create"),
    path("avaliacao/update/<int:pk>", AvaliacaoUpdateView.as_view(), name="avaliacao-update"),
    path("avaliacao/delete/<int:pk>", AvaliacaoDeleteView.as_view(), name="avaliacao-delete"),
    path('ajax/load-areas/', load_areas, name='ajax_load_areas'),
    path('ajax/load-sub_familias/', load_sub_familias, name='ajax_load_sub_familias'),
    path('ajax/load1-levels1/', load1_levels1, name='ajax_load1_levels1'),
    path('ajax/load1-levels2/', load1_levels2, name='ajax_load1_levels2'),
    path('ajax/load1-levels3/', load1_levels3, name='ajax_load1_levels3'),
    path('ajax/load1-levels5/', load1_levels5, name='ajax_load1_levels5'),
    path('ajax/load1-levels7/', load1_levels7, name='ajax_load1_levels7'),
    path('ajax/load1-levels8/', load1_levels8, name='ajax_load1_levels8'),
    path('ajax/load-levels1/', load_levels1, name='ajax_load_levels1'),
    path('ajax/load-levels2/', load_levels2, name='ajax_load_levels2'),
    path('ajax/load-levels3/', load_levels3, name='ajax_load_levels3'),
    path('ajax/load-levels4/', load_levels4, name='ajax_load_levels4'),
    path('ajax/load-levels5/', load_levels5, name='ajax_load_levels5'),
    path('ajax/load-levels6/', load_levels6, name='ajax_load_levels6'),
    path('ajax/load-levels7/', load_levels7, name='ajax_load_levels7'),
    path('ajax/load-levels8/', load_levels8, name='ajax_load_levels8'),
    path('ajax/load-grade/', load_grade, name='ajax_load_grade'),
    path('ajax/load-detalhe/', load_detalhe, name='ajax_load_detalhe'),
    path('ajax/load-alteracao/', load_alteracao, name='ajax_load_alteracao'),
    path('ajax/load-exclusao/', load_exclusao, name='ajax_load_exclusao'),
    path("avaliacao-manual", mostra_pdf, name="avaliacao-manual"),
    path("avaliacao_rel_list/", AvaliacaoRelListView.as_view(), name="avaliacao-rel-list"),
    path("avaliacao_pdf/<int:pk>", AvaliacaoPdfListView.as_view(), name="avaliacao-pdf-list"),
    path("avaliacao_excel/", export_users_csv, name="avaliacao-excel-list"),
    path("avaliacao_excel/matriz", export_matriz_csv, name="avaliacao-excel-matriz"),
    path("avaliacao_rel_list_matriz/", AvaliacaoRelMatrizListView.as_view(), name="avaliacao-rel-list-matriz"),
    path("avaliacao_rel_list_hierarquica/", AvaliacaoRelHierarquicaListView.as_view(),
         name="avaliacao-rel-list-hierarquica"),

    path("avaliacao/<int:pk>", AvaliacaoPdfDetailView.as_view(), name="avaliacao-pdf"),


]