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


User Function Ex14List04()
  Local oDlg
  Local cTituloDlg    := 'Pesquisa de pedido venda'
  Local cCodigo       :=space(25)
  Private cDescricao  := ''
  Private cValor      := ''

  PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SB1' MODULO 'COM'

  FwAlertInfo(cTITULO,"Bem vindo!")

  DEFINE MSDIALOG oDlg TITLE cTituloDlg FROM 000, 000 to 190, 180 PIXEL

  @ 14, 10 SAY "Selecione um Produto: " SIZE 70, 07 OF oDlg PIXEL
  @ 22, 10 MSGET cCodigo F3 "SB1" SIZE 70, 11 OF oDlg PIXEL HASBUTTON
  @ 45,010 BUTTON "Pesquisar" SIZE 30, 15 ACTION (Resultado(cCodigo)) PIXEL OF oDlg 
  @ 45,050 BUTTON "Sair" SIZE 30, 15 ACTION (oDlg:End()) PIXEL OF oDlg 

  ACTIVATE MSDIALOG  oDlg CENTERED

Return 

Static Function Resultado(cCodigo)
  Local aArea       := GetArea()
  Local cAlias      := GetNextAlias()
  local cQuery      := ''
  Local cMensagem   := '' 
  Local cPedido

  alert(cCodigo)

  PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SC6' MODULO 'COM'

    cQuery := "Select C6_NUM from "+RetSqlName('SC6')+" where C6_PRODUTO= '"+cCodigo+"'"

    TCQUERY cQuery ALIAS &(cAlias) NEW

    while &(cAlias)->(!EOF())
      cPedido:= &(cAlias)->(C6_NUM)
      cMensagem += cPedido+', '+CRLF
      &(cAlias)->(DbSkip())
    enddo

    if(cMensagem=='')
      fwAlertError("Nao existe venda para esse produto",'Retorno')
    else
      fwAlertSuccess(cMensagem,'Retorno')
    endif

  &(cAlias)->(DbCloseArea())
  RestArea(aArea)
return
