#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function RelPed
  Função para criar um relatorio de Pedidos de compra
  @type  Function
  @author Fabio
  @since 05/04/2023
/*/
User Function RelPed()
  Local oReport     := GerarRel()

  oReport:PrintDialog()
Return 

//Função para gerar o relatorio 
Static Function GerarRel()
  //Variaveis globais
  Local cAlias      := GetNextAlias()
  Local oRel        := TReport():New('RelPed', 'Informações do pedido de compra',,{|oRel| Imprimir(oRel, cAlias)}, 'Esse relatorio imprimie as informações do pedido selecionado.', .F.)
  Local oSection    := TRSection():New(oRel, 'Cabeçalho do pedido de compra')
  Local oSection2   := TRSection():New(oSection, 'Item do pedido de compra')

  //Definindo as colunas da seção 01
  TRCell():New(oSection, 'C7_NUM', 'SC7', 'Numero do Pedido',, 8,,,'LEFT', .F.,'LEFT',,, .T.,,, .T.)  
  TRCell():New(oSection, 'C7_EMISSAO', 'SC7', 'Data Emissão',, 10,,,'CENTER', .F.,'CENTER',,, .T.,,, .T.)  
  TRCell():New(oSection, 'C7_FORNECE', 'SC7', 'Cod. Fornecedor',, 30,,,'CENTER', .F.,'CENTER',,, .T.,,, .T.)  
  TRCell():New(oSection, 'C7_LOJA', 'SC7', 'Loja',, 4,,,'CENTER', .F.,'CENTER',,, .F.,,, .T.)  
  TRCell():New(oSection, 'C7_COND', 'SC7', 'Condição de pagamento',, 5,,,'CENTER', .F.,'CENTER',,, .T.,,, .T.) 

  //Definindo as colunas da seção 02
  TRCell():New(oSection2, 'C7_PRODUTO', 'SC7', 'Cod. Produto',, 8,,,'LEFT', .F.,'CENTER',,, .T.,,, .T.)  
  TRCell():New(oSection2, 'C7_DESCRI', 'SC7', 'Descriçao',, 30,,,'LEFT', .T.,'LEFT',,, .T.,,, .T.)  
  TRCell():New(oSection2, 'C7_QUANT', 'SC7', 'Quant. vendida',, 10,,,'CENTER', .F.,'CENTER',,, .T.,,, .T.)  
  TRCell():New(oSection2, 'C7_PRECO', 'SC7', 'Valor Unitario',, 10,,,'CENTER', .F.,'CENTER',,, .F.,,, .T.)  
  TRCell():New(oSection2, 'C7_TOTAL', 'SC7', 'Valor Total',, 10,,,'CENTER', .F.,'CENTER',,, .T.,,, .T.)   


  //Exercicios 04
  //Definir o totalizador
  oBreak := TRBreak():New(oSection, oSection:Cell('C7_NUM'), '', .T.)
	TRFunction():New(oSection2:Cell('C7_TOTAL'), 'VALTOT', 'SUM', oBreak, 'VALOR TOTAL','@R R$ 99999999.99',, .F., .F., .F.) 
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
  oRel:SetTitle('Informações de pedido de compra')
  oRel:StartPage()
  oSection:Init()

  //Colocando as
  oSection:Cell('C7_NUM'):SetValue(SC7->C7_NUM)
  oSection:Cell('C7_EMISSAO'):SetValue(SC7->C7_EMISSAO)
  oSection:Cell('C7_FORNECE'):SetValue(SC7->C7_FORNECE)
  oSection:Cell('C7_LOJA'):SetValue(SC7->C7_LOJA)
  oSection:Cell('C7_COND'):SetValue(SC7->C7_COND)

  oRel:ThinLine()
  
  oSection2:Init()
  oSection:PrintLine()

  //Populando o relatorio
  (cAlias)->(DbGoTop())
  While (cAlias)->(!EOF())
    if oRel:Cancel()
      Exit
    endif

    //Inserir o registro na coluna
    oSection2:Cell('C7_PRODUTO'):SetValue((cAlias)->(C7_PRODUTO))
    oSection2:Cell('C7_DESCRI'):SetValue((cAlias)->(C7_DESCRI))
    oSection2:Cell('C7_QUANT'):SetValue((cAlias)->(C7_QUANT))
    oSection2:Cell('C7_PRECO'):SetValue((cAlias)->(C7_PRECO))
    oSection2:Cell('C7_TOTAL'):SetValue((cAlias)->(C7_TOTAL))

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

  cQuery := 'SELECT C7_PRODUTO, C7_DESCRI, C7_QUANT, C7_PRECO, C7_TOTAL '+CRLF+;
  'FROM '+RetSqlName('SC7') + " SC7 "+CRLF+;
  "WHERE D_E_L_E_T_=' ' AND C7_NUM='"+SC7->C7_NUM+"'"
Return cQuery



