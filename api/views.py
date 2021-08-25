from rest_framework import viewsets, status
from rest_framework.response import Response
from api.serializers import DocumentSerializer
from descricao.views import query_documents_by_args


# Relatorio personalizado
class TenantDocumentViewSet(viewsets.ViewSet):
    template_name = '../descricao/templates/descricao/descricao_rel.html'

    def list(self, request):
        try:
            document = query_documents_by_args(1, **request.query_params)

            serializer = DocumentSerializer(document['items'], many=True)
            result = dict()
            result['data'] = serializer.data
            result['draw'] = document['draw']
            result['recordsTotal'] = document['total']
            result['recordsFiltered'] = document['count']
            return Response(result, status=status.HTTP_200_OK)

        except Exception as e:
            return Response(str(e))
