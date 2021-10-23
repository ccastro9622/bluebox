from django.http import JsonResponse
from rest_framework import viewsets, status
from rest_framework.renderers import TemplateHTMLRenderer
from rest_framework.views import APIView
from rest_framework.response import Response
from api.serializers import DocumentSerializer
from descricao.models import Descricao
from descricao.views import query_documents_by_args
from descricao import models
from api import serializers


# Relatorio personalizado
class TenantDocumentViewSet(viewsets.ViewSet):
    renderer_classes = [TemplateHTMLRenderer]
    template_name = 'descricao/descricao_rel.html'

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


class DescricaoList(viewsets.ViewSet):
    # renderer_classes = [TemplateHTMLRenderer]
    # template_name = 'descricao/descricao_rel.html' # '/descricao/templates/descricao/descricao_rel.html'

    def list(self, request):
        try:
         lista_descricao = Descricao.objects.all()
         serializer = DocumentSerializer(lista_descricao, many=True)
         return Response(serializer.data)

        except Exception:
         return JsonResponse({'mensagem': "Ocorreu um erro no servidor"},
                                status=status.HTTP_500_INTERNAL_SERVER_ERROR)

