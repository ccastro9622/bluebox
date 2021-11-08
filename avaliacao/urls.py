from django.urls import path

from api.views import TenantDocumentViewSet, DescricaoList
from .views import *

app_name = "avaliacao"


urlpatterns = [
    path("descricao_list/", AvaliacaoListView.as_view(), name="avaliacao-list"),
    path("descricao/create/", AvaliacaoCreateView.as_view(), name="avaliacao-create"),
    # path("descricao/createmodelo/<int:pk>", AvaliacaoModeloCreateView.as_view(), name="avaliacao-modelo-create"),
    path("descricao/update/<int:pk>", AvaliacaoUpdateView.as_view(), name="avaliacao-update"),
    path("descricao/delete/<int:pk>", AvaliacaoDeleteView.as_view(), name="avaliacao-delete"),
]