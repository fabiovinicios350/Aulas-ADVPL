#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

/*/
  @author Fabio
  @since 17/02/2023
/*/

// Funcao para buscar um produto
User Function BusProdSQL()
  Local aArea   := GetArea()
  Local cAlias  := GetNextAlias()
  Local cCodigo := '00001'
  Local cDescr  := ''
  Local cQuery  := ''

  PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SB1' MODULO 'COM'

  cQuery := 'SELECT B1_DESC' + CRLF
  cQuery += 'FROM ' + RrtSqlName('SB1') + CRLF
  cQuery += "WHERE BI_COD = '" + cCodigo + "'"

  TCQUERY cQuery ALIAS &(cAlias) NEW

  while &(cAlias)->(!EOF())
    cDescr := &(cAlias)->B1_DESC
    &(cAlias)->(DbSkip())
  enddo

  fwAlertInfo('Codigo:' + cCodigo + CRLF + 'Descricao' + cDescr,'Produto' )

  &(cAlias)->(DbCloseArea())
  RestArea(aArea)
Return 
