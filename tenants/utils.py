
def tenant_from_request(request):
    return request.user.default_tenant.id


def user_from_request(request):
    return request.user


def userkind_from_request(request):
    return request.user.kind

