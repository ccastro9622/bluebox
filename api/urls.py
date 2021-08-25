from django.urls import path
from .views import *


app_name = "api"


urlpatterns = [
    path("descricao_rel/descricao", TenantDocumentViewSet.as_view({"get": "list"})),

]