"""bluebox URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
import django.views.static
from django.contrib import admin
from django.urls import path

from django.contrib import admin
from django.urls import path, include
from user_account.views import *
from django.contrib.auth import views as auth_views
from django.urls import re_path


admin.site.site_header = " "
admin.site.index_title = "Administração BlueBox21"
#admin.site.site_title = "BlueBox21"-->


urlpatterns = [
    path('admin/', admin.site.urls),
    path('', logar_usuario, name="logar_usuario"),
    path('logar_usuario', logar_usuario, name="logar_usuario"),
    path('index.html', index,name="index"),
    path('reset_password/', auth_views.PasswordResetView.as_view(template_name="password_reset.html"), name="reset_password"),
    path('reset_password_sent/', auth_views.PasswordResetDoneView.as_view(template_name="reset_password_set.html"), name="password_reset_done"),
    path('reset/<uidb64>/<token>', auth_views.PasswordResetConfirmView.as_view(template_name="set_password.html"), name="password_reset_confirm"),
    path('reset_password_complete/', auth_views.PasswordResetCompleteView.as_view(template_name="reset_password_complete.html"), name="password_reset_complete"),
    re_path(r"person/", include("person.urls")),
    re_path(r"customuser/", include("user_account.urls")),
    re_path(r"diretoria/", include("master.urls")),
    re_path(r"area/", include("master.urls")),
    re_path(r"tenant/", include("tenants.urls")),
    re_path(r"admin_descricao/", include("admin_descricao.urls")),
    re_path(r"descricao/", include("descricao.urls")),
    re_path(r"avaliacao/", include("avaliacao.urls")),
    re_path(r"api/", include("api.urls")),
]
