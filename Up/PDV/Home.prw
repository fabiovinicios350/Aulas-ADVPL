#INCLUDE 'TOTVS.CH'

/*/
  @author Fabio
  @since 03/03/2023
/*/

//Função para a criação dos componentes da Home
User Function HomePdv()

  //Constantes
  #DEFINE cTITULO 'Algoritimo para simular um PDV'
  #DEFINE cTITULODLG 'TOTVS PDV' 
  //Cor
  #DEFINE COR_FUNDO_PADRAO RGB(216,216,216)
  #DEFINE CLR_TEXTO RGB(136,136,136)

  //CSS
  Local cCssDlg :=;
  "TGroup {"+;
    "background: #fff;"+;
    "border: 1px solid red;"+;
    "border-radius: 8px;"+; 
    "box-shadow: 10px 10px;"+;
  "}"+;
  "QLineEdit {"+;
    "background: #fff;"+;
    "border: 1px solid red;"+;
    "color: #A5A5A5;"+;
    "font: normal 20px Arial;"+;
  "}"+;
  "QLabel {"+;
    "background: #fff;"+;
    "color: #888888;"+;
    "border: 1px solid red;"+;
    "font: normal 16px Arial;"+;
  "}"

  Local cCssTotal :=;
  "QLabel {"+;
    "color: #438B4A;"+;
  "}"


  //Variaveis Global
  Local oDlg
  Local cNomeVend := 'Fabio Vinicios'
  Local cCodVend  := 'v00001'
  Local cNomeCliente := space(50)
  Local cCodCli  := space(20)


  //Variaveis 

  //Variaveis Produto
  Local cCodProduto   := space(20)
  Local cDescrProduto := '<h3>Coca cola 350ML</h3>'
  Local cUnidProduto  := 'LT'
  Local cBarraProduto := '7899943912639'
  Local cQtdEstProduto:= '5'
  Local cValProduto   := "R$ 10,00"
  Local cUrlProduto   := "C:\Users\User\Desktop\ADVPL\teste-git\Up\PDV\img\foto-Produto.png"

  //Variaveis Resumo Venda
  Local cTotal        := 'R$ 27,00'
  Local cSubTotal     := 'R$ 27,00'
  Local cDesconto     := 'R$ 0,00'

  oDlg := TDialog():New(0,0,644,1274,cTITULODLG,,,,,CLR_TEXTO,COR_FUNDO_PADRAO,,,.T.)
  oDlg:SetCss( cCssDlg )
  
  //Logo
  oLogoTotvs := TBitmap():New(17,12, 152, 055, NIL, "C:\Users\User\Desktop\ADVPL\teste-git\Up\PDV\img\logo-totvs.jpeg", .T., oDlg,, NIL, .F., .F., NIL, NIL, .F., NIL, .T., NIL, .F.)
  oLogoTotvs:lStretch:= .T.
  oLogo:= TGroup():New(07,07,82,169,,oDlg,,,.T.)

  //Pesquisa
  oIconeLupa := TBitmap():New(93.5,18.5, 12, 12, NIL, "C:\Users\User\Desktop\ADVPL\teste-git\Up\PDV\img\iconeLupa.svg", .T., oDlg,, NIL, .F., .F., NIL, NIL, .F., NIL, .T., NIL, .F.)
  oIconeLupa:lStretch:= .T.
  oGetPesquisa := TGet():New( 92,37,{||cCodProduto},oDlg,125,15,,,0,,,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,cCodProduto,,,,)
  oGetPesquisa:cPlaceHold := 'Pesquisa Produto...'
  oPesquisa:= TGroup():New(90,07,110,169,,oDlg,,,.T.)
   
  //Produto
  oTituloProduto := TSay():New(130,49,{||"<h2>Produto</h2>"},oDlg,,,,,,.T.,,,80,15,,,,,,.T.,2,2)
  oFotoProduto := TBitmap():New(150,49, 80, 80, NIL, cUrlProduto, .T., oDlg,, NIL, .F., .F., NIL, NIL, .F., NIL, .T., NIL, .F.)
  oFotoProduto:lStretch:= .T.
  oDescrProduto := TSay():New(235,12,{|| cDescrProduto},oDlg,,,,,,.T.,,,152,15,,,,,,.T.,2,2)
  oInfoUnd := TSay():New(255,12,{|| "Unidade de medida:"},oDlg,,,,,,.T.,,,75,13,,,,,,.T.)
  oInfoUndVal := TSay():New(255,87,{|| cUnidProduto},oDlg,,,,,,.T.,,,75,13,,,,,,.T.,1,2)
  oInfoBarra := TSay():New(270,12,{|| "Codigo de barra:"},oDlg,,,,,,.T.,,,75,13,,,,,,.T.)
  oInfoBarraVal := TSay():New(270,87,{|| cBarraProduto},oDlg,,,,,,.T.,,,75,13,,,,,,.T.,1,2)
  oInfoEst := TSay():New(285,12,{|| "Qtd. Estoque:"},oDlg,,,,,,.T.,,,75,13,,,,,,.T.)
  oInfoEstVal := TSay():New(285,87,{|| cQtdEstProduto},oDlg,,,,,,.T.,,,75,13,,,,,,.T.,1,2)
  oInfoValor := TSay():New(300,12,{|| "Valor unitario:"},oDlg,,,,,,.T.,,,75,13,,,,,,.T.)
  oInfoValorVal := TSay():New(297,87,{|| "<h2>"+cValProduto+"</h2>"},oDlg,,,,,,.T.,,,75,13,,,,,,.T.,1,2)
  oProduto:= TGroup():New(117,7,314,169,,oDlg,,,.T.)

  //vendedor
  oIconeUsu := TBitmap():New(269.5,186.5, 12, 12, NIL, "C:\Users\User\Desktop\ADVPL\teste-git\Up\PDV\img\iconeUsuario.svg", .T., oDlg,, NIL, .F., .F., NIL, NIL, .F., NIL, .T., NIL, .F.)
  oIconeUsu:lStretch:= .T.
  oGetVendedor := TGet():New( 267,206,{||cNomeVend},oDlg,190,15,,,0,,,.F.,,.T.,,.F.,,.F.,.F.,,.T.,.F.,,cNomeVend)
  oVendedor:= TGroup():New(265,177,287,412,,oDlg,,,.T.)

  //Cliente
  oIconeLupaCli := TBitmap():New(299.5,186.5, 12, 12, NIL, "C:\Users\User\Desktop\ADVPL\teste-git\Up\PDV\img\iconeLupa.svg", .T., oDlg,, NIL, .F., .F., NIL, NIL, .F., NIL, .T., NIL, .F.)
  oIconeLupaCli:lStretch:= .T.
  oGetPesquisaCli := TGet():New( 298,205,{||cNomeCliente},oDlg,190,15,,,0,,,.F.,,.T.,,.F.,,.F.,.F.,,.T.,.F.,,cNomeCliente)
  oGetPesquisaCli:cPlaceHold := 'Pesquisa Cliente...'
  oCliente:= TGroup():New(295,177,317,412,,oDlg,,,.T.)

  //resumo
  oSubTotal:= TSay():New(270,423,{|| "<h4> SubTotal: "+cSubTotal+"</h4>"},oDlg,,,,,,.T.,,,102,12,,,,,,.T.)
  oDescontoTotal := TSay():New(270,525,{|| "<h4> Desconto: "+cDesconto+"</h4>"},oDlg,,,,,,.T.,,,102,12,,,,,,.T.,1,2)
  oTotal:= TSay():New(287,422,{|| "<h1><span style='font: bold 18px Arial;'>TOTAL: </span>"+cTotal+"</h1>"},oDlg,,,,,,.T.,,,205,25,,,,,,.T.,2,2)
  oTotal:SetCss( cCssTotal )
  oResumo:= TGroup():New(265,418,317,633,,oDlg,,,.T.)





  oListaProduto:= TGroup():New(7,177,229,632,,oDlg,,,.T.)



  oDlg:Activate(,,,,,,)
Return 
