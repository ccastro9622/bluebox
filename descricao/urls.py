from django.urls import path
from .views import *


app_name = "descricao"


urlpatterns = [
    path("descricao_list/", DescricaoListView.as_view(), name="descricao-list"),
    path("descricao/create/", DescricaoCreateView.as_view(), name="descricao-create"),
    path("descricao/update/<int:pk>", DescricaoUpdateView.as_view(), name="descricao-update"),
    path("descricao/delete/<int:pk>", DescricaoDeleteView.as_view(), name="descricao-delete"),
    path('ajax/load-areas/', load_areas, name='ajax_load_areas'),
]