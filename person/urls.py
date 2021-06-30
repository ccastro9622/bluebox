from django.urls import path
from .views import *


app_name = "person"


urlpatterns = [
    path("person_list/", PersonListView.as_view(), name="person-list"),
    path("person/create/", PersonCreateView.as_view(), name="person-create"),
    path("person/update/<int:pk>", PersonUpdateView.as_view(), name="person-update"),
    path("delete/<int:pk>", PersonDeleteView.as_view(), name="person-delete"),
]
