//Biblioteca
#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

//Constantes
#DEFINE cTITULO 'Algoritimos para exibir os detalhes'
#DEFINE cTITULODETALHES 'Detalhes'

//Cor
#DEFINE COR_FUNDO_PADRAO RGB(216,216,216)
#DEFINE CLR_TEXTO RGB(136,136,136)

//Função para exibir os detalhes do produto
User Function Detalhes(cCodProd)

  //CSS
  Local cCssDlgDetalhes :=;
  "QLabel {"+;
    "background: #fff;"+;
    "color: #888888;"+;
    "border: none;"+;
    "font: normal 16px Arial;"+;
  "}"+;
  "QPushButton {"+;
    "background: #ECB7B7;"+;
    "color: #CD0000;"+;
    "border: none;"+;
    "border-radius: 5px;"+; 
    "font: normal 14px Arial;"+;
  "}"+;
  "TGroup {"+;
    "background: #fff;"+;
    "border: none;"+;
    "border-radius: 8px;"+; 
    "box-shadow: 10px 10px;"+;
  "}"

  //Variaveis Global
  Private oDlgDetalhes

  //Variaveis Produto
  Private nQtdEstProd       := 0
  Private nValProd          := 0
  Private cDescrProd        := ''
  Private cCodBarraProduto  := ''
  Private cUnidProd         := ''
  Private cUrlProd          := ''


  //Janela do PDV
  oDlgDetalhes := TDialog():New(0,0,270,605,cTITULODETALHES,,,,,CLR_TEXTO,COR_FUNDO_PADRAO,,,.T.)
  oDlgDetalhes:SetCss( cCssDlgDetalhes )

  //Imagens do produto
  oLogoProduto := TBitmap():New(10,8, 120, 120,, cUrlProd, .T., oDlgDetalhes,,, .F., .F.,,, .F.,, .T.,, .F.)
  oLogoProduto:lStretch:= .T.
  oImg := TGroup():New(7,5,130,132,,oDlgDetalhes,,,.T.)

  //Informações do produto
  oDescricaoProd := TSay():New(14,145,{|| "<h2>"+cDescrProd+"</h2>"},oDlgDetalhes,,,,,,.T.,,,145,25,,,,,,.T.,0,2)
  oUNProduto := TSay():New(40,145,{|| "Unidade de medida:"},oDlgDetalhes,,,,,,.T.,,,72,15,,,,,,.T.,0,2)
  oValUNProduto := TSay():New(40,217,{|| cUnidProd},oDlgDetalhes,,,,,,.T.,,,72,15,,,,,,.T.,1,2)
  oCodBarraProd := TSay():New(56,145,{|| "Codigo de Barra:"},oDlgDetalhes,,,,,,.T.,,,72,15,,,,,,.T.,0,2)
  oValCodBarraProd := TSay():New(56,217,{|| cCodBarraProduto},oDlgDetalhes,,,,,,.T.,,,72,15,,,,,,.T.,1,2)
  oQtdProduto := TSay():New(72,145,{|| "Qtd. Estoque:"},oDlgDetalhes,,,,,,.T.,,,72,15,,,,,,.T.,0,2)
  oValQtdProd := TSay():New(72,217,{|| nQtdEstProd},oDlgDetalhes,,,,,,.T.,,,72,15,,,,,,.T.,1,2)
  oValorProduto := TSay():New(88,145,{|| "Valor Unitario:"},oDlgDetalhes,,,,,,.T.,,,72,15,,,,,,.T.,0,2)
  oValValorProd := TSay():New(88,217,{|| "<h2>R$ "+StrTran(Str(nValProduto,,2),'.',',')+"</h2>"},oDlgDetalhes,,,,,,.T.,,,72,15,,,,,,.T.,1,2)

  oInf := TGroup():New(7,137,107,297,,oDlgDetalhes,,,.T.)

  //Botão de sair
  oBotaoSair := TButton():New( 113, 138, "Sair",oDlgDetalhes,{|| oDlgDetalhes:End()}, 160,17,,,.F.,.T.,.F.,,.F.,,,.F. )
  BuscaProduto(cCodProd)

  oDlgDetalhes:Activate(,,,.T.,,,)
Return 

//Buscando produto*
Static Function BuscaProduto(cCod)
  Local aArea         := GetArea()
  Local cAlias        := GetNextAlias()
  Local cQuery        := ''

  cCod:= alltrim(cCod)

  cQuery:= "SELECT SB1.B1_COD, SB1.B1_DESC,SB1.B1_UM,SB1.B1_CODBAR, SB1.B1_PRV1, SB2.B2_QATU, SB5.B5_ECIMGFI"+CRLF
  cQuery+= "FROM "+RetSqlName('SB1')+" SB1"+CRLF
  cQuery+= "left join "+RetSqlName('SB5')+" SB5 ON SB5.B5_COD=SB1.B1_COD and SB5.D_E_L_E_T_=' '"+CRLF
  cQuery+= "join "+RetSqlName('SB2')+" SB2 ON SB2.B2_COD=SB1.B1_COD and SB2.D_E_L_E_T_=' '"+CRLF
  cQuery+= "WHERE SB1.D_E_L_E_T_=' ' "
  cQuery+= "and SB1.B1_COD='"+alltrim(cCod)+"'"

  TCQUERY cQuery ALIAS &(cAlias) NEW

  if(alltrim(&(cAlias)->(B1_COD))=="")
    FwAlertError("Codigo não cadastrado","Codigo do produto invalido!")
  else
    cDescrProd   := Alltrim(&(cAlias)->(B1_DESC))
    cUnidProd    := Alltrim(&(cAlias)->(B1_UM))
    cCodBarraProduto   := Alltrim(&(cAlias)->(B1_CODBAR))
    nQtdEstProd   := &(cAlias)->(B2_QATU)
    nValProduto  := &(cAlias)->(B1_PRV1)
    cUrlProd     := Alltrim(&(cAlias)->(B5_ECIMGFI))
    oLogoProduto:Load(,cUrlProd)
  endif
  &(cAlias)->(DbCloseArea())
  RestArea(aArea)
Return
