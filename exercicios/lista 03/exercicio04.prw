//Bibliotecas
#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

//Constantes
#DEFINE cTITULO 'Algoritimos para apresentar '


/*/
  @author Fabio
  @since ../../2023
/*/

User Function GrupoBuscaProduto()
  Local aArea       := GetArea()
  Local cAlias      := GetNextAlias()
  local cQuery      := ''
  local cMensagem   := ''
  Local cGrupo      := 'G002'
  Local cCodigo
  Local cDescricao

  FwAlertInfo(cTITULO,"Bem vindo!")

  PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SB1' MODULO 'COM'

  cQuery := "Select B1_COD, B1_DESC"+CRLF+;
            "from "+RetSqlName('SB1')+CRLF+;
            "where B1_GRUPO='"+cGrupo+"'"

  TCQUERY cQuery ALIAS &(cAlias) NEW

  while &(cAlias)->(!EOF())
    cCodigo:= &(cAlias)->(B1_COD)
    cDescricao:= &(cAlias)->(B1_DESC)
    cMensagem += cCodigo+' - '+cDescricao+CRLF
    &(cAlias)->(DbSkip())
  enddo

  cMensagem += '--------------------'+CRLF

  fwAlertInfo(cMensagem,'Produtos categoria Pelicula')

  &(cAlias)->(DbCloseArea())
  RestArea(aArea)
Return 
