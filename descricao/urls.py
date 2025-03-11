from django.urls import path

from api.views import TenantDocumentViewSet, DescricaoList
from .views import *

app_name = "descricao"


urlpatterns = [
    path("descricao_list/", DescricaoListView.as_view(), name="descricao-list"),
    path("descricao/create/", DescricaoCreateView.as_view(), name="descricao-create"),
    path("descricao/importar_dados", ImportarDadosView.as_view(), name="descricao-create-lote"),
    path("descricao/createmodelo/<int:pk>", DescricaoModeloCreateView.as_view(), name="descricao-modelo-create"),
    path("descricao/update/<int:pk>", DescricaoUpdateView.as_view(), name="descricao-update"),
    path("descricao/delete/<int:pk>", DescricaoDeleteView.as_view(), name="descricao-delete"),
    path('ajax/load-areas/', load_areas, name='ajax_load_areas'),
    path('ajax/load-sub_familias/', load_sub_familias, name='ajax_load_sub_familias'),
    path("descricao/<int:pk>", DescricaoPdfDetailView.as_view(), name="descricao-pdf"),

    path("descricao/email/<str:title>/<str:email>", envia_email, name="descricao-email"),

    path("descricao_rel_list/", DescricaoRelListView.as_view(), name="descricao-rel-list"),
    path("descricao_pdf/<int:pk>", DescricaoPdfListView.as_view(), name="descricao-pdf-list"),
    path("descricao_excel/", export_users_csv, name="descricao-excel-list"),
    # path("descricao_rel/descricao", TenantDocumentViewSet.as_view({"get": "list"}), name="descricao-rel"),
    path("descricao-manual", mostra_pdf, name="descricao-manual"),
    path("descricao_rel/descricao", DescricaoList.as_view({"get": "list"}), name="descricao-rel"),
    path("descricaomodelo_list/", DescricaomodeloListView.as_view(), name="descricaomodelo-list"),
    # path("tenants/<int:pk>/documents/", TenantDocumentViewSet.as_view({"get": "list"})),
    # path("document/", DocumentListView.as_view(), name="document-list"),
    path("descricao_list_aprovador/", DescricaoAprovadorListView.as_view(), name="descricao-list-aprovador"),
    path("descricao/update/aprovador/<int:pk>", DescricaoAprovadorUpdateView.as_view(), name="descricao-update-aprovador"),
    path("descricao_list_aprovacao/", DescricaoAprovacaoListView.as_view(), name="descricao-list-aprovacao"),
    path("descricao/update/aprovacao/<int:pk>", DescricaoAprovacaoUpdateView.as_view(), name="descricao-update-aprovacao"),
    path("descricao_aprovacao/<int:pk>", envia_aprovacao, name="descricao-aprovacao"),
    path("descricao_reprovacao/<int:pk>", envia_reprovacao, name="descricao-reprovacao"),
    path("descricao_list_aprovacao_final/", DescricaoAprovacaoFinalListView.as_view(), name="descricao-list-aprovacao-final"),
    path("descricao/update/aprovacao_final/<int:pk>", DescricaoAprovacaoFinalUpdateView.as_view(),
         name="descricao-update-aprovacao-final"),
    path('ajax/load-ia/', load_ia, name='ajax_load_ia'),
]