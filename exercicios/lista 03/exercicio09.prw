//Bibliotecas
#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

//Constantes
#DEFINE cTITULO 'Algoritimos para listar todos os pedidos de um determinado produto'


/*/
  @author Fabio
  @since ../../2023
/*/

User Function ListaPedidoProduto()
  Local aArea       := GetArea()
  Local cAlias      := GetNextAlias()
  local cQuery      := ''
  Local lTentar     := .T.
  local cMensagem   := ''
  Local cCodigo
  Local cPedido


  while(lTentar)
    cMensagem :=''
    cCodigo := ''
    FwAlertInfo(cTITULO,"Bem vindo!")

    cCodigo := FwInputBox('Digite o codigo de um produto:',cCodigo)

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
    lTentar := MsgyesNo("Deseja tentar novamente? ","Tentar Novamente")
  enddo
  FwAlertInfo('Fim! <b>All Right!<b>','Resultado!')
Return 
