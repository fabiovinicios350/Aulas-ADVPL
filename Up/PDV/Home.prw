//Biblioteca
#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

//Constantes
#DEFINE cTITULO 'Algoritimo para simular um PDV'
#DEFINE cTITULODLG 'TOTVS PDV' 

//Cor
#DEFINE COR_FUNDO_PADRAO RGB(216,216,216)
#DEFINE CLR_TEXTO RGB(136,136,136)

/*/
  @author Fabio
  @since 03/03/2023
/*/

//Função que criação do PDV
User Function HomePdv(aVend,cLoj)

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
  "}"+;
  "QTableView {"+;
    "background: #fff;"+;
    "color: #888888;"+;
    "border: none;"+;
    "font: normal 13px Arial;"+;
  "}"

  Local cCssGetPesquisa :=;
  "QLineEdit {"+;
    "font: normal 20px Arial;"+;
  "}"

  Local cCssBTFinalizar :=;
  "QPushButton {"+;
    "background: #A3CDA7;"+;
    "color: #438B4A;"+;
    "padding-left: 25px;"+;
    "background-image: url(rpo:CarrinhoIcons.png);"+;
    "background-position: left;"+;
    "background-repeat: no-repeat;"+;
  "}"

  Local cCssBTCancelar :=;
  "QPushButton {"+;
    "background: #ECB7B7;"+;
    "color: #CD0000;"+;
    "padding-left: 25px;"+;
    "background-image: url(rpo:LixeiraIcons.png);"+;
    "background-position: left;"+;
    "background-repeat: no-repeat;"+;
  "}"

  Local cCssBTDesconto:=;
  "QPushButton {"+;
    "padding-left: 25px;"+;
    "background-image: url(rpo:DescontoIcons.png);"+;
    "background-position: left;"+;
    "background-repeat: no-repeat;"+;
  "}"

  Local cCssBTPesquisa:=;
  "QPushButton {"+;
    "padding-left: 25px;"+;
    "background-image: url(rpo:PesquisaIcons.png);"+;
    "background-position: left;"+;
    "background-repeat: no-repeat;"+;
  "}"

  Local cCssTotal :=;
  "QLabel {"+;
    "color: #438B4A;"+;
  "}"

  //Variaveis Global
  Private cCodVend        := aVend[1]
  Private cNomeVend       := aVend[2]
  Private cNomeCliente    := space(50)
  Private cCodCli         := space(20)
  Private cLoja           := cLoj
  Private oDlg

  //Variaveis Produto
  Private cCodigoEAN      := space(25)
  Private cCodProduto     := space(20)
  Private cDescrProduto   := 'Descrição do produto'
  Private cUnidProduto    := ''
  Private cBarraProduto   := ''
  Private nQtdEstProduto  := 0
  Private nValProduto     := 0
  Private cUrlProduto     := "C:\TOTVS12\Protheus\img\Imagem-inicio.png"

  //Variaveis para incluir produto
  Private nQuantBarra     := 1
  Private aListaProduto   := {}
  Private nCount          := 0
  Private nQtdProduto
  Private nDescontoProd

  //Variaveis Resumo Venda
  Private nTotal          := 0
  Private nSubTotal       := 0
  Private nDesconto       := 0

  //Conexão com o banco de dados
  PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SB1' MODULO 'COM'

  //Janela do PDV
  oDlg := TDialog():New(0,0,644,1274,cTITULODLG,,,,,CLR_TEXTO,COR_FUNDO_PADRAO,,,.T.)
  oDlg:SetCss( cCssDlg )
  
  //Logo TOTVS
  oLogoTotvs := TBitmap():New(17,12, 152, 055,, "C:\Users\User\Desktop\ADVPL\teste-git\Up\PDV\img\logo-totvs.jpeg", .T., oDlg,,, .F., .F.,,, .F.,, .T.,, .F.)
  oLogoTotvs:lStretch:= .T.
  oLogo:= TGroup():New(07,07,82,169,,oDlg,,,.T.)

  //Barra de pesquisa
  oIconeLupa := TBitmap():New(93.5,18.5, 12, 12,, "C:\Users\User\Desktop\ADVPL\teste-git\Up\PDV\img\iconeLupa.svg", .T., oDlg,{|| ProdConsPadrao()},, .F., .F.,,, .F.,, .T.,, .F.)
  oIconeLupa:lStretch:= .T.
  oGetPesquisa := TGet():New( 92,37,{|u| If( PCount() == 0, cCodigoEAN, cCodigoEAN:=u )},oDlg,125,15,,,0,,,.F.,,.T.,,.F.,,.F.,.F.,{||  BuscaProduto(cCodigoEAN,1)},.F.,.F.,,cCodigoEAN,,,,)
  oGetPesquisa:cPlaceHold := 'Pesquisa Produto...'
  oGetPesquisa:SetCss( cCssGetPesquisa )
  oPesquisa:= TGroup():New(90,07,110,169,,oDlg,,,.T.)
   
  //Informações do produto
  oTituloProduto := TSay():New(130,49,{||"<h2>Produto</h2>"},oDlg,,,,,,.T.,,,80,15,,,,,,.T.,2,2)
  oFotoProduto := TBitmap():New(150,49, 80, 80,, cUrlProduto, .T., oDlg,,, .F., .F.,,, .F.,, .T.,, .F.)
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
  
  //Botões para aplicar as funções
  oFinalizar := TButton():New( 235, 177, "Finalizar",oDlg,{||FinalizaVenda()}, 85,25,,,.F.,.T.,.F.,,.F.,,,.F. )
  oFinalizar:SetCss( cCssBTFinalizar )
  oDesconto := TButton():New( 235, 270, "Desconto",oDlg,{||DescontoAplicado()}, 85,25,,,.F.,.T.,.F.,,.F.,,,.F. )
  oDesconto:SetCss( cCssBTDesconto )
  oPesquisar := TButton():New( 235, 362, "Pesquisa",oDlg,{||alert("Pesquisa")}, 85,25,,,.F.,.T.,.F.,,.F.,,,.F. )
  oPesquisar:SetCss( cCssBTPesquisa )
  oCancelarItem := TButton():New( 235, 455, "Cancelar Item",oDlg,{||CancelItem()}, 85,25,,,.F.,.T.,.F.,,.F.,,,.F. )
  oCancelar := TButton():New( 235, 547, "Cancelar",oDlg,{||CancelarVenda()}, 85,25,,,.F.,.T.,.F.,,.F.,,,.F. )
  oCancelar:SetCss( cCssBTCancelar )

  //Informações do vendedor
  oIconeUsu := TBitmap():New(269.5,186.5, 12, 12,, "C:\Users\User\Desktop\ADVPL\teste-git\Up\PDV\img\iconeUsuario.svg", .T., oDlg,,, .F., .F.,,, .F.,, .T.,, .F.)
  oIconeUsu:lStretch:= .T.
  oGetVendedor := TGet():New( 267,206,{||cNomeVend},oDlg,190,15,,,0,,,.F.,,.T.,,.F.,,.F.,.F.,,.T.,.F.,,cNomeVend)
  oVendedor:= TGroup():New(265,177,287,412,,oDlg,,,.T.)

  //Informações do cliente
  oIconeLupaCli := TBitmap():New(299.5,186.5, 12, 12,, "C:\Users\User\Desktop\ADVPL\teste-git\Up\PDV\img\iconeLupa.svg", .T., oDlg,{|| CliConsPadrao()},, .F., .F.,,, .F.,, .T.,, .F.)
  oIconeLupaCli:lStretch:= .T.
  oGetPesquisaCli := TGet():New( 298,205,{||cNomeCliente},oDlg,190,15,,,0,,,.F.,,.T.,,.F.,,.F.,.F.,,.T.,.F.,,cNomeCliente)
  oGetPesquisaCli:cPlaceHold := 'Pesquisa Cliente...'
  oCliente:= TGroup():New(295,177,317,412,,oDlg,,,.T.)

  //Resumo da venda
  oSubTotal:= TSay():New(270,423,{|| "<h4> SubTotal: R$ "+Strtran(Str(nSubTotal,,2),'.',',')+"</h4>"},oDlg,,,,,,.T.,,,102,12,,,,,,.T.)
  oDescontoTotal := TSay():New(270,525,{|| "<h4> Desconto: R$ "+Strtran(Str(nDesconto,,2),'.',',')+"</h4>"},oDlg,,,,,,.T.,,,102,12,,,,,,.T.,1,2)
  oTotal:= TSay():New(287,422,{|| "<h1>R$ "+Strtran(Str(nTotal,,2),'.',',')+"</h1>"},oDlg,,,,,,.T.,,,205,25,,,,,,.T.,2,2)
  oTotal:SetCss( cCssTotal )
  oResumo:= TGroup():New(265,418,317,633,,oDlg,,,.T.)

  //Lista de produtos na venda
  oListaProduto:= TGroup():New(7,177,229,632,,oDlg,,,.T.)
  oInfoEstVal  := TGrid():New( oDlg, 12, 182, 445, 207)
  oInfoEstVal:AddColumn( 1, "Cod", 75, CONTROL_ALIGN_LEFT,.T.)
  oInfoEstVal:AddColumn( 2, "Produto", 325, CONTROL_ALIGN_LEFT,.T.)
  oInfoEstVal:AddColumn( 3, "Qtde", 50, 0,.T.)
  oInfoEstVal:AddColumn( 4, "Valor Unit", 100, 0,.T.)
  oInfoEstVal:AddColumn( 5, "Sub Total", 100, 0,.T.)
  oInfoEstVal:AddColumn( 6, "Desconto", 100, 0,.T.)
  oInfoEstVal:AddColumn( 7, "Total", 140, 0,.T.)
  oInfoEstVal:setRowData( 1, {|| {space(75), space(325),space(50) ,space(100),space(100),space(100),space(140)}})
  oInfoEstVal:setRowHeight(10)
  oInfoEstVal:lShowGrid:=.F.
  
  oDlg:Activate(,,,,,,)
Return 

//Consulta padrão do produto
Static Function ProdConsPadrao()
  Local aArea   := GetArea()

  DbSelectArea("SB1")
  If ConPad1(,,,"SB1",,,.F.)//Função de Consulta padrão na tabela de produto
      BuscaProduto(SB1->B1_COD,0)
  EndIf
  
  DbCloseArea()
  RestArea(aArea)
Return

//Consulta padrão do cliente
Static Function CliConsPadrao()
  Local aArea   := GetArea()

  DbSelectArea("SA1")
  If ConPad1(,,,"SA1",,,.F.)//Função de Consulta padrão na tabela de cliente
      cNomeCliente:= SA1->A1_NOME
      cCodCli:= SA1->A1_COD
  EndIf

  DbCloseArea()
  RestArea(aArea)
Return

//Buscando produto*
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
  Local nLinha := len(aListaProduto)
  
  //Incluindo no Grid
  nCount++
  oInfoEstVal:setRowData( nCount, {|| {aListaProduto[nLinha][1], aListaProduto[nLinha][2],cValToChar(aListaProduto[nLinha][3]) ,'R$'+alltrim(StrTran(Str(aListaProduto[nLinha][7],,2),'.',',')),'R$ '+alltrim(StrTran(Str(aListaProduto[nLinha][8],,2),'.',',')),'R$ '+alltrim(StrTran(Str(aListaProduto[nLinha][9],,2),'.',',')),'R$ '+alltrim(StrTran(Str(aListaProduto[nLinha][10],,2),'.',','))}})
  oInfoEstVal:setRowColor( nCount, RGB(255,255,255), RGB(136,136,136))

  //Calculando o resumo
  nTotal    += aListaProduto[nLinha][10]
  nSubTotal += aListaProduto[nLinha][8]
Return 

//Cancelar a venda
Static Function CancelarVenda()
  if(MsgyesNo("Deseja realmente cancelar a venda?","Cancelar"))
    if(U_SenhaLibera())//Solicitando a confirmação do supervisor
      LimparPDV()
    else
      FwAlertError("Operação não aprovada pelo Supervisor","Falha")
    endif
  else
    FwAlertError("Operação cancelada pelo usuario","Falha")
  endif
Return

//Limpar todos os campos do PDV
Static Function LimparPDV()
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
  oInfoEstVal:ClearRows()
  oInfoEstVal:setRowData( 1, {|o| {space(75), space(325),space(50) ,space(100),space(100),space(100),space(130)}})
Return

//Aplicar Desconto
Static Function DescontoAplicado()
  Local nDescAprovado 

  if(nSubTotal<>0)
    nDescAprovado := U_AplicaDesc(nSubTotal,nDesconto)//Chamando tela de desconto
    if(nDescAprovado==nil)
      FwAlertError("Desconto não aplicado","Falha")
    else
      nDesconto := nDescAprovado
      nTotal := nSubTotal-nDesconto
      FwAlertSuccess("Desconto aplicado com sucesso!","Sucesso")
    endif
  else
    FwAlertInfo("Não a Itens no carrinho","Informação")
  endif
Return

//Cancelar um item
Static Function CancelItem()
  Local aTEste := oInfoEstVal:GetCursorPos()//Pegando a linha selecionada

  if(aTEste[1]<>0)
    if(MsgyesNo("Deseja realmente excluir o item "+cValToChar(aTEste[1])+"?"+CRLF+aListaProduto[aTEste[1]][2]+CRLF,"Confirmação exclusão"))  

      if(U_SenhaLibera())//Solicitando a liberação pelo supervisor
        //Excluindo o item da array e refazendo o grid
        aDel(aListaProduto , aTEste[1])
        aSize(aListaProduto,len(aListaProduto)-1)
        RefazList()
        FwAlertSuccess("Item Cancelado com sucesso!","Sucesso")
      else
        FwAlertError("Operação não aprovada pelo Supervisor","Falha")
      endif
    endif
  else
    FwAlertInfo("Para dar continuidade no processo por favor selecione um item!"+CRLF,"Informação")
  endif
Return

//refazer a lista de produto na venda
Static Function RefazList()
  Local nLinha

  //Limpando a grid
  oInfoEstVal:ClearRows()
  oInfoEstVal:setRowData( 1, {|o| {space(75), space(325),space(50) ,space(100),space(100),space(100),space(130)}})

  //Zerando o Resumo
  nTotal        := 0
  nSubTotal     := 0
  nDesconto     := 0
    
  //Preenchendo o Grid
  for nLinha:=1 to len(aListaProduto)
    oInfoEstVal:setRowData( nLinha, {|| {aListaProduto[nLinha][1], aListaProduto[nLinha][2],cValToChar(aListaProduto[nLinha][3]) ,'R$'+alltrim(StrTran(Str(aListaProduto[nLinha][7],,2),'.',',')),'R$ '+alltrim(StrTran(Str(aListaProduto[nLinha][8],,2),'.',',')),'R$ '+alltrim(StrTran(Str(aListaProduto[nLinha][9],,2),'.',',')),'R$ '+alltrim(StrTran(Str(aListaProduto[nLinha][10],,2),'.',','))}})
    oInfoEstVal:setRowColor( nLinha, RGB(255,255,255), RGB(136,136,136))
    nTotal    += aListaProduto[nLinha][10]
    nSubTotal += aListaProduto[nLinha][8]
  next nLinha
Return

//Função para finalizar a venda
Static Function FinalizaVenda()
  if(len(aListaProduto)>0)
    if(U_FinalizarVenda(nTotal,nDesconto,nSubTotal))
      if(MsgyesNo('Deseja Imprimir o Cupom Fiscal','Cupom Fiscal'))
        FwAlertSuccess('Cupom Fiscal enviado para a Impressora','Sucesso')
      endif
      LimparPDV()
    endif
  else
    FwAlertError("Não existe produtos no carrinho","Falha")
  endif
Return 
