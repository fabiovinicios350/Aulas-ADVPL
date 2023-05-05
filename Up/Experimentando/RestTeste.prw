#INCLUDE 'TOTVS.CH'
#INCLUDE 'RESTFUL.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

//Criando a rota de produtos
WSRESTFUL Produtos DESCRIPTION 'Api de produtos'

  //Metodo Get com Parametro na URL
  WSMETHOD GET DESCRIPTION 'Listar produtos' WSSYNTAX '/{grupo}'
END WSRESTFUL

//execução da rota
WSMETHOD GET WSSERVICE Produtos
  Local cAlias  := GetNextAlias()
  Local oJson  := JSONObject():New()
  Local cGrupo  := Self:aURLParms[1]
  Local cQuery  := ''

  cQuery := "Select * from "+RetSqlName('SB1')+" where D_E_L_E_T_=' ' AND B1_GRUPO = '"+cGrupo+"'"

  TCQUERY cQuery ALIAS (cAlias) NEW

  oJson['Produtos'] := {}

  (cAlias)->(DbGoTop())

  while (cAlias)->(!EOF())
    aadd(oJson['Produtos'],JSONObject():New())
     oJson['Produtos'][len(oJson['Produtos'])]['Cod'] := DECODEUTF8(alltrim((cAlias)->(B1_COD)))
     oJson['Produtos'][len(oJson['Produtos'])]['Descricao'] := DECODEUTF8(alltrim((cAlias)->(B1_DESC)))
     oJson['Produtos'][len(oJson['Produtos'])]['preco'] := (cAlias)->(B1_PRV1)
     oJson['Produtos'][len(oJson['Produtos'])]['UN'] := DECODEUTF8(alltrim((cAlias)->(B1_UM)))
     (cAlias)->(DbSkip())
  enddo

  ConOut(oJson:toJson())
  Self:SetContentType('application/json')
  Self:SetResponse(oJson)
  (cAlias)->(DBCLOSEAREA())
RETURN .T.


