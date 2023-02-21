//Bibliotecas
#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

//Constantes
#DEFINE cTITULO 'Algoritimo para mostrar o produto com o maior valor total ja vendido'


/*/
  @author Fabio
  @since ../../2023
/*/

User Function List3MaiorvalorProduto()
  Local aArea       := GetArea()
  Local cAlias      := GetNextAlias()
  local cQuery      := ''
  Local lTentar     := .T.
  local cMensagem   := ''
  Local nValor      := 0
  Local nValorUn 
  Local cCodigo
  Local cDescr
  Local nValorAux

  while(lTentar)
    cMensagem :=''
    FwAlertInfo(cTITULO,"Bem vindo!")

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SB1' MODULO 'COM'

    cQuery := "Select C6_PRODUTO, C6_DESCRI, C6_PRUNIT, C6_VALOR"+CRLF+;  
              "from "+RetSqlName('SC6')

    TCQUERY cQuery ALIAS &(cAlias) NEW

    while &(cAlias)->(!EOF())
      nValorAux:= &(cAlias)->(C6_VALOR)

      if(nValorAux>nValor)
        cCodigo:= &(cAlias)->(C6_PRODUTO)
        cDescr:= &(cAlias)->(C6_DESCRI)
        nValorUn:= &(cAlias)->(C6_PRUNIT)
        nValor:= &(cAlias)->(C6_VALOR)
        cMensagem := cCodigo+' - '+cDescr+' - '+cValToChar(nValorUn)+' - '+cValToChar(nValor)+CRLF
      endif

      &(cAlias)->(DbSkip())
    enddo

    fwAlertSuccess(cMensagem,'Pedido por data')

    &(cAlias)->(DbCloseArea())
    RestArea(aArea)
    lTentar := MsgyesNo("Deseja tentar novamente? ","Tentar Novamente")
  enddo
  FwAlertInfo('Fim! <b>All Right!<b>','Resultado!')
Return 
