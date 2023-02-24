//Bibliotecas
#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

//Constantes
#DEFINE cTITULO 'Algoritimo para mostrar o produto mais caro e o produto mais barato'

/*/
  @author Fabio
  @since ../../2023
/*/

User Function MenorMaior()
  Local aArea       := GetArea()
  Local cAlias      := GetNextAlias()
  local cQuery      := ''
  local cCodigoMaiorMenor:= {}

  FwAlertInfo(cTITULO,"Bem vindo!")

  PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SB1' MODULO 'COM'

  cQuery := "Select top 1 B1_COD,B1_DESC,B1_PRV1 from "+RetSqlName('SB1')+" order by B1_PRV1 desc"
  TCQUERY cQuery ALIAS &(cAlias) NEW
  aadd(cCodigoMaiorMenor,{&(cAlias)->(B1_COD),&(cAlias)->(B1_DESC),&(cAlias)->(B1_PRV1)})
  &(cAlias)->(DbCloseArea())

  cQuery := "Select top 1 B1_COD,B1_DESC,B1_PRV1 from "+RetSqlName('SB1')+" order by B1_PRV1 asc"
  TCQUERY cQuery ALIAS &(cAlias) NEW
  aadd(cCodigoMaiorMenor,{&(cAlias)->(B1_COD),&(cAlias)->(B1_DESC),&(cAlias)->(B1_PRV1)})

  fwAlertSuccess("Maior: "+cCodigoMaiorMenor[1][1]+" - "+cCodigoMaiorMenor[1][2]+" - "+cValToChar(cCodigoMaiorMenor[1][3])+CRLF+;
                "Menor: "+cCodigoMaiorMenor[2][1]+" - "+cCodigoMaiorMenor[2][2]+" - "+cValToChar(cCodigoMaiorMenor[2][3]),'Menor e mair')
  &(cAlias)->(DbCloseArea())
  RestArea(aArea)
Return 
