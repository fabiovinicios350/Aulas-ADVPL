#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function RelFor
  Função para criar um relatorio de Fornecedores
  @type  Function
  @author Fabio
  @since 05/04/2023
/*/
User Function RelFor()
  Local oReport     := GerarRel()

  oReport:PrintDialog()
Return 

//Função para gerar o relatorio
Static Function GerarRel()
  Local cAlias      := GetNextAlias()
  Local oRel        := TReport():New('RelFor', 'Relatorio de Fornecedores',,{|oRel| Imprimir(oRel, cAlias)}, 'Esse relatorio imprimie todos os cadastros de Fornecedores.', .F.)
  Local oSection    := TRSection():New(oRel, 'Cadastro de Fornecedores')

  //Definindo as colunas do relatorio
  TRCell():New(oSection, 'A2_COD', 'SA2', 'Codigo',, 8,,,'CENTER', .F.,'CENTER',,, .T.,,, .T.)  
  TRCell():New(oSection, 'A2_NOME', 'SA2', 'Fornecedor',, 30,,,'LEFT', .T.,'LEFT',,, .T.,,, .T.)  
  TRCell():New(oSection, 'A2_NREDUZ', 'SA2', 'Nome Reduzido',, 30,,,'LEFT', .T.,'LEFT',,, .T.,,, .T.)  
  TRCell():New(oSection, 'A2_END', 'SA2', 'EndereÃ§o',, 30,,,'LEFT', .T.,'LEFT',,, .F.,,, .T.)  
  TRCell():New(oSection, 'A2_BAIRRO', 'SA2', 'Bairro',, 15,,,'CENTER', .T.,'CENTER',,, .T.,,, .T.)  
  TRCell():New(oSection, 'A2_EST', 'SA2', 'UF',, 4,,,'CENTER', .T.,'CENTER',,, .T.,,, .T.)  
Return oRel

//Função para imprimir o relatorio
Static Function Imprimir(oRel, cAlias)
  Local oSection      := oRel:Section(1)

  //Definido algumas informações do relatorio
  oRel:SetTitle('Relatorio de Fornecedores')
  oRel:StartPage()
  oSection:Init()

  //Colocando as informações no relatorio
  oSection:Cell('A2_COD'):SetValue(SA2->A2_COD)
  oSection:Cell('A2_NOME'):SetValue(SA2->A2_NOME)
  oSection:Cell('A2_NREDUZ'):SetValue(SA2->A2_NREDUZ)
  oSection:Cell('A2_END'):SetValue(SA2->A2_END)
  oSection:Cell('A2_BAIRRO'):SetValue(SA2->A2_BAIRRO)
  oSection:Cell('A2_EST'):SetValue(SA2->A2_EST)

  oSection:PrintLine()
  oRel:IncMeter()

  oSection:Finish()
  oRel:EndPage()
Return 




