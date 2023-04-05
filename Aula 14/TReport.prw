#INCLUDE 'TOTVS.CH'
#INCLUDE 'REPORT.CH'

/*/{Protheus.doc} User Function Treport
  Exemplo de Relatorio utilizando TReport
  @type  Function
  @author Fabio
  @since 05/04/2023
/*/
User Function Treport()
  Local oReport := GeraReport()

  oReport:PrintDialog()
Return 

Static Function GeraReport()
  Local cAlias    := GetNextAlias()
  Local oRel      := TReport():New('TREPORT', 'Relatório de Clientes',, {|oRepo,cAlias| Imprime(oRepo,cAlias)}, 'Esse Relatório imprimira todos os cadastros de clientes.', .F.)
  Local oSection  := TRSection():New(oRel, 'Cadastro de Clientes')
  

  TRCell():New(oSection, 'A1_COD', 'SA1', 'Codigo',, 8,,, 'CENTER', .F., 'CENTER')
Return oRel

