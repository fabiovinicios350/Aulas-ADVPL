#INCLUDE 'TOTVS.CH'
#INCLUDE 'RESTFUL.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

WSRESTFUL Produtos DESCRIPTION 'APi de produtos'

  //Metodo Get sem Parametro na URL
  WSMETHOD GET DESCRIPTION 'Listar produtos' PATH '/Lista'
  
  //Metodo Get com Parametro na URL
  // WSMETHOD GET DESCRIPTION 'Listar produtos' WSSYNTAX '/Busca/{Codigo}'

END WSRESTFUL

WSRESTFUL BuscaProduto DESCRIPTION 'APi de produtos'

  //Metodo Get com Parametro na URL 000006
  WSMETHOD GET DESCRIPTION 'Buscar produtos' WSSYNTAX '/Busca/{Codigo}'

END WSRESTFUL

WSRESTFUL TesteProduto DESCRIPTION 'APi de produtos'

  //Metodo Get com Parametro na URL 000006
  WSMETHOD GET DESCRIPTION 'Listar produtos' PATH '/Busca'

END WSRESTFUL

WSMETHOD GET WSSERVICE Produtos

  Local aArea       := GetArea()
  Local cAlias      := GetNextAlias()
  Local oJson       := JSONObject():New()
  Local cJson       := ''
  Local cQuery      := ''

  //Recebendo o parametre
  // Local cCod        := Self:aURLParms[1]

  cQuery := "Select * from "+RetSqlName('SB1')+" where D_E_L_E_T_=' '"

  TCQUERY cQuery ALIAS (cAlias) NEW

  oJson["Produtos"] := {}
  (cAlias)->(DbGoTop())
  while (cAlias)->(!EOF())
    aadd(oJson["Produtos"],JSONObject():New())
    oJson["Produtos"][len(oJson["Produtos"])][ 'Codigo']    := alltrim((cAlias)->(B1_COD))
    oJson["Produtos"][len(oJson["Produtos"])][ 'Descricao'] := alltrim((cAlias)->(B1_DESC))
    oJson["Produtos"][len(oJson["Produtos"])][ 'Unidade']   := alltrim((cAlias)->(B1_UM))
    oJson["Produtos"][len(oJson["Produtos"])][ 'Valor']     := (cAlias)->(B1_PRV1)
    oJson["Produtos"][len(oJson["Produtos"])][ 'CodBarra']  := alltrim((cAlias)->(B1_CODBAR))
    (cAlias)->(DbSkip())
  enddo

  cJson:= oJson:toJson()
  ConOut(cJson)

  //Colocando o tipo do retorno
  Self:SetContentType('application/json')

  Self:SetResponse(oJson)
  (cAlias)->(DbCloseArea())
  RestArea(aArea)
Return .T.

WSMETHOD GET WSSERVICE BuscaProduto

  Local aArea       := GetArea()
  Local cAlias      := GetNextAlias()
  Local oJson       := JSONObject():New()
  Local cRetorno    := ''
  Local cQuery      := ''

  //Recebendo o parametre
  Local cCod        := Self:aURLParms[2]

  cQuery := "Select * from "+RetSqlName('SB1')+" where B1_COD='"+alltrim(cCod)+"'"

  TCQUERY cQuery ALIAS (cAlias) NEW

  if alltrim((cAlias)->(B1_COD))==''
    //Função para retornar um erro 
    SetRestFault(400,"Produto invalido!")
    Return .F.
  endif

  oJson["Codigo"] := alltrim((cAlias)->(B1_COD))
  oJson["Produto"] := alltrim((cAlias)->(B1_DESC))
  oJson["Unidade"] := alltrim((cAlias)->(B1_UM))
  oJson["Teste"] := {}
  aadd(oJson["Teste"],JSONObject():New())
  oJson["Teste"][len(oJson["Teste"])][ 'Teste01'] := "OI all right"
  oJson["Teste"][len(oJson["Teste"])][ 'Teste02'] := "OI Quirnino"
  oJson["Teste"][len(oJson["Teste"])][ 'Teste03'] := "OI favero"
  aadd(oJson["Teste"],JSONObject():New())
  oJson["Teste"][len(oJson["Teste"])][ 'Teste01'] := "OI Lucas"
  oJson["Teste"][len(oJson["Teste"])][ 'Teste02'] := "OI Vinicios"
  oJson["Teste"][len(oJson["Teste"])][ 'Teste03'] := "OI Stefhani"
  oJson["Valor"] := alltrim((cAlias)->(B1_PRV1))
  cRetorno := oJson:toJson()
  ConOut(cRetorno)
  ConOut(cCod)

  Self:SetContentType('application/json')
  Self:SetResponse(oJson)

  (cAlias)->(DbCloseArea())
  RestArea(aArea)
Return .T.
