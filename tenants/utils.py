
def tenant_from_request(request):
    return request.user.default_tenant.id
