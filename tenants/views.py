from django.urls import reverse_lazy
from django.views.generic import DeleteView, CreateView, UpdateView, RedirectView
from django.views.generic.detail import DetailView
from django.views.generic.list import ListView
from django.contrib.auth.mixins import LoginRequiredMixin

from .models import Tenant
from .utils import tenant_from_request


class TenantDetailView(LoginRequiredMixin, DetailView):
    model = Tenant
    context_object_name = "tenant"


class TenantListView(LoginRequiredMixin, ListView):
    model = Tenant
    context_object_name = "tenant"

    def get_queryset(self):
        tenant_id = tenant_from_request(self.request)
        return super().get_queryset().filter(id=tenant_id).all()


class TenantDeleteView(LoginRequiredMixin, DeleteView):
    model = Tenant
    context_object_name = "tenant"
    success_url = reverse_lazy("tenants:tenant-list")


class TenantCreateView(LoginRequiredMixin, CreateView):
    model = Tenant
    fields = ['name', 'cnpj', 'phone', 'address', 'number', 'complement', 'states', 'city', 'sector',
              'employees', 'outsource','origin', 'company', 'governanca', 'size', 'core']  # preencher todos os da views.py
    success_url = reverse_lazy("tenants:tenant-list")


class TenantUpdateView(LoginRequiredMixin, UpdateView):
    model = Tenant
    fields = ['name', 'cnpj', 'phone', 'address', 'number', 'complement', 'states', 'city', 'sector',
              'employees', 'outsource', 'origin', 'company', 'governanca', 'size', 'core' ]  # preencher todos os da views.py

    # def get_queryset(self):
    #     tenant_id = tenant_from_request(self.request)
    #     return super().get_queryset().filter(id=tenant_id).all()

    success_url = reverse_lazy("tenants:tenant-list")


class RedirectSomewhere(RedirectView):
    def get_redirect_url(self, param):
        tenant_id = tenant_from_request(self.request)
        return reverse_lazy('tenant-update',
                            kwargs={'param': tenant_id},
                            current_app='bluebox')

# def alterar_empresa(request):
#     tenant_id = tenant_from_request(request)
#     reverse_lazy(href="{% url 'tenants:tenant-update' tenant_id %}")
#     # href = "{% url 'tenants:tenant-update' tenants.id %}
#     # return render(request, 'user_account/customuser_add.html', {'form_usuario': form_usuario})
#     # href="{% url 'tenants:tenant-update' tenants.id %}
