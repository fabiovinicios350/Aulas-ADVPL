//Biblioteca
#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'
//Constantes
#DEFINE cTITULO 'Algoritimos para puxar os pedidos de venda de um determindo produto'

/*/
  @author Fabio
  @since 27/02/2023
/*/


User Function Ex16List04()
  Local oDlg
  Local oOpcao
  Local cTituloDlg    := 'Pesquisa de pedido venda'
  Local cResList      := '01'
  Local aUF           := BuscarEstado()
  Private cDescricao  := ''
  Private cValor      := ''


  FwAlertInfo(cTITULO,"Bem vindo!")

  DEFINE MSDIALOG oDlg TITLE cTituloDlg FROM 000, 000 to 190, 180 PIXEL

  @ 14, 10 SAY "Selecione um Estado: " SIZE 70, 07 OF oDlg PIXEL
  oOpcao  := TComboBox():New(022, 010, {|u| Iif(PCount() > 0 , cResList := u, cResList)}, aUF, 70, 11, oDlg, , /*bChange*/, /*bValid*/, /*nClrText*/, /*nClrBack*/, .T.,)

  @ 45,010 BUTTON "Pesquisar" SIZE 30, 15 ACTION (Resultado(alltrim(cResList))) PIXEL OF oDlg 
  @ 45,050 BUTTON "Sair" SIZE 30, 15 ACTION (oDlg:End()) PIXEL OF oDlg 

  ACTIVATE MSDIALOG  oDlg CENTERED

Return 

Static Function Resultado(cUF)
  Local aArea       := GetArea()
  Local cAlias      := GetNextAlias()
  local cQuery      := ''
  Local cMensagem   := '' 
  Local cCliente
  Local cCodigo

  PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SA2' MODULO 'COM'

    cQuery := "Select A2_NOME, A2_COD From "+RetSqlName('SA2')+" where A2_EST='"+cUF+"'"

    TCQUERY cQuery ALIAS &(cAlias) NEW

    while &(cAlias)->(!EOF())
      cCliente:= &(cAlias)->(A2_NOME)
      cCodigo:= &(cAlias)->(A2_COD)
      cMensagem += A2_COD+cCliente+CRLF
      &(cAlias)->(DbSkip())
    enddo

    if(cMensagem=='')
      fwAlertError("Nao Existe clientes cadastrados nesse estado",'Retorno')
    else
      fwAlertSuccess(cMensagem,'Retorno')
    endif

  &(cAlias)->(DbCloseArea())
  RestArea(aArea)
return


Static Function BuscarEstado()
  Local aArea       := GetArea()
  Local cAlias      := GetNextAlias()
  local cQuery      := ''
  local aUF   := {}


  PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'CC2' MODULO 'COM'

  cQuery := "select CC2_EST from "+RetSqlName('CC2')+" group by CC2_EST

  TCQUERY cQuery ALIAS &(cAlias) NEW

  while &(cAlias)->(!EOF())
    aadd(aUF,&(cAlias)->(CC2_EST))
    &(cAlias)->(DbSkip())
  enddo

  &(cAlias)->(DbCloseArea())
  RestArea(aArea)
Return aUF

