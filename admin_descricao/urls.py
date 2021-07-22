from django.urls import path
from .views import *


app_name = "admin_descricao"

urlpatterns = [
    path("admin_descricao_list/", DescricoesListView.as_view(), name="admin_descricao-list"),
    path("admin_descricao/<int:pk>", DescricoesDetailView.as_view(), name="admin_descricao-detail"),
]
