from django.urls import path
from .views import *

app_name = "tenants"

urlpatterns = [
    path("tenant_list/", TenantListView.as_view(), name="tenant-list"),
    path("tenant/create/", TenantCreateView.as_view(), name="tenant-create"),
    path("tenant/update/<int:pk>", TenantUpdateView.as_view(), name="tenant-update"),
    path("delete/<int:pk>", TenantDeleteView.as_view(), name="tenant-delete"),

]
