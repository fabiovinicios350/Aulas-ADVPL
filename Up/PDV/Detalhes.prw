//Biblioteca
#INCLUDE 'TOTVS.CH'

//Constantes
#DEFINE cTITULO 'Algoritimos para exibir os detalhes'
#DEFINE cTITULODETALHES 'Detalhes'

//Cor
#DEFINE COR_FUNDO_PADRAO RGB(216,216,216)
#DEFINE CLR_TEXTO RGB(136,136,136)

//Função para exibir os detalhes do produto
User Function Detalhes()

  //CSS
  Local cCssDlgDetalhes :=;
  "QLineEdit {"+;
    "background: #fff;"+;
    "border: none;"+;
    "border-radius: 5px;"+;
    "color: #A5A5A5;"+;
    "font: normal 14px Arial;"+;
  "}"+;
  "QPushButton {"+;
    "background: #fff;"+;
    "color: #818181;"+;
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

  Local cCssAplica :=;
  "QPushButton {"+;
    "background: #A3CDA7;"+;
    "color: #438B4A;"+;
  "}"
  
  //Variaveis Global
  Private oDlgDetalhes

  //Variaveis Produto
  Private cCodProduto     := 'C00006'
  Private nQtdEstProduto  := 0
  Private nValProduto     := 0
  Private cDescrProduto
  Private cUnidProduto 
  Private cUrlProduto

  //Janela do PDV
  oDlgDetalhes := TDialog():New(0,0,277,609,cTITULODETALHES,,,,,CLR_TEXTO,COR_FUNDO_PADRAO,,,.T.)
  oDlgDetalhes:SetCss( cCssDlgDetalhes )

  //Imagens do produto
  oLogoTotvs := TBitmap():New(10,8, 120, 120,, cUrlProduto, .T., oDlgDetalhes,,, .F., .F.,,, .F.,, .T.,, .F.)
  oLogoTotvs:lStretch:= .T.
  oImg := TGroup():New(7,5,130,132,,oDlgDetalhes,,,.T.)

  //Informações do produto
  oTituloProduto := TSay():New(14,145,{|| "<h4>"+cDescrProduto+"</h4>"},oDlgDetalhes,,,,,,.T.,,,145,25,,,,,,.T.,0,2)
  oTituloProduto := TSay():New(14,145,{|| "Unidade de medida:"+cDescrProduto+""},oDlgDetalhes,,,,,,.T.,,,145,25,,,,,,.T.,0,2)
  oTituloProduto := TSay():New(14,145,{|| "Codigo de Barra:"},oDlgDetalhes,,,,,,.T.,,,145,25,,,,,,.T.,0,2)
  oTituloProduto := TSay():New(14,145,{|| "Qtd. Estoque:"},oDlgDetalhes,,,,,,.T.,,,145,25,,,,,,.T.,0,2)
  oTituloProduto := TSay():New(14,145,{|| "Valor Unitario:"},oDlgDetalhes,,,,,,.T.,,,145,25,,,,,,.T.,0,2)

  oInf := TGroup():New(7,137,107,297,,oDlgDetalhes,,,.T.)

  oDlgDetalhes:Activate(,,,.T.,,,)
Return 
