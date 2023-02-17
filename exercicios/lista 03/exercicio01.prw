//Bibliotecas
#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

//Constantes
#DEFINE cTITULO 'Algoritimos Buscar os pedidos de um fornecedor'


/*/
  @author Fabio
  @since ../../2023
/*/

User Function BuscaPedidoFor()
  Local aArea       := GetArea()
  Local cAlias      := GetNextAlias()
  Local cCodigoFor  := 'F00004'
  local cQuery      := ''
  local cMensagem   := ''
  Local cPedidoAux  := '0'
  Local cPedido
  Local cProduto
  Local cDescri

  FwAlertInfo(cTITULO,"Bem vindo!")

  PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SC7' MODULO 'COM'

  cQuery := "SELECT C7_NUM, C7_PRODUTO,C7_DESCRI"+CRLF+;
            "FROM "+RetSqlName('SC7')+CRLF+;
            " WHERE C7_FORNECE = '"+cCodigoFor+"'"

  TCQUERY cQuery ALIAS &(cAlias) NEW

  while &(cAlias)->(!EOF())
    cProduto:= &(cAlias)->(C7_PRODUTO)
    cPedido:= &(cAlias)->(C7_NUM)
    cDescri := &(cAlias)->(C7_DESCRI)
    if(cPedidoAux<>cPedido)
      cPedidoAux:=cPedido
      cMensagem += '--------------------'+CRLF
    endif
    cMensagem += 'Pedido '+cPedido+': '+cProduto+' - '+cDescri+CRLF
    &(cAlias)->(DbSkip())
  enddo

  fwAlertInfo(cMensagem,'Pedidos do Fornecedor' )

  &(cAlias)->(DbCloseArea())
  RestArea(aArea)
Return 
