#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'

/*/
  @author Fabio
  @since 17/02/2023
/*/

// Funcao para buscar um produto
User Function BusProdGen()
  Local aArea   := GetArea()
  Local cCodigo := '00001'
  Local cDescr  := ''

  PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SB1' MODULO 'COM'

  DbSelectArea('SB1')
  DbSetOrder(1)
  DbSeek(XFilial('SB1') + cCodigo)

  cDescr := SB1->B1_DESC 

  FwAlertInfo('Codigo: '+cCodigo+CRLF+'Descricao: '+cDescr,'Produto')

  DbCloseArea()
  RestArea(aArea)
Return 
