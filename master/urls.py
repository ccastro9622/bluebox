from django.urls import path
from .views import *


app_name = "master"


urlpatterns = [
    path("diretoria_list/", DiretoriaListView.as_view(), name="diretoria-list"),
    path("diretoria/create/", DiretoriaCreateView.as_view(), name="diretoria-create"),
    path("diretoria/update/<int:pk>", DiretoriaUpdateView.as_view(), name="diretoria-update"),
    path("diretoria/delete/<int:pk>", DiretoriaDeleteView.as_view(), name="diretoria-delete"),
    path("area_list/", AreaListView.as_view(), name="area-list"),
    path("area/create/", AreaCreateView.as_view(), name="area-create"),
    path("area/update/<int:pk>", AreaUpdateView.as_view(), name="area-update"),
    path("area/delete/<int:pk>", AreaDeleteView.as_view(), name="area-delete"),
]
