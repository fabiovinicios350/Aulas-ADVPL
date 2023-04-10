#INCLUDE 'TOTVS.CH'
#INCLUDE 'REPORT.CH'

/*/{Protheus.doc} User Function RelProd
  Função para criar um relatorio de produto
  @type  Function
  @author Fabio
  @since 05/04/2023
/*/
User Function RelProdi()
  Local oReport     := GerarRel()

  oReport:PrintDialog()
Return 

//Gerar relatorio
Static Function GerarRel()
  //Variaveis globias
  Local cAlias      := GetNextAlias()
  Local oRel        := TReport():New('RelProdi', 'Relatorio de produtos',,{|oRel| Imprimir(oRel, cAlias)}, 'Esse relatorio imprimie todos os cadastros de produtos.', .F.)
  Local oSection    := TRSection():New(oRel, 'Cadastro de produto')

  //Definindo o nome das colunas
  TRCell():New(oSection, 'B1_COD', 'SB1', 'Codigo',, 8,,,'CENTER', .F.,'CENTER',,, .T.,,, .T.)  
  TRCell():New(oSection, 'B1_DESC', 'SB1', 'Descricao',, 30,,,'LEFT', .T.,'LEFT',,, .T.,,, .T.)  
  TRCell():New(oSection, 'B1_UM', 'SB1', 'UN',, 4,,,'CENTER', .F.,'CENTER',,, .F.,,, .T.)  
  TRCell():New(oSection, 'B1_PRV1', 'SB1', 'Preco de venda','@E R$ 999999.99', 10,,,'CENTER', .T.,'CENTER',,, .T.,,, .T.)  
  TRCell():New(oSection, 'B1_LOCPAD', 'SB1', 'Armazen',, 4,,,'CENTER', .T.,'CENTER',,, .T.,,, .T.)  
Return oRel

//Imprimir o relatorio
Static Function Imprimir(oRel, cAlias)
  //Variaveis Globais
  Local oSection      := oRel:Section(1)
  Local nTotReg       := 0
  Local cQuery        := GeraQuery()

  //Função para executar a query
  DbUseArea(.T., 'TOPCONN', TcGenQry(,,cQuery), cAlias, .T., .T.)
  
  //Pegar a quantidade de linha com retorno
  Count To nTotReg

  //Colocar no relatorioalguma informações
  oRel:SetMeter(nTotReg)
  oRel:SetTitle('Relatorio de Clientes')
  oRel:StartPage()
  oSection:Init()

  (cAlias)->(DbGoTop())

  //Colocando os registros no relatorio
  While (cAlias)->(!EOF())
    if oRel:Cancel()
      Exit
    endif
    
    //Incluindo na relatorio
    oSection:Cell('B1_COD'):SetValue((cAlias)->(B1_COD))
    oSection:Cell('B1_DESC'):SetValue((cAlias)->(B1_DESC))
    oSection:Cell('B1_UM'):SetValue((cAlias)->(B1_UM))
    oSection:Cell('B1_PRV1'):SetValue((cAlias)->(B1_PRV1))
    oSection:Cell('B1_LOCPAD'):SetValue((cAlias)->(B1_LOCPAD))

    //Printando no relatorio
    oSection:PrintLine()
    oRel:IncMeter()

    (cAlias)->(DbSkip())
  enddo

  (cAlias)->(DbCloseArea())
  oSection:Finish()
  oRel:EndPage()
Return 

//Função para montar a query
Static Function GeraQuery()
  Local cQuery    := ''

  cQuery := "SELECT B1_COD, B1_DESC, B1_UM, B1_PRV1, B1_LOCPAD "+CRLF+; 
  "FROM "+ RetSqlName('SB1') + " SB1 "+CRLF+;
  "WHERE D_E_L_E_T_=''"
Return cQuery
