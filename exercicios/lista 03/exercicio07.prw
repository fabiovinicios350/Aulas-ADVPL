//Bibliotecas
#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

//Constantes
#DEFINE cTITULO 'Algoritimos para pesquisar pedidos pela data de emissao'


/*/
  @author Fabio
  @since ../../2023
/*/

User Function List03pesquisaPedidoData()
  Local aArea       := GetArea()
  Local cAlias      := GetNextAlias()
  local cQuery      := ''
  Local lTentar     := .T.
  local cMensagem   := ''
  Local cPedido 
  Local dDataInicio
  Local dDataFim

  while(lTentar)
    cMensagem :=''
    FwAlertInfo(cTITULO,"Bem vindo!")

    dDataInicio := CTOD(FwInputBox('Digite a data inicio:',dDataInicio))
    dDataFim := CTOD(FwInputBox('Digite a data fim:',dDataFim))

    dDataInicio := DTOS(dDataInicio)
    dDataFim := DTOS(dDataFim)

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SC5' MODULO 'COM'

    cQuery := "Select C5_NUM"+CRLF+; 
              "from "+RetSqlName('SC5')+CRLF+; 
              "where C5_EMISSAO between '"+dDataInicio+"' and '"+dDataFim+"'"

    TCQUERY cQuery ALIAS &(cAlias) NEW

    while &(cAlias)->(!EOF())
      cPedido:= &(cAlias)->(C5_NUM)
      cMensagem += 'Pedido: '+cPedido+CRLF
      &(cAlias)->(DbSkip())
    enddo

    if(cMensagem=='')
      fwAlertError("Nao existe pedido criado nessas data",'Nenhum pedido criado')
    else
      fwAlertSuccess(cMensagem,'Pedido por data')
    endif

    &(cAlias)->(DbCloseArea())
    RestArea(aArea)
    lTentar := MsgyesNo("Deseja tentar novamente? ","Tentar Novamente")
  enddo
  FwAlertInfo('Fim! <b>All Right!<b>','Resultado!')
Return 
