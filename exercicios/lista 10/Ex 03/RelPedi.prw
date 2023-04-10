#INCLUDE 'TOTVS.CH'
#INCLUDE 'REPORT.CH'

/*/{Protheus.doc} User Function RelPedi
  Função para criar um relatorio de Pedidos de compra
  @type  Function
  @author Fabio
  @since 05/04/2023
/*/
User Function RelPedi()
  Local oReport     := GerarRel()

  oReport:PrintDialog()
Return 

//Função para gerar o relatorio
Static Function GerarRel()
  //Variaveis globais
  Local cAlias      := GetNextAlias()
  Local oRel        := TReport():New('RelPed', 'Relatorio de pedidos',,{|oRel| Imprimir(oRel, cAlias)}, 'Esse relatorio mostra todo os pedidos de compra.', .F.)
  Local oSection    := TRSection():New(oRel, 'Cabeçalho do pedido de compra')
  Local oSection2   := TRSection():New(oSection, 'Item do pedido de compra')

  //Definindo as colunas da seção 01
  TRCell():New(oSection, 'C7_NUM',     'SC7', 'Numero do Pedido',     , 100,,,'LEFT', .F.,'LEFT',,, .F.,,, .T.)  
  TRCell():New(oSection, 'C7_EMISSAO', 'SC7', 'Data de emissão',      , 100,,,'LEFT', .F.,'LEFT',,, .F.,,, .T.)  
  TRCell():New(oSection, 'C7_FORNECE', 'SC7', 'Cod. Fornecedor',      , 100,,,'LEFT', .F.,'LEFT',,, .F.,,, .T.)  
  TRCell():New(oSection, 'C7_LOJA',    'SC7', 'Loja',                 , 100,,,'LEFT', .F.,'LEFT',,, .F.,,, .T.)  
  TRCell():New(oSection, 'C7_COND',    'SC7', 'Condição de pagamento',, 100,,,'LEFT', .F.,'LEFT',,, .F.,,, .T.) 

  //Definindo as colunas da seção 02
  TRCell():New(oSection2, 'C7_PRODUTO', 'SC7', 'Cod. Produto',, 8,,,'LEFT', .F.,'LEFT',,, .T.,,, .T.)  
  TRCell():New(oSection2, 'C7_DESCRI', 'SC7', 'Descriçao',, 30,,,'LEFT', .T.,'LEFT',,, .T.,,, .T.)  
  TRCell():New(oSection2, 'C7_QUANT', 'SC7', 'Quant. vendida',, 10,,,'CENTER', .F.,'CENTER',,, .T.,,, .T.)  
  TRCell():New(oSection2, 'C7_PRECO', 'SC7', 'Valor Unitario',, 10,,,'CENTER', .F.,'CENTER',,, .F.,,, .T.)  
  TRCell():New(oSection2, 'C7_TOTAL', 'SC7', 'Valor Total',, 10,,,'CENTER', .F.,'CENTER',,, .T.,,, .T.)   
Return oRel

//Função para pegar os registro para montar o relatorio
Static Function Imprimir(oRel, cAlias)
  //Variaveis globais
  Local oSection      := oRel:Section(1)
  Local oSection2     := oSection:Section(1)
  Local cQuery        := GeraQuery()
  Local cPedidoAnt    := ''

  //Função para executar a query
  DbUseArea(.T., 'TOPCONN', TcGenQry(,,cQuery), cAlias, .T., .T.)

  //Pegando a quantidade de registros 
  Count To nTotReg

  //Adcionando informações no relatorio
  oRel:SetMeter(nTotReg)
  oRel:SetTitle('Informações de pedido de compra')
  oRel:StartPage()

  //Coloando a seção 01 em linha
  oSection:ForceLineStyle()
  oSection:Init()
  oSection2:Init()
  
  (cAlias)->(DbGoTop())
  //Populanod o relatlorio
  While (cAlias)->(!EOF())
    if oRel:Cancel()
      Exit
    endif

    if(cPedidoAnt<>alltrim((cAlias)->(C7_NUM)))//Verificando se e outro pedido
      //Finalizando ou Iniciando registro para aplicar o cabeçalho
      oSection:Finish()
      oSection2:Finish()
      oSection:Init()
      oSection2:Init()

      //Colocando as informações do pedido
      oSection:Cell('C7_NUM'):SetValue((cAlias)->(C7_NUM))
      oSection:Cell('C7_EMISSAO'):SetValue((cAlias)->(C7_EMISSAO))
      oSection:Cell('C7_FORNECE'):SetValue((cAlias)->(C7_FORNECE))
      oSection:Cell('C7_LOJA'):SetValue((cAlias)->(C7_LOJA))
      oSection:Cell('C7_COND'):SetValue((cAlias)->(C7_COND))
      oSection:PrintLine()
    endif
    
    //Colocando as informações dos itens do pedido
    oSection2:Cell('C7_PRODUTO'):SetValue((cAlias)->(C7_PRODUTO))
    oSection2:Cell('C7_DESCRI'):SetValue((cAlias)->(C7_DESCRI))
    oSection2:Cell('C7_QUANT'):SetValue((cAlias)->(C7_QUANT))
    oSection2:Cell('C7_PRECO'):SetValue((cAlias)->(C7_PRECO))
    oSection2:Cell('C7_TOTAL'):SetValue((cAlias)->(C7_TOTAL))
    oSection2:PrintLine()
    oRel:IncMeter()// Barra de progresso
    oRel:ThinLine()

    cPedidoAnt := alltrim((cAlias)->(C7_NUM))
    (cAlias)->(DbSkip())
  enddo

  (cAlias)->(DbCloseArea())
  oRel:EndPage()
  oSection2:Finish()
  oSection:Finish()
Return

//Gerando a query
Static Function GeraQuery()
  Local cQuery   := ''

  cQuery := 'SELECT C7_NUM, C7_EMISSAO, C7_FORNECE, C7_LOJA, C7_COND,C7_PRODUTO, C7_DESCRI, C7_QUANT, C7_PRECO, C7_TOTAL '+CRLF+;
  'FROM '+RetSqlName('SC7') + " SC7 "+CRLF+;
  "WHERE D_E_L_E_T_=' '"
Return cQuery
