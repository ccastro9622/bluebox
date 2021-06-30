from django.urls import path
from .views import *


app_name = "user_account"


urlpatterns = [
    path("customuser_list/", CustomuserListView.as_view(), name="customuser-list"),
    path("customuser/create/", CustomuserCreateView.as_view(), name="customuser-create"),
    path("customuser/update/<int:pk>", CustomuserUpdateView.as_view(), name="customuser-update"),
    path("delete/<int:pk>", CustomuserDeleteView.as_view(), name="customuser-delete"),
]

