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
  Local oOpcao
  Local cTituloDlg    := 'Pesquisa de pedido venda'
  Local cResList      := '01'
  Local aProduto      := BuscarProdutos()
  Private cDescricao  := ''
  Private cValor      := ''


  FwAlertInfo(cTITULO,"Bem vindo!")

  DEFINE MSDIALOG oDlg TITLE cTituloDlg FROM 000, 000 to 190, 180 PIXEL

  @ 14, 10 SAY "Selecione um Produto: " SIZE 70, 07 OF oDlg PIXEL
  oOpcao  := TComboBox():New(022, 010, {|u| Iif(PCount() > 0 , cResList := SubStr(u,len(u)-6,7), cResList)}, aProduto, 70, 11, oDlg, , /*bChange*/, /*bValid*/, /*nClrText*/, /*nClrBack*/, .T.,)

  @ 45,010 BUTTON "Pesquisar" SIZE 30, 15 ACTION (Resultado(alltrim(cResList))) PIXEL OF oDlg 
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


Static Function BuscarProdutos()
  Local aArea       := GetArea()
  Local cAlias      := GetNextAlias()
  local cQuery      := ''
  local aProdutos   := {}
  Local cCodigo
  Local cDescricao


  PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SB1' MODULO 'COM'

  cQuery := "Select B1_COD, B1_DESC"+CRLF+; 
            "from "+RetSqlName('SB1')+CRLF+; 
            "order by B1_DESC desc"

  TCQUERY cQuery ALIAS &(cAlias) NEW

  while &(cAlias)->(!EOF())
    cCodigo:= &(cAlias)->(B1_COD)
    cDescricao:= &(cAlias)->(B1_DESC)
    aadd(aProdutos,Alltrim(cDescricao)+" - "+alltrim(cCodigo))
    &(cAlias)->(DbSkip())
  enddo

  &(cAlias)->(DbCloseArea())
  RestArea(aArea)
Return aProdutos

