from rest_framework import serializers

# from billing.models import Plan
from descricao.models import Descricao
# from interview.models import Interview
# from school.models import School
# from tenant.models import Tenant, TenantGedData, ESignatureApp, ESignatureAppSignerKey


class DocumentSerializer(serializers.ModelSerializer):
    # interview_name = serializers.SerializerMethodField()
    # school_name = serializers.SerializerMethodField()

    class Meta:
        model = Descricao
        ref_name = "Descricao v1"
        fields = "_all_"

    # def get_interview_name(self, obj):
    #     return obj.interview.name if obj.interview else ''
    #
    # def get_school_name(self, obj):
    #     return obj.school.name if obj.school else ''