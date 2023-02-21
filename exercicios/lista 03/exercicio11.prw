//Bibliotecas
#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

//Constantes
#DEFINE cTITULO 'Algoritimos para mostrar todos os fornecedor de SP'


/*/
  @author Fabio
  @since ../../2023
/*/

User Function FornecedorSP()
  Local aArea       := GetArea()
  Local cAlias      := GetNextAlias()
  local cQuery      := ''
  local cMensagem   := ''
  Local cFornecedor 

  FwAlertInfo(cTITULO,"Bem vindo!")

  PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SA2' MODULO 'COM'

  cQuery := "Select A2_NOME From "+RetSqlName('SA2')+" where A2_EST='SP'"

  TCQUERY cQuery ALIAS &(cAlias) NEW

  while &(cAlias)->(!EOF())
    cFornecedor:= &(cAlias)->(A2_NOME)
    cMensagem += cFornecedor+', '
    &(cAlias)->(DbSkip())
  enddo

  fwAlertInfo(ALLTRIM(cMensagem),'PFornecedores de SP' )

  &(cAlias)->(DbCloseArea())
  RestArea(aArea)
Return 
