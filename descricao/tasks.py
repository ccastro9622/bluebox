import pandas as pd
from background_task import background
import requests
import json

from admin_descricao.models import Niveis
from admin_geral.models import Sector, Plans
from avaliacao.models import Avaliacao
from master.models import Diretoria, Area
from tenants.models import Tenant
from tenants.utils import tenant_from_request, user_from_request, userkind_from_request

import boto3
import io
import pandas as pd
from django.conf import settings

from descricao.models import Descricao, ProgressoTarefa
from admin_avaliacao.models import Familias, SubFamilias

@background(schedule=1)
def processar_planilha_task(file_path,last_id, sector_name, sector_id, tenant_id, user):

    progresso_obj, criado = ProgressoTarefa.objects.get_or_create(tarefa_id=1)

    s3_client = boto3.client(
        's3',
        endpoint_url='https://s3.us-west-000.backblazeb2.com',
        aws_access_key_id=settings.AWS_ACCESS_KEY_ID,
        aws_secret_access_key=settings.AWS_SECRET_ACCESS_KEY
    )

    # Cria um buffer de bytes na memória
    response = s3_client.get_object(
        Bucket=settings.AWS_STORAGE_BUCKET_NAME,
        Key=file_path
    )

    # Lê os dados do S3 e converte para DataFrame
    file_content = response['Body'].read()
    df = pd.read_excel(io.BytesIO(file_content))  # ou pd.read_csv() para CSV

    try:
        # Lê a planilha com pandas
        # df = pd.read_excel(file_path)  # Ou pd.read_csv

        quantidade_linhas = len(df)

        # Opcional: Limpar dados nulos/inválidos
        df = df.dropna()
        i = 0

        # Cria instâncias do modelo
        for index, row in df.iterrows():

            diretoria = Diretoria.objects.get(name=row['Area'], tenant_id=tenant_id)
            id_diretoria = diretoria.id
            area = Area.objects.get(name=row['SubArea'], board_id=id_diretoria, tenant_id=tenant_id)
            id_area = area.id

            nome = row['Familia']
            nome = nome.replace("_", " ")  # Foi necessario devido a regra de validação de dados do excell
            familia = Familias.objects.filter(name=nome).first()
            id_familia = familia.id
            familia_nome = familia.name
            subfamilia = SubFamilias.objects.filter(name=row['SubFamilia'], family_id=id_familia).first()
            id_subfamilia = subfamilia.id
            subfamilia_nome = subfamilia.name

            nivel = Niveis.objects.get(name=row['Nivel'])
            id_nivel = nivel.id
            nivel_nome = nivel.name

            # IA

            url = "https://neogem-bluebox-716723353548.us-east1.run.app/pesquisar_cargo_api"

            payload = json.dumps({
                "des_cargo": row['Titulodocargo'],
                "familia": familia_nome,
                "sub_familia": subfamilia_nome,
                "setor": sector_name,
                "nivel": nivel_nome,
                "adicional": row['Adicional']
            })
            headers = {
                'Content-Type': 'application/json'
            }

            response = requests.request("POST", url, headers=headers, data=payload)

            dadosjson = json.loads(response.text)

            missao = dadosjson.get('missao')

            responsabilidade = str(dadosjson.get('responsabilidades'))
            responsabilidades = responsabilidade.replace("[", "").replace("]", "")

            competencia = str(dadosjson.get('competencias'))
            competencias = competencia.replace("[", "").replace("]", "")

            equipe = str(dadosjson.get('equipe'))
            equipe = int(equipe.replace("{'codigo': ", "").replace("}", ""))

            if equipe is None:
                equipe = 1

            escolaridade = str(dadosjson.get('escolaridade'))
            escolaridade = int(escolaridade.replace("{'codigo': ", "").replace("}", ""))

            complementar = dadosjson.get('formacao')

            experiencia = str(dadosjson.get('experiencia'))
            experiencia = int(experiencia.replace("{'codigo': ", "").replace("}", ""))

            if experiencia is None:
                experiencia = 1

            area_formacao = 1  # str(dadosjson.get('area1'))
            # area_formacao = int(area_formacao.replace("{'codigo': ", "").replace("}", ""))

            habilitacao = str(dadosjson.get('habilidade'))
            habilitacao = int(habilitacao.replace("{'codigo': ", "").replace("}", ""))

            # Fim da IA -------------------------------

            last_id += 1

            created = Descricao(
                id=last_id,
                title=row['Titulodocargo'],
                area_id=id_area,
                board_id=id_diretoria,
                title_super=row['CargoSuperiorImediato'],
                family_id=id_familia,
                sub_familia_id=id_subfamilia,
                adicional=row['Adicional'],
                tenant_id=tenant_id,
                status_id=1,
                is_active=True,
                sector_id=sector_id,
                level_id=id_nivel,
                user_id_id=user,

                summary_goal=missao,  # dadosjson.get(missao),
                responsibility=responsabilidades,  # dadosjson.get(responsabilidades),
                information=competencias,  # dadosjson.get(competencias)
                manage_team_id=equipe,  # dadosjson.get(equipe)
                formation_desired_id=escolaridade,  # dadosjson.get(escolaridade)
                specialization_id=complementar,  # dadosjson.get(formacao)
                experience_id=experiencia,  # dadosjson.get(experiencia)
                areas_desired_id=area_formacao,  # dadosjson.get(area)
                qualification_id=habilitacao  # dadosjson.get(habilidade)
            )

            created.save(force_insert=True)

            percentual = int((i + 1) / quantidade_linhas * 100)
            progresso_obj.progresso = percentual
            progresso_obj.status = f"Processando {i + 1} de {quantidade_linhas}"
            progresso_obj.save()



    except Exception as e:
        print(f"Erro ao processar planilha: {e}")


    progresso_obj.progresso = 100
    progresso_obj.status = "Concluído"
    progresso_obj.save()