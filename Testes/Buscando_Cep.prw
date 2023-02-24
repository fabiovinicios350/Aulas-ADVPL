//Bibliotecas
#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'RESTFUL.CH'

/*/
  author Fabio
  data 22/02/2023

  Descrção: Função para puxar as informações do endereço atravez de uma 
  api e preencher os campos automatico.
/*/

user function CepBuscaEndereco()
  Local oRest     := FWRest():New('https://viacep.com.br')
  Local cCep      := Alltrim(M->A1_CEP)
  Local lRetorno  := .F.
  Local cRetorno
  Local cErro
  Local jRes

  if(len((cCep))==8)
    oRest:SetPath('/ws/'+cCep+'/json')
    oRest:Get()

    jRes := JsonObject():New()

    if(oRest:Get())
      cRetorno:= oRest:GetResult()
      cErro := jRes:fromJson(cRetorno)
      
      alert(jRes)

      if (!jRes["erro"])
        M->A1_END := FwNoAccent(UPPER(jRes["logradouro"]))
        M->A1_BAIRRO := FwNoAccent(UPPER(jRes["bairro"]))
        M->A1_COMPLEM:= FwNoAccent(UPPER(jRes["complemento"]))
        M->A1_EST := UPPER(jRes["uf"])
        M->A1_IBGE := jRes["ibge"]
        M->A1_MUN := FwNoAccent(UPPER(jRes["localidade"]))
        M->A1_COD_MUN := PesquisarMunicipio(M->A1_MUN)
        M->A1_DDD := jRes["ddd"]
        lRetorno := .T.
        FwAlertSucess("<h1>All Right Passou aqui!</h1>"+CRLF+CRLF,"Cep Valido!")
      else
        FwAlertError("Cep nao <b>encontrado!</b>"+CRLF+"por favor tente novamente.","Cep Inválido")
      endif
    else
      FwAlertError("Foi identificado uma falha na comunicação com a API, por favor entrar em contato com o <b>suporte da TOTVS</b>","Falha na Comunicação com a API")
    endif
  else
    FwAlertError("O Cep precisa conter 8 digitos!","Cep Inválido")
  endif
return lRetorno 


Static Function PesquisarMunicipio(cMun)
  Local aArea       := GetArea()
  Local cAlias      := GetNextAlias()
  local cQuery      := ''
  Local cCodMun     := ''

  PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'CC2' MODULO 'CFG'

  cQuery := "Select TOP 1 CC2_CODMUN from "+RetSqlName('CC2')+" WHERE CC2_MUN='"+cMun+"'"

  TCQUERY cQuery ALIAS &(cAlias) NEW

  while &(cAlias)->(!EOF())
    cCodMun:=&(cAlias)->(CC2_CODMUN)
    &(cAlias)->(DbSkip())
  enddo
  &(cAlias)->(DbCloseArea())
  RestArea(aArea)
Return cCodMun
