//Bibliotecas
#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

//Constantes
#DEFINE cTITULO 'Algoritimos Buscar os produtos de um pedido de venda'


/*/
  @author Fabio
  @since ../../2023
/*/

User Function BuscaProdutoVenda()
  Local aArea       := GetArea()
  Local cAlias      := GetNextAlias()
  local cQuery      := ''
  local cMensagem   := ''
  Local cPedidoAux  := '0'
  Local cPedido     := 'PV0008'
  Local cCodigo
  Local cDescricao
  Local cQuant
  Local cUnidade
  Local cTotal

  FwAlertInfo(cTITULO,"Bem vindo!")

  PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SC7' MODULO 'COM'

  cQuery := "Select C6_PRODUTO,C6_DESCRI,C6_QTDVEN, C6_PRUNIT, C6_VALOR,C6_VALDESC"+CRLF+;
            "from SC6990"+CRLF+;
            "where C6_NUM='"+cPedido+"'"

  TCQUERY cQuery ALIAS &(cAlias) NEW

  while &(cAlias)->(!EOF())
    cCodigo:= &(cAlias)->(C6_PRODUTO)
    cDescricao:= &(cAlias)->(C6_DESCRI)
    cQuant:= &(cAlias)->(C6_QTDVEN)
    cUnidade:= &(cAlias)->(C6_PRUNIT)
    cTotal:= &(cAlias)->(C6_VALOR)
    if(cPedidoAux<>cPedido)
      cPedidoAux:=cPedido
      cMensagem += '--------------------'+CRLF
    endif
    cMensagem += cCodigo+' - '+cDescricao+' - QTD:'+cValToChar(cQuant)+' - '+cValToChar(cUnidade)+' - '+cValToChar(cTotal)+' - '+CRLF
    &(cAlias)->(DbSkip())
  enddo

  cMensagem += '--------------------'+CRLF

  fwAlertInfo(cMensagem,'Pedidos '+cPedido)

  &(cAlias)->(DbCloseArea())
  RestArea(aArea)
Return 
