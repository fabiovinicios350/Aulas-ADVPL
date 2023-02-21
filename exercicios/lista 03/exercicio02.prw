//Bibliotecas
#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

//Constantes
#DEFINE cTITULO 'Algoritimos Buscar os pedidos de venda de um cliente'


/*/
  @author Fabio
  @since ../../2023
/*/

User Function CliBuscaPedido()
  Local aArea       := GetArea()
  Local cAlias      := GetNextAlias()
  local cQuery      := ''
  local cMensagem   := ''
  Local cPedidoAux  := '0'
  Local cCliente    := ''
  Local cPedido

  FwAlertInfo(cTITULO,"Bem vindo!")

  PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SC7' MODULO 'COM'

  cQuery := "Select C.A1_NOME, C5_NUM"+CRLF+;
            "From "+RetSqlName('SC5')+" PC"+CRLF+;
            "join "+RetSqlName('SA1')+" as C ON C.A1_COD= PC.C5_CLIENTE"+CRLF+;
            "where C5_NOTA<>''";

  TCQUERY cQuery ALIAS &(cAlias) NEW

  while &(cAlias)->(!EOF())
    cCliente:= &(cAlias)->(A1_NOME)
    cPedido:= &(cAlias)->(C5_NUM)
    if(cPedidoAux<>cPedido)
      cPedidoAux:=cPedido
      cMensagem += '--------------------'+CRLF
    endif
    cMensagem += 'Cliente '+cCliente+': Pedido - '+cPedido+CRLF
    &(cAlias)->(DbSkip())
  enddo

  fwAlertInfo(cMensagem,'Pedidos do Fornecedor' )

  &(cAlias)->(DbCloseArea())
  RestArea(aArea)
Return 
