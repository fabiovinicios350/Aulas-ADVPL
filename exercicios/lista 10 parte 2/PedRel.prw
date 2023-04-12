#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function PedRel
  Função para criar um relatorio do pedido de venda
  @type  Function
  @author Fabio
  @since 05/04/2023
/*/
User Function PedRel()
  Local oReport     := GerarRel()
  
  oReport:PrintDialog()
Return 

//Função para gerar o relatorio 
Static Function GerarRel()
  //Variaveis globais
  Local cAlias      := GetNextAlias()
  Local oRel        := TReport():New('PedRel', 'Informações do pedido de venda',,{|oRel| Imprimir(oRel, cAlias)}, 'Esse relatorio imprimie as informações do pedido selecionado.', .F.)
  Local oSection    := TRSection():New(oRel, 'Cabeçalho do pedido de venda')
  Local oSection2   := TRSection():New(oSection, 'Item do pedido de venda')

  //Definindo as colunas da seção 01
  TRCell():New(oSection, 'C5_NUM', 'SC7', 'Numero do pedido',, 8,,,'CENTER', .F.,'CENTER',,, .T.,,, .T.)  
  TRCell():New(oSection, 'A1_NOME', 'SC7', 'Cliente',, 30,,,'LEFT', .T.,'LEFT',,, .T.,,, .T.)  
  TRCell():New(oSection, 'C5_EMISSAO', 'SC7', 'Data Emissão',, 10,,,'CENTER', .F.,'CENTER',,, .T.,,, .T.)  
  TRCell():New(oSection, 'E4_DESCRI', 'SC7', 'Condição de pagamento',, 15,,,'CENTER', .F.,'CENTER',,, .F.,,, .T.)  

  //Definindo as colunas da seção 02
  TRCell():New(oSection2, 'C6_ITEM', 'SC7', 'Numero do Item',, 8,,,'CENTER', .F.,'CENTER',,, .T.,,, .T.)  
  TRCell():New(oSection2, 'C6_PRODUTO', 'SC7', 'Cod. Produto',, 10,,,'CENTER', .F.,'CENTER',,, .T.,,, .T.)  
  TRCell():New(oSection2, 'C6_DESCRI', 'SC7', 'Descrição do produto',, 50,,,'LEFT', .T.,'LEFT',,, .T.,,, .T.)  
  TRCell():New(oSection2, 'C6_QTDVEN', 'SC7', 'Quant. Vendida',, 10,,,'CENTER', .F.,'CENTER',,, .F.,,, .T.)  
  TRCell():New(oSection2, 'C6_PRCVEN', 'SC7', 'Valor Unitario',, 10,,,'CENTER', .F.,'CENTER',,, .T.,,, .T.)   
  TRCell():New(oSection2, 'C6_VALOR', 'SC7', 'Valor Total',, 10,,,'CENTER', .F.,'CENTER',,, .T.,,, .T.)   

  //Exercicios 04
  //Definir o totalizador
  oBreak := TRBreak():New(oSection, oSection:Cell('C5_NUM'), '', .T.)
	TRFunction():New(oSection2:Cell('C6_VALOR'), 'VALTOT', 'SUM', oBreak, 'VALOR TOTAL',,, .F., .F., .F.) 
Return oRel

//Função para imprimir o relatorio
Static Function Imprimir(oRel, cAlias)
  //Variaveis globais
  Local oSection      := oRel:Section(1)
  Local oSection2     := oSection:Section(1)
  Local cQuery        := GeraQuery()

  //Função para executar a query
  DbUseArea(.T., 'TOPCONN', TcGenQry(,,cQuery), cAlias, .T., .T.)

  //Inserir a quantidade de linhas em juma variavel
  Count To nTotReg

  //Colocando algumas informações no relatorio
  oRel:SetMeter(nTotReg)
  oRel:SetTitle('Informações de pedido de Venda')
  oRel:StartPage()
  oSection:Init()

  (cAlias)->(DbGoTop())


  //Populando a seção 01
  oSection:Cell('C5_NUM'):SetValue((cAlias)->(C5_NUM))
  oSection:Cell('A1_NOME'):SetValue((cAlias)->(A1_NOME))
  oSection:Cell('C5_EMISSAO'):SetValue(STOD((cAlias)->(C5_EMISSAO)))
  oSection:Cell('E4_DESCRI'):SetValue((cAlias)->(E4_DESCRI))

  oRel:ThinLine()
  
  oSection2:Init()
  oSection:PrintLine()

  //Populando o relatorio
  (cAlias)->(DbGoTop())
  While (cAlias)->(!EOF())
    if oRel:Cancel()
      Exit
    endif
    
    //Populando a seção 02
    oSection2:Cell('C6_ITEM'):SetValue((cAlias)->(C6_ITEM))
    oSection2:Cell('C6_PRODUTO'):SetValue((cAlias)->(C6_PRODUTO))
    oSection2:Cell('C6_DESCRI'):SetValue((cAlias)->(C6_DESCRI))
    oSection2:Cell('C6_QTDVEN'):SetValue((cAlias)->(C6_QTDVEN))
    oSection2:Cell('C6_PRCVEN'):SetValue((cAlias)->(C6_PRCVEN))
    oSection2:Cell('C6_VALOR'):SetValue((cAlias)->(C6_VALOR))

    oSection2:PrintLine()
    oRel:IncMeter()

    (cAlias)->(DbSkip())
  enddo

  (cAlias)->(DbCloseArea())
  oSection2:Finish()
  oSection:Finish()
  oRel:EndPage()
Return

//Gerar a query
Static Function GeraQuery()
  Local cQuery   := ''

  cQuery := "SELECT C5_NUM,A1_NOME,C5_EMISSAO, E4_DESCRI, C6_ITEM, C6_PRODUTO, C6_DESCRI, C6_QTDVEN, C6_PRCVEN, C6_VALOR"+CRLF+; 
  "FROM "+RetSqlName('SC5')+" SC5"+CRLF+;
  "JOIN "+RetSqlName('SC6')+" SC6 ON SC6.C6_NUM=SC5.C5_NUM and SC6.D_E_L_E_T_=' '"+CRLF+;
  "JOIN "+RetSqlName('SE4')+" SE4 ON SE4.E4_CODIGO=SC5.C5_CONDPAG and SE4.D_E_L_E_T_=' '"+CRLF+;
  "JOIN "+RetSqlName('SA1')+" SA1 ON SA1.A1_COD=SC5.C5_CLIENTE and SA1.D_E_L_E_T_=' '"+CRLF+;
  "WHERE SC5.D_E_L_E_T_=' ' AND SC5.C5_NUM='"+SC5->C5_NUM+"'"

Return cQuery



