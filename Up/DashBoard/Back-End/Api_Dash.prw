#INCLUDE 'TOTVS.CH'
#INCLUDE 'RESTFUL.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

//Rota de vendedores
WSRESTFUL Vendedores DESCRIPTION 'Api de Vendedores'
  WSMETHOD GET Lista    DESCRIPTION 'Listar Vendedores'   PATH '/Listar'
  WSMETHOD GET Ranking  DESCRIPTION 'Ranking Vendedores'  WSSYNTAX '/Ranking/{DtInicio}/{DtFim}'
END WSRESTFUL

//Rota de Produtos
WSRESTFUL Produtos DESCRIPTION 'Api de Produtos'
  WSMETHOD GET Ranking DESCRIPTION 'Ranking Produtos'   WSSYNTAX '/Ranking/{DtInicio}/{DtFim}/{Vendedor}'
END WSRESTFUL

//Rota de Analise de venda
WSRESTFUL Analise DESCRIPTION 'Api de Analise de venda'
  WSMETHOD GET Resumo DESCRIPTION 'Resumo do periodo'     WSSYNTAX '/Resumo/{DtInicio}/{DtFim}/{Vendedor}'
  WSMETHOD GET Evolucao  DESCRIPTION 'Analise dos meses'  PATH '/Evolucao/{DtInicio}/{DtFim}/{Vendedor}'
END WSRESTFUL

//EndPoint GET para listar todos os vendedores
WSMETHOD GET Lista WSSERVICE Vendedores
  Local aArea       := GetArea()
  Local cAlias      := GetNextAlias()
  Local oJson       := JSONObject():New()
  Local cQuery      := ''
  Local cRetorno    := ''
  

  cQuery := "Select A3_COD, A3_NOME, A3_NREDUZ from "+RetSqlName('SA3')+" where D_E_L_E_T_=' ' ORDER BY A3_NREDUZ"

  TCQUERY cQuery ALIAS (cAlias) NEW
  oJson["Vendedores"] := {}
  
  (cAlias)->(DbGoTop())
  while (cAlias)->(!EOF())
    aadd(oJson["Vendedores"],JSONObject():New())
    oJson["Vendedores"][len(oJson["Vendedores"])]["Cod"] := alltrim((cAlias)->(A3_COD))
    oJson["Vendedores"][len(oJson["Vendedores"])]["Nome"] := alltrim((cAlias)->(A3_NOME))
    oJson["Vendedores"][len(oJson["Vendedores"])]["Nome_Reduzido"] := alltrim((cAlias)->(A3_NREDUZ))
    (cAlias)->(DbSkip())
  enddo
  
  cRetorno := oJson:toJson()
  ConOut(cRetorno)
  
  Self:SetContentType('application/json')
  Self:SetResponse(oJson)

  (cAlias)->(DbCloseArea())
  RestArea(aArea)
Return .T.

//EndPoint GET para listar o Ranking dos vendedores
WSMETHOD GET Ranking WSSERVICE Vendedores
  Local aArea       := GetArea()
  Local cAlias      := GetNextAlias()
  Local oJson       := JSONObject():New()
  Local nTotal      := 0
  Local cQuery
  Local cRetorno 
  Local nPorcento

  //Parametros URL
  Private cDtInicio   := Self:aURLParms[2]
  Private cDtFim      := Self:aURLParms[3]

  //Gerando a query
  cQuery := QueryRanking()

  //Executando a query no banco de dados
  TCQUERY cQuery ALIAS (cAlias) NEW

  //Calculando o total
  (cAlias)->(DbGoTop())
   while (cAlias)->(!EOF())
    nTotal += ((cAlias)->(Valor_Vendido))
    (cAlias)->(DbSkip())
  enddo

  oJson["Vendedores"] := {}

  //Adicionando as informações no json
  (cAlias)->(DbGoTop())
  while (cAlias)->(!EOF())
    nPorcento := ROUND((((cAlias)->(Valor_Vendido)*100)/nTotal),0) //Calculando a porcentagem vendida
    aadd(oJson["Vendedores"],JSONObject():New())
    oJson["Vendedores"][len(oJson["Vendedores"])]["Cod"] := alltrim((cAlias)->(C5_VEND1))
    oJson["Vendedores"][len(oJson["Vendedores"])]["Nome"] := alltrim((cAlias)->(A3_NREDUZ))
    oJson["Vendedores"][len(oJson["Vendedores"])]["Porcentagem"] := nPorcento
    (cAlias)->(DbSkip())
  enddo
  
  //Imprimindo no console
  cRetorno := oJson:toJson()
  ConOut("-------------------------------------------------------------------------------")
  ConOut("Total vendido :"+CVALTOCHAR(nTotal))
  ConOut("-------------------------------------------------------------------------------")
  ConOut(cQuery)
  ConOut("-------------------------------------------------------------------------------")
  ConOut(cRetorno)
  ConOut("-------------------------------------------------------------------------------")
  
  //Retorno do EndPoint
  Self:SetContentType('application/json')
  Self:SetResponse(oJson)

  (cAlias)->(DbCloseArea())
  RestArea(aArea)
Return .T.

//EndPoint GET para listar o Ranking dos Produtos
WSMETHOD GET Ranking WSSERVICE Produtos
  Local aArea       := GetArea()
  Local cAlias      := GetNextAlias()
  Local oJson       := JSONObject():New()
  Local cQuery
  Local cRetorno

  //Parametros URL
  Private cDtInicio   := Self:aURLParms[2]
  Private cDtFim      := Self:aURLParms[3]
  Private cCodVend    := Self:aURLParms[4]

  //Gerando a query
  cQuery := QueryProdVend()

  //Executando a query no banco de dados
  TCQUERY cQuery ALIAS (cAlias) NEW

  oJson["Produtos"] := {}

  //Adicionando as informações no json
  (cAlias)->(DbGoTop())
  while (cAlias)->(!EOF())
    aadd(oJson["Produtos"],JSONObject():New())
    oJson["Produtos"][len(oJson["Produtos"])]["Cod"] := alltrim((cAlias)->(C6_PRODUTO))
    oJson["Produtos"][len(oJson["Produtos"])]["Descricao"] := alltrim((cAlias)->(C6_DESCRI))
    oJson["Produtos"][len(oJson["Produtos"])]["Qtd"] := (cAlias)->(qtd_vendido)
    oJson["Produtos"][len(oJson["Produtos"])]["Valor_unitario"] := (cAlias)->(B1_PRV1)
    oJson["Produtos"][len(oJson["Produtos"])]["Valor_vendido"] := (cAlias)->(valor_vendido)
    (cAlias)->(DbSkip())
  enddo
  
  //Imprimindo no console
  cRetorno := oJson:toJson()
  ConOut("-------------------------------------------------------------------------------")
  ConOut("QUERY SQL")
  ConOut(cQuery)
  ConOut("-------------------------------------------------------------------------------")
  ConOut("JSON")
  ConOut(cRetorno)
  ConOut("-------------------------------------------------------------------------------")
  
  //Retorno do EndPoint
  Self:SetContentType('application/json')
  Self:SetResponse(oJson)

  (cAlias)->(DbCloseArea())
  RestArea(aArea)
Return .T.

//EndPoint GET para calcular o resumo do periodo
WSMETHOD GET Resumo WSSERVICE Analise
  Local aArea             := GetArea()
  Local cAliasAtual       := GetNextAlias()
  Local cAliasAnterior    := GetNextAlias()
  Local oJson             := JSONObject():New()
  Local cQueryAtual
  Local cQueryAnterior
  Local cRetorno

  //Parametros URL
  Local cDtInicio       := Self:aURLParms[2]
  Local cDtFim          := Self:aURLParms[3]
  Local cDtInAnterior   := DTos(SToD(cDtInicio)-365)
  Local cDtFimAnterior  := DTos(SToD(cDtFim)-365)
  Private cCodVend      := Self:aURLParms[4]

  //Gerando a query
  cQueryAtual := QueryPeriodo(cDtInicio, cDtFim)
  cQueryAnterior := QueryPeriodo(cDtInAnterior, cDtFimAnterior)

  //Executando a query no banco de dados
  TCQUERY cQueryAtual ALIAS (cAliasAtual) NEW
  TCQUERY cQueryAnterior ALIAS (cAliasAnterior) NEW

  //Adicionando as informações no json
  oJson["Receita"] := (cAliasAtual)->(valor_vendido)
  oJson["Qtd_venda"] := (cAliasAtual)->(Quant_nota)
  oJson["Receita_anterior"] := (cAliasAnterior)->(valor_vendido)
  oJson["Qtd_venda_anterior"] := (cAliasAnterior)->(Quant_nota)
  
  //Imprimindo no console
  cRetorno := oJson:toJson()
  ConOut("-------------------------------------------------------------------------------")
  ConOut("QUERY SQL")
  ConOut(cQueryAtual)
  ConOut("-------------------------------------------------------------------------------")
  ConOut("QUERY SQL")
  ConOut(cQueryAnterior)
  ConOut("-------------------------------------------------------------------------------")
  ConOut("JSON")
  ConOut(cRetorno)
  ConOut("-------------------------------------------------------------------------------")
  
  //Retorno do EndPoint
  Self:SetContentType('application/json')
  Self:SetResponse(oJson)

  (cAliasAtual)->(DbCloseArea())
  (cAliasAnterior)->(DbCloseArea())
  RestArea(aArea)
Return .T.

//EndPoint GET para analise dos meses
WSMETHOD GET Evolucao WSSERVICE Analise
  Local aArea       := GetArea()
  Local cAlias      := GetNextAlias()
  Local oJson       := JSONObject():New()
  Local nQtdMeses   := 12
  Local nAuXMes
  Local cQuery
  Local cRetorno
  Local nLinha
  Local nMes

  //Parametros URL
  Private cDtInicio       := Self:aURLParms[2]
  Private cDtFim          := Self:aURLParms[3]
  Private cCodVend        := Self:aURLParms[4]

  nMes      := {{Month(SToD(cDtInicio)),0}}
  nAuXMes   := Month(SToD(cDtInicio))

  for nLinha:= 2 to nQtdMeses
    if(nAuXMes+1 > 12)
      nAuXMes := 1
    else
      nAuXMes++
    endif
    aADD(nMes,{nAuXMes,0})
  NEXT nLinha


  //Gerando a query
  cQuery := QueryAnalise()

  //Executando a query no banco de dados
  TCQUERY cQuery ALIAS (cAlias) NEW

  //Calculando os valores vendidos nos meses
  (cAlias)->(DbGoTop())
  while (cAlias)->(!EOF())

    for nLinha:= 1 to len(nMes)
      if nMes[nLinha][1] == Month(SToD((cAlias)->(C5_EMISSAO)))
        nMes[nLinha][2] += (cAlias)->(C6_VALOR)
      endif
    NEXT nLinha

    (cAlias)->(DbSkip())
  enddo

  oJson["Meses"] := {}

  //Adicionando as informações no json
  for nLinha:= 1 to len(nMes)
    aadd(oJson["Meses"],JSONObject():New())
    oJson["Meses"][len(oJson["Meses"])]["Mes"]    := SubSTR(MesExtenso(nMes[nLinha][1]),1,3)
    oJson["Meses"][len(oJson["Meses"])]["Valor"]  := nMes[nLinha][2]
  NEXT nLinha
  
  //Imprimindo no console
  cRetorno := oJson:toJson()
  ConOut("-------------------------------------------------------------------------------")
  ConOut("")
  ConOut("QUERY SQL")
  ConOut("")
  ConOut(cQuery)
  ConOut("")
  ConOut("-------------------------------------------------------------------------------")
  ConOut("")
  ConOut("JSON")
  ConOut("")
  ConOut(cRetorno)
  ConOut("")
  ConOut("-------------------------------------------------------------------------------")
  
  //Retorno do EndPoint
  Self:SetContentType('application/json')
  Self:SetResponse(oJson)

  (cAlias)->(DbCloseArea())
  RestArea(aArea)
Return .T.

//Função para Gerar a query de ranking de vendedores
Static Function QueryRanking()
  Local cQuery  := ''

  cQuery := ""+;
  "select Top 10"+CRLF+;
    "SC5.C5_VEND1,"+CRLF+;
    "A3_NREDUZ,"+CRLF+;
    "sum(C6_VALOR) as Valor_Vendido"+CRLF+;
  "from "+RetSqlName('SC5')+" SC5"+CRLF+;
    "join "+RetSqlName('SC6')+" SC6 ON SC6.C6_NUM = SC5.C5_NUM and SC6.D_E_L_E_T_=' '"+CRLF+;
    "Left Join "+RetSqlName('SA3')+" SA3 ON SA3.A3_COD = SC5.C5_VEND1 and SA3.D_E_L_E_T_=' '"+CRLF+;
  "where"+CRLF+; 
    "SC5.D_E_L_E_T_=' ' "+CRLF+;
    "and SC5.C5_EMISSAO between '"+cDtInicio+"' and '"+cDtFim+"'"+CRLF+;
  "Group by SC5.C5_VEND1, A3_NREDUZ"+CRLF+;
  "Order by Valor_Vendido desc"

Return cQuery

//Função para Gerar a query de Produtos mais vendidos
Static Function QueryProdVend()
  Local cQuery        := ''
  Local cComplemento  := ''


  if cCodVend == 'Todos'
    cComplemento := '1=1'
  else
    cComplemento := "SC5.C5_VEND1='"+cCodVend+"'"
  endif

  cQuery := ""+;
  "select"+CRLF+;
    "SC6.C6_PRODUTO,"+CRLF+; 
    "SC6.C6_DESCRI,"+CRLF+; 
    "sum(SC6.C6_QTDVEN) as qtd_vendido,"+CRLF+;
    "SB1.B1_PRV1,"+CRLF+;
    "sum(SC6.C6_VALOR) as valor_vendido"+CRLF+;
  "from "+RetSqlName('SC5')+" SC5"+CRLF+;
    "join "+RetSqlName('SC6')+" SC6 ON SC6.C6_NUM = SC5.C5_NUM and SC6.D_E_L_E_T_=' '"+CRLF+;
    "join "+RetSqlName('SB1')+" SB1 ON SB1.B1_COD = SC6.C6_PRODUTO and SB1.D_E_L_E_T_=' '"+CRLF+;
  "where"+CRLF+;
    "SC5.D_E_L_E_T_=' '"+CRLF+;
    "and SC5.C5_EMISSAO between '"+cDtInicio+"' and '"+cDtFim+"'"+CRLF+;
    "and "+cComplemento+CRLF+;
  "Group by SC6.C6_PRODUTO, SC6.C6_DESCRI, SB1.B1_PRV1"+CRLF+;
  "Order by qtd_vendido desc"
Return cQuery

//Função para Gerar a query de resumo do periodo
Static Function QueryPeriodo(cDtIniPeriodo, cDtFimPeriodo)
  Local cQuery        := ''
  Local cComplemento  := ''


  if cCodVend == 'Todos'
    cComplemento := '1=1'
  else
    cComplemento := "C5_VEND1='"+cCodVend+"'"
  endif

  cQuery := ""+;
  "select"+CRLF+;
    "sum(SC6.C6_VALOR) as valor_vendido,"+CRLF+;
    "(select COUNT(*) from "+RetSqlName('SC5')+" where D_E_L_E_T_=' ' and C5_EMISSAO between '"+cDtIniPeriodo+"' and '"+cDtFimPeriodo+"' and "+cComplemento+" ) as Quant_nota"+CRLF+;
  "from "+RetSqlName('SC5')+" SC5"+CRLF+;
    "join "+RetSqlName('SC6')+" SC6 ON SC6.C6_NUM = SC5.C5_NUM and SC6.D_E_L_E_T_=' '"+CRLF+;
  "where"+CRLF+;
    "SC5.D_E_L_E_T_=' '"+CRLF+;
    "and SC5.C5_EMISSAO between '"+cDtIniPeriodo+"' and '"+cDtFimPeriodo+"'"+CRLF+;
    "and "+cComplemento
Return cQuery

//Função para Gerar a query de Analises dos meses
Static Function QueryAnalise()
  Local cQuery        := ''
  Local cComplemento  := ''


  if cCodVend == 'Todos'
    cComplemento := '1=1'
  else
    cComplemento := "SC5.C5_VEND1='"+cCodVend+"'"
  endif

  cQuery := ""+;
  "Select"+CRLF+;
    "SC6.C6_VALOR,"+CRLF+; 
    "SC5.C5_EMISSAO"+CRLF+;
  "from "+RetSqlName('SC5')+" SC5"+CRLF+;
    "join "+RetSqlName('SC6')+" SC6 ON SC6.C6_NUM = SC5.C5_NUM and SC6.D_E_L_E_T_=' '"+CRLF+;
  "where"+CRLF+;
    "SC5.D_E_L_E_T_=' '"+CRLF+;
    "and "+cComplemento+CRLF+;
    "and SC5.C5_EMISSAO between '"+cDtInicio+"' and '"+cDtFim+"'"
Return cQuery


