#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

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
    "border: none;"+;
    "border-radius: 8px;"+; 
    "box-shadow: 10px 10px;"+;
  "}"+;
  "QLineEdit {"+;
    "background: #fff;"+;
    "border: none;"+;
    "color: #A5A5A5;"+;
    "font: normal 16px Arial;"+;
  "}"+;
  "QLabel {"+;
    "background: #fff;"+;
    "color: #888888;"+;
    "border: none;"+;
    "font: normal 16px Arial;"+;
  "}"+;
  "QPushButton {"+;
    "background: #fff;"+;
    "color: #818181;"+;
    "border: none;"+;
    "border-radius: 8px;"+; 
    "font: normal 18px Arial;"+;
  "}"

  Local cCssTotal :=;
  "QLabel {"+;
    "color: #438B4A;"+;
  "}"

  Local cCssFinalizar :=;
  "QPushButton {"+;
    "background: #A3CDA7;"+;
    "color: #438B4A;"+;
  "}"

  Local cCssCancelar :=;
  "QPushButton {"+;
    "background: #ECB7B7;"+;
    "color: #CD0000;"+;
  "}"

  Local cCssGetPesquisa :=;
  "QLineEdit {"+;
    "font: normal 20px Arial;"+;
  "}"


  //Variaveis Global
  Private oDlg
  Private cNomeVend := 'Fabio Vinicios'
  Private cCodVend  := 'v00001'
  Private cNomeCliente := space(50)
  Private cCodCli  := space(20)

  //Variaveis Produto
  Private cCodigoEAN    := space(25)
  Private cCodProduto   := space(20)
  Private cDescrProduto := 'Descrição do produto'
  Private cUnidProduto  := ''
  Private cBarraProduto := ''
  Private nQtdEstProduto:= 0
  Private nValProduto   := 0
  Private cUrlProduto   := "C:\TOTVS12\Protheus\img\Imagem-inicio.png"

  //Variaveis para incluir produto
  Private nQuantBarra   := 1
  Private aListaProduto := {}
  Private nQtdProduto
  Private nDescontoProd
  Private cListaProduto 

  //Variaveis Resumo Venda
  Private nTotal        := 0
  Private nSubTotal     := 0
  Private nDesconto     := 0

  cListaProduto:=''+;
  '<table  style="font-size: 14px">'+;
  '<tr>'+;
    '<th width="75" style="border: none;text-align:left">Cod</th>'+;
    '<th width="325" style="border: none;text-align:left">Produto</th>'+;
    '<th width="50" style="border: none">Qtde</th>'+;
    '<th width="100" style="border: none">Valor Unit</th>'+;
    '<th width="100" style="border: none">Sub Total</th>'+;
    '<th width="100" style="border: none">Desconto</th>'+;
    '<th width="130" style="border: none;text-align:center">Total</th>'+;
  '</tr>'+;
  '<tr>'+;
    '<td></td>'+;
    '<td></td>'+;
    '<td></td>'+;
    '<td></td>'+;
    '<td></td>'+;
    '<td></td>'+;
    '<td></td>'+;
  '</tr>'+;
  '</table>'


  PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SB1' MODULO 'COM'

  oDlg := TDialog():New(0,0,644,1274,cTITULODLG,,,,,CLR_TEXTO,COR_FUNDO_PADRAO,,,.T.)
  oDlg:SetCss( cCssDlg )
  
  //Logo
  oLogoTotvs := TBitmap():New(17,12, 152, 055, NIL, "C:\Users\User\Desktop\ADVPL\teste-git\Up\PDV\img\logo-totvs.jpeg", .T., oDlg,, NIL, .F., .F., NIL, NIL, .F., NIL, .T., NIL, .F.)
  oLogoTotvs:lStretch:= .T.
  oLogo:= TGroup():New(07,07,82,169,,oDlg,,,.T.)

  //Pesquisa
  oIconeLupa := TBitmap():New(93.5,18.5, 12, 12, NIL, "C:\Users\User\Desktop\ADVPL\teste-git\Up\PDV\img\iconeLupa.svg", .T., oDlg,{|| ProdConsPadrao()}, NIL, .F., .F., NIL, NIL, .F., NIL, .T., NIL, .F.)
  oIconeLupa:lStretch:= .T.
  oGetPesquisa := TGet():New( 92,37,{|u| If( PCount() == 0, cCodigoEAN, cCodigoEAN:=u )},oDlg,125,15,,,0,,,.F.,,.T.,,.F.,,.F.,.F.,{||  BuscaProduto(cCodigoEAN,1)},.F.,.F.,,cCodigoEAN,,,,)
  oGetPesquisa:cPlaceHold := 'Pesquisa Produto...'
  oGetPesquisa:SetCss( cCssGetPesquisa )
  oPesquisa:= TGroup():New(90,07,110,169,,oDlg,,,.T.)
   
  //Produto
  oTituloProduto := TSay():New(130,49,{||"<h2>Produto</h2>"},oDlg,,,,,,.T.,,,80,15,,,,,,.T.,2,2)
  oFotoProduto := TBitmap():New(150,49, 80, 80, NIL, cUrlProduto, .T., oDlg,, NIL, .F., .F., NIL, NIL, .F., NIL, .T., NIL, .F.)
  oFotoProduto:lStretch:= .T.
  oDescrProduto := TSay():New(235,12,{|| "<h4>"+cDescrProduto+"</h4>"},oDlg,,,,,,.T.,,,152,15,,,,,,.T.,2,2)
  oInfoUnd := TSay():New(255,12,{|| "Unidade de medida:"},oDlg,,,,,,.T.,,,75,13,,,,,,.T.)
  oInfoUndVal := TSay():New(255,87,{|| cUnidProduto},oDlg,,,,,,.T.,,,75,13,,,,,,.T.,1,2)
  oInfoBarra := TSay():New(270,12,{|| "Codigo de barra:"},oDlg,,,,,,.T.,,,75,13,,,,,,.T.)
  oInfoBarraVal := TSay():New(270,87,{|| cBarraProduto},oDlg,,,,,,.T.,,,75,13,,,,,,.T.,1,2)
  oInfoEst := TSay():New(285,12,{|| "Qtd. Estoque:"},oDlg,,,,,,.T.,,,75,13,,,,,,.T.)
  oInfoEstVal := TSay():New(285,87,{|| cValToChar(nQtdEstProduto)},oDlg,,,,,,.T.,,,75,13,,,,,,.T.,1,2)
  oInfoValor := TSay():New(300,12,{|| "Valor unitario:"},oDlg,,,,,,.T.,,,75,13,,,,,,.T.)
  oInfoValorVal := TSay():New(297,87,{|| "<h2>R$ "+StrTran(Str(nValProduto,,2),'.',',')+"</h2>"},oDlg,,,,,,.T.,,,75,13,,,,,,.T.,1,2)
  oProduto:= TGroup():New(117,7,314,169,,oDlg,,,.T.)
  
  //Funções
  oFinalizar := TButton():New( 235, 177, "Finalizar",oDlg,{||alert("Finalizar")}, 85,25,,,.F.,.T.,.F.,,.F.,,,.F. )
  oFinalizar:SetCss( cCssFinalizar )
  oDesconto := TButton():New( 235, 270, "Desconto",oDlg,{||alert("Desconto")}, 85,25,,,.F.,.T.,.F.,,.F.,,,.F. )
  oPesquisar := TButton():New( 235, 362, "Pesquisa",oDlg,{||alert("Pesquisa")}, 85,25,,,.F.,.T.,.F.,,.F.,,,.F. )
  oCancelarItem := TButton():New( 235, 455, "Cancelar Item",oDlg,{||alert("Cancelar Item")}, 85,25,,,.F.,.T.,.F.,,.F.,,,.F. )
  oCancelar := TButton():New( 235, 547, "Cancelar",oDlg,{||CancelarVenda()}, 85,25,,,.F.,.T.,.F.,,.F.,,,.F. )
  oCancelar:SetCss( cCssCancelar )

  //vendedor
  oIconeUsu := TBitmap():New(269.5,186.5, 12, 12, NIL, "C:\Users\User\Desktop\ADVPL\teste-git\Up\PDV\img\iconeUsuario.svg", .T., oDlg,, NIL, .F., .F., NIL, NIL, .F., NIL, .T., NIL, .F.)
  oIconeUsu:lStretch:= .T.
  oGetVendedor := TGet():New( 267,206,{||cNomeVend},oDlg,190,15,,,0,,,.F.,,.T.,,.F.,,.F.,.F.,,.T.,.F.,,cNomeVend)
  oVendedor:= TGroup():New(265,177,287,412,,oDlg,,,.T.)

  //Cliente
  oIconeLupaCli := TBitmap():New(299.5,186.5, 12, 12, NIL, "C:\Users\User\Desktop\ADVPL\teste-git\Up\PDV\img\iconeLupa.svg", .T., oDlg,{|| CliConsPadrao()}, NIL, .F., .F., NIL, NIL, .F., NIL, .T., NIL, .F.)
  oIconeLupaCli:lStretch:= .T.
  oGetPesquisaCli := TGet():New( 298,205,{||cNomeCliente},oDlg,190,15,,,0,,,.F.,,.T.,,.F.,,.F.,.F.,,.T.,.F.,,cNomeCliente)
  oGetPesquisaCli:cPlaceHold := 'Pesquisa Cliente...'
  oCliente:= TGroup():New(295,177,317,412,,oDlg,,,.T.)

  //resumo
  oSubTotal:= TSay():New(270,423,{|| "<h4> SubTotal: R$ "+Strtran(Str(nSubTotal,,2),'.',',')+"</h4>"},oDlg,,,,,,.T.,,,102,12,,,,,,.T.)
  oDescontoTotal := TSay():New(270,525,{|| "<h4> Desconto: R$ "+Strtran(Str(nDesconto,,2),'.',',')+"</h4>"},oDlg,,,,,,.T.,,,102,12,,,,,,.T.,1,2)
  oTotal:= TSay():New(287,422,{|| "<h1>R$ "+Strtran(Str(nTotal,,2),'.',',')+"</h1>"},oDlg,,,,,,.T.,,,205,25,,,,,,.T.,2,2)
  oTotal:SetCss( cCssTotal )
  oResumo:= TGroup():New(265,418,317,633,,oDlg,,,.T.)

  //Lista de Produtos
  LoadListProduto()
  oListaProduto:= TGroup():New(7,177,229,632,,oDlg,,,.T.)
  oInfoEstVal := TSay():New(12,182,{|| cListaProduto},oDlg,,,,,,.T.,,,445,207,,,,,,.T.)

  oDlg:Activate(,,,,,,)
Return 

//Consulta padrão do produto
Static Function ProdConsPadrao()
  Local aArea   := GetArea()

  DbSelectArea("SB1")
  If ConPad1(,,,"SB1",,,.F.)
      BuscaProduto(SB1->B1_COD,0)
  EndIf

  DbCloseArea()
  RestArea(aArea)
Return

//Consulta padrão do cliente
Static Function CliConsPadrao()
  Local aArea   := GetArea()

  DbSelectArea("SA1")
  If ConPad1(,,,"SA1",,,.F.)
      cNomeCliente:= SA1->A1_NOME
      cCodCli:= SA1->A1_COD
  EndIf

  DbCloseArea()
  RestArea(aArea)
Return

//Verificando produto
Static Function BuscaProduto(cValor,nTipo)
  Local aArea         := GetArea()
  Local cAlias        := GetNextAlias()
  Local cQuery        := ''
  Local cComplementa  := ''

  cValor:= alltrim(cValor)

  if(len(cValor)==2 .and. ASC(SUBSTR( cValor, 2, 1))==42)
    if (IsDigit(SUBSTR( cValor, 1, 1))) .and. (val(SUBSTR( cValor, 1, 1))<>0)
      nQuantBarra:= val(SUBSTR( cValor, 1, 1))
      cCodigoEAN    := space(25)
    else
      cCodigoEAN    := space(25)
    endif
  else
    if(nTipo==0)
      cComplementa:= "and SB1.B1_COD='"+alltrim(cValor)+"'"
    elseif(nTipo==1)
      cComplementa:= "and B1_CODBAR='"+alltrim(cValor)+"'"
    endif

    cQuery:= "SELECT SB1.B1_COD, SB1.B1_DESC,SB1.B1_UM,SB1.B1_CODBAR, SB1.B1_PRV1, SB2.B2_QATU, SB5.B5_ECIMGFI"+CRLF
    cQuery+= "FROM "+ RetSqlName('SB1') +" SB1"+CRLF
    cQuery+= "left join "+RetSqlName('SB5')+" SB5 ON SB5.B5_COD=SB1.B1_COD and SB5.D_E_L_E_T_=' '"+CRLF
    cQuery+= "join "+RetSqlName('SB2')+" SB2 ON SB2.B2_COD=SB1.B1_COD and SB2.D_E_L_E_T_=' '"+CRLF
    cQuery+= "WHERE SB1.D_E_L_E_T_=' ' "
    cQuery+= cComplementa

    TCQUERY cQuery ALIAS &(cAlias) NEW

    if(alltrim(&(cAlias)->(B1_COD))=="")
      FwAlertError("Codigo de barra não cadastrado","Codigo de Barra invalido!")
    else
      CodProduto      := Alltrim(&(cAlias)->(B1_COD))
      cDescrProduto   := Alltrim(&(cAlias)->(B1_DESC))
      cUnidProduto    := Alltrim(&(cAlias)->(B1_UM))
      cBarraProduto   := Alltrim(&(cAlias)->(B1_CODBAR))
      nQtdEstProduto  := &(cAlias)->(B2_QATU)
      nValProduto     := &(cAlias)->(B1_PRV1)
      cUrlProduto     := Alltrim(&(cAlias)->(B5_ECIMGFI))
      cCodigoEAN      := cBarraProduto
      nQtdProduto     := nQuantBarra
      nQuantBarra     := 1
      nDescontoProd   := 0
      aadd(aListaProduto,{CodProduto,cDescrProduto,nQtdProduto,cUnidProduto,cBarraProduto,nQtdEstProduto,nValProduto,nValProduto*nQtdProduto,nDescontoProd,(nValProduto*nQtdProduto)-nDescontoProd,cUrlProduto})
      oFotoProduto:Load(,cUrlProduto)
      IncluiProduto()
    endif
    &(cAlias)->(DbCloseArea())
  endif
  RestArea(aArea)
Return .T.

//Incluindo produto na lista de venda
Static Function IncluiProduto()
  Local nI := len(aListaProduto)

  cListaProduto:=STRTRAN(cListaProduto,"</table>","")
  cListaProduto +=''+;
  '<tr>'+;
    '<td Height="100" style="border: none;text-align:left">'+aListaProduto[nI][1]+'</td>'+;
    '<td style="border: none;text-align:left">'+aListaProduto[nI][2]+'</td>'+;
    '<td style="border: none;text-align:center">'+Str(aListaProduto[nI][3])+'</td>'+;
    '<td style="border: none;text-align:center">R$ '+StrTran(Str(aListaProduto[nI][7],,2),'.',',')+'</td>'+;
    '<td style="border: none;text-align:center">R$ '+StrTran(Str(aListaProduto[nI][8],,2),'.',',')+'</td>'+;
    '<td style="border: none;text-align:center">R$ '+StrTran(Str(aListaProduto[nI][9],,2),'.',',')+'</td>'+;
    '<td style="border: none;text-align:center">R$ '+StrTran(Str(aListaProduto[nI][10],,2),'.',',')+'</td>'+;
  '</tr>'
  nTotal    += aListaProduto[nI][10]
  nSubTotal += aListaProduto[nI][8]
  nDesconto += aListaProduto[nI][9]
  cListaProduto += '</table>'
Return 

//Refazer a lista de venda
Static Function LoadListProduto()
  Local nI

  nTotal    := 0
  nSubTotal := 0
  nDesconto := 0

  cListaProduto:=''+;
  '<table  style="font-size: 14px">'+;
  '<tr>'+;
    '<th width="75" style="border: none;text-align:left">Cod</th>'+;
    '<th width="325" style="border: none;text-align:left">Produto</th>'+;
    '<th width="50" style="border: none">Qtde</th>'+;
    '<th width="100" style="border: none">Valor Unit</th>'+;
    '<th width="100" style="border: none">Sub Total</th>'+;
    '<th width="100" style="border: none">Desconto</th>'+;
    '<th width="130" style="border: none;text-align:center">Total</th>'+;
  '</tr>'+;
  '<tr>'+;
    '<td></td>'+;
    '<td></td>'+;
    '<td></td>'+;
    '<td></td>'+;
    '<td></td>'+;
    '<td></td>'+;
    '<td></td>'+;
  '</tr>'

  for nI:=1 to len(aListaProduto)
    cListaProduto +=''+;
    '<tr>'+;
      '<td Height="100" style="border: none;text-align:left">'+aListaProduto[nI][1]+'</td>'+;
      '<td style="border: none;text-align:left">'+aListaProduto[nI][2]+'</td>'+;
      '<td style="border: none;text-align:center">'+cValToChar(aListaProduto[nI][3])+'</td>'+;
      '<td style="border: none;text-align:center">R$ '+cValToChar(aListaProduto[nI][7])+'</td>'+;
      '<td style="border: none;text-align:center">R$ '+cValToChar(aListaProduto[nI][8])+'</td>'+;
      '<td style="border: none;text-align:center">R$ '+cValToChar(aListaProduto[nI][9])+'</td>'+;
      '<td style="border: none;text-align:center">R$ '+cValToChar(aListaProduto[nI][10])+'</td>'+;
    '</tr>'
    nTotal    += aListaProduto[nI][10]
    nSubTotal += aListaProduto[nI][8]
    nDesconto += aListaProduto[nI][9]
  next nI
  cListaProduto += '</table>'
Return 

//Cancelar a venda
Static Function CancelarVenda()
  if(MsgyesNo("Deseja realmente cancelar a venda?","Cancelar"))
    if(U_SenhaLibera())
      cNomeCliente := space(50)
      cCodCli  := space(20)
      cCodigoEAN    := space(25)
      cCodProduto   := space(20)
      cDescrProduto := 'Descrição do produto'
      cUnidProduto  := ''
      cBarraProduto := ''
      nQtdEstProduto:= 0
      nValProduto   := 0
      cUrlProduto   := "C:\TOTVS12\Protheus\img\Imagem-inicio.png"
      nQuantBarra   := 1
      nQtdProduto   := nil
      nDescontoProd := nil
      nTotal        := 0
      nSubTotal     := 0
      nDesconto     := 0
      aListaProduto := {}
      oFotoProduto:Load(,cUrlProduto)

      cListaProduto:=''+;
      '<table  style="font-size: 14px">'+;
      '<tr>'+;
        '<th width="75" style="border: none;text-align:left">Cod</th>'+;
        '<th width="325" style="border: none;text-align:left">Produto</th>'+;
        '<th width="50" style="border: none">Qtde</th>'+;
        '<th width="100" style="border: none">Valor Unit</th>'+;
        '<th width="100" style="border: none">Sub Total</th>'+;
        '<th width="100" style="border: none">Desconto</th>'+;
        '<th width="130" style="border: none;text-align:center">Total</th>'+;
      '</tr>'+;
      '<tr>'+;
        '<td></td>'+;
        '<td></td>'+;
        '<td></td>'+;
        '<td></td>'+;
        '<td></td>'+;
        '<td></td>'+;
        '<td></td>'+;
      '</tr>'+;
      '</table>'
    else
      FwAlertError("Operação não aprovada pelo Supervisor","Falha")
    endif
  else
    FwAlertError("Operação cancelada pelo usuario","Falha")
  endif
Return
