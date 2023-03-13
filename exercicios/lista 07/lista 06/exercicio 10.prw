//Biblioteca
#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

//Função para 
User Function FISA010()
  Local aParam   := PARAMIXB
  Local lRet     := .T.
  Local cIdPonto := ''

  if aParam <> NIL
    cIdPonto := aParam[2]
      
    if (cIdPonto == 'MODELPOS')
      lRet := ValCidade()
    endif
  endif
Return lRet

//Função para validar se ja existe a cidade
Static Function ValCidade()
  Local aArea     := GetArea()
  Local cAlias    := GetNextAlias()
  Local lRetorno  := .F.
  Local cQuery    := ''
  Local cMun      := M->CC2_MUN
  Local cEst      := M->CC2_EST

  cQuery := "SELECT 1 RETORNO  FROM "+RetSqlName('CC2')+" WHERE CC2_EST='"+cEst+"' AND CC2_MUN='"+cMun+"'

  //Armazenar o retorno da query
  TCQUERY cQuery ALIAS &(cAlias) NEW
  
  //Verificar se teve algum registo 
  if((&(cAlias)->(RETORNO))==1)
    lRetorno := .F.
    FwAlertError("Municipio ja existente para esse estado","Falha no cadastro")
  else
    lRetorno := .T.
  endif

  &(cAlias)->(DbCloseArea())
  RestArea(aArea)
Return lRetorno
