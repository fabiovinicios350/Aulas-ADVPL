//Biblioteca
#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

//Constantes
#DEFINE cTITULO 'Algoritimo para finalizar a venea'
#DEFINE cTITULODLG 'Finalizar Venda' 

//Cor
#DEFINE COR_FUNDO_PADRAO_FINALIZAR RGB(175,175,175)
#DEFINE CLR_TEXTO_FINALIZAR RGB(129,129,129)

/*/
  @author Fabio
  @since 03/03/2023
/*/

//Função que Mostrar o resumo da venda
User Function FinalizarVenda(nValTotal,nDescontoVenda,nSubTotalVenda)

  //CSS
  Local cCssDlgFinalizar :=;
  "TGroup {"+;
    "background: #F0F0F0;"+;
    "border: none;"+;
    "border-radius: 8px;"+; 
    "box-shadow: 10px 10px;"+;
  "}"+;
  "QLabel {"+;
    "background: #F0F0F0;"+;
    "border: none;"+;
    "font: normal 16px Arial;"+;
    "color: #626262;"+;
  "}"+;
  "QLineEdit {"+;
    "background: #fff;"+;
    "font: normal 16px Arial;"+;
    "border: none;"+;
    "border-radius: 8px;"+; 
    "color: #A5A5A5;"+;
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

  Local cCssBTPagar :=;
  "QPushButton {"+;
    "background: #A3CDA7;"+;
    "color: #438B4A;"+;
  "}"

  Local cCssBTCancelar :=;
  "QPushButton {"+;
    "background: #ECB7B7;"+;
    "color: #CD0000;"+;
  "}"

  Local cCssValorApagar :=;
  "QLabel {"+;
    "font: normal 18px Arial;"+;
  "}"

  Local cCssResumo :=;
  "QLabel {"+;
    "font: normal 13px Arial;"+;
  "}"

  Local cCssPago :=;
  "QLabel {"+;
    "font: normal 13px Arial;"+;
    "color: #438B4A;"+;
  "}"

  Local cCssAPagar :=;
  "QLabel {"+;
    "font: normal 13px Arial;"+;
    "color: #CD0000;"+;
  "}"

  //Variaveis Globais
  Private lRetorno    := .T.
  Private nValorTotal := nValTotal
  Private nDesc       := nDescontoVenda
  Private nSubValor   := nSubTotalVenda

  //Variaveis de entrada
  Private nCredito      := 0
  Private nDebito       := 0
  Private nDinheiro     := 0
  Private nPix          := 0

  //Variaveis apresentação
  Private nTroco        := 0
  Private nPago         := 0
  Private nValorApagar  := nValorTotal-nPago



  //Conexão com o banco de dados
  PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SB1' MODULO 'COM'

  //Janela de finalizar
  oJanelaFimDlg := TDialog():New(0,0,644,1274,cTITULODLG,,,,,CLR_TEXTO_FINALIZAR,COR_FUNDO_PADRAO_FINALIZAR,,,.T.); oJanelaFimDlg:SetCss( cCssDlgFinalizar )

  //Componentes Resumo
  oTituloApagar := TSay():New(35,235,{||"<h4>Valor da Compra</h4>"},                            oJanelaFimDlg,,,,,,.T.,,,160,10,,,,,,.T.,2,2)
  oValorApagar  := TSay():New(45,235,{||"<h1>R$ "+StrTran(Str(nValorTotal,,2),'.',',')+'</h1>'},oJanelaFimDlg,,,,,,.T.,,,160,25,,,,,,.T.,2,2);oValorApagar:SetCss( cCssValorApagar )

  oSubTotal     := TSay():New(80,235,{||"<b>Sub Total:</b>"},                                oJanelaFimDlg,,,,,,.T.,,,035,8,,,,,,.T.,0,2);oSubTotal:SetCss( cCssResumo )
  oValSubTotal  := TSay():New(80,275,{||"<b>R$ "+StrTran(Str(nSubValor,,2),'.',',')+'</b>'}, oJanelaFimDlg,,,,,,.T.,,,120,8,,,,,,.T.,0,2);oValSubTotal:SetCss( cCssResumo )

  oDesconto     := TSay():New(92,235,{||"<b>Desconto:</b>"},oJanelaFimDlg,,,,,,.T.,,,35,8,,,,,,.T.,0,2); oDesconto:SetCss( cCssResumo )
  oValDesconto  := TSay():New(92,275,{||"<b>R$ "+StrTran(Str(nDesc,,2),'.',',')+'</b>'},oJanelaFimDlg,,,,,,.T.,,,120,8,,,,,,.T.,0,2); oValDesconto:SetCss( cCssResumo )

  //Opções de pagamento
  oCredito      := TSay():New(115,235,{||"<b>Credito: </b>"}, oJanelaFimDlg,,,,,,.T.,,,45,17,,,,,,.T.,0,2)
  oCredito      := TSay():New(140,235,{||"<b>Debito: </b>"},  oJanelaFimDlg,,,,,,.T.,,,45,17,,,,,,.T.,0,2)
  oCredito      := TSay():New(165,235,{||"<b>Dinheiro: </b>"},oJanelaFimDlg,,,,,,.T.,,,45,17,,,,,,.T.,0,2)
  oCredito      := TSay():New(190,235,{||"<b>PIX: </b>"},     oJanelaFimDlg,,,,,,.T.,,,45,17,,,,,,.T.,0,2)
  
  //Valores para cada opção de pagamento
  oValCredito   := TGet():New(115,280,{|u| If( PCount() == 0, nCredito, nCredito:=u )},   oJanelaFimDlg,115,15,"@E R$                        999,999.99",{|| ValidaValor(@nCredito,0)}, 0,,,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,'nCredito' ,,,,.T.)
  oValDebito    := TGet():New(140,280,{|u| If( PCount() == 0, nDebito, nDebito:=u )},     oJanelaFimDlg,115,15,"@E R$                        999,999.99",{|| ValidaValor(@nDebito,0)},  0,,,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,'nDebito'  ,,,,.T.)
  oValDinheiro  := TGet():New(165,280,{|u| If( PCount() == 0, nDinheiro, nDinheiro:=u )}, oJanelaFimDlg,115,15,"@E R$                        999,999.99",{|| ValidaValor(@nDinheiro,1)},0,,,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,'nDinheiro',,,,.T.)
  oValPix       := TGet():New(190,280,{|u| If( PCount() == 0, nPix, nPix:=u )},           oJanelaFimDlg,115,15,"@E R$                        999,999.99",{|| ValidaValor(@nPix,0)},     0,,,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,'nPix'     ,,,,.T.)
  
  //Resumo pagamento
  oTroco        := TSay():New(220,236,{||"<b>Troco:</b>"},                                      oJanelaFimDlg,,,,,,.T.,,,45,08,,,,,,.T.,0,2); oTroco:SetCss( cCssResumo )
  oValTroco     := TSay():New(220,280,{||"<b>R$ "+StrTran(Str(nTroco,,2),'.',',')+'</b>'},      oJanelaFimDlg,,,,,,.T.,,,115,8,,,,,,.T.,1,2); oValTroco:SetCss( cCssResumo )

  oApagar       := TSay():New(235,236,{||"<b>Valor a Pagar:</b>"},                              oJanelaFimDlg,,,,,,.T.,,,45,08,,,,,,.T.,0,2); oApagar:SetCss( cCssAPagar )
  oValApagar    := TSay():New(235,280,{||"<b>R$ "+StrTran(Str(nValorApagar,,2),'.',',')+'</b>'},oJanelaFimDlg,,,,,,.T.,,,115,8,,,,,,.T.,1,2); oValApagar:SetCss( cCssAPagar )

  oPago         := TSay():New(245,236,{||"<b>Valor pago:</b>"},                                 oJanelaFimDlg,,,,,,.T.,,,45,20,,,,,,.T.,0,2); oPago:SetCss( cCssPago )
  oValTPago     := TSay():New(245,280,{||"<h2>R$ "+StrTran(Str(nPago,,2),'.',',')+'</h2>'},     oJanelaFimDlg,,,,,,.T.,,,115,20,,,,,,.T.,1,2); oValTPago:SetCss( cCssPago )

  //Opções de execução
  oCancelar := TButton():New( 272, 235, "Cancelar",oJanelaFimDlg,{|| CancelarPagamento()}, 75,20,,,.F.,.T.,.F.,,.F.,,,.F. ); oCancelar:SetCss( cCssBTCancelar )
  oPagar    := TButton():New( 272, 320, "Pagar",oJanelaFimDlg,{|| Pagar()}, 75,20,,,.F.,.T.,.F.,,.F.,,,.F. ); oPagar:SetCss( cCssBTPagar )

  oGrupo := TGroup():New(25,227,300,402,,oJanelaFimDlg,,,.T.)

  oJanelaFimDlg:Activate(,,,,,,)
Return lRetorno

/*/{Protheus.doc} ValidaValor
  Função para validar o valor informado pelo usuario
  @type  Static
  @author Fabio
  @since 11/04/2023
  @param nValor, Numerico, Valor do campo
  @param nTipo, Numerico, Tipo de validação(1=Permitir troco, 0=Não permitir troco)
/*/
Static Function ValidaValor(nValor, nTipo)
  Local nSoma     := nCredito+nDebito+nDinheiro+nPix
  
  if nValor>0
    if ((nSoma)>nValorTotal)
      if(nTipo==1) //Atualizando o troco
        nTroco:= (nSoma)-nValorTotal
      else
         //Atualizando o campo
        nValor    := 0
        nSoma     := nCredito+nDebito+nDinheiro+nPix

        //Atualizando o troco
        if(nSoma>=nValorTotal)
          nTroco:= (nSoma)-nValorTotal
        else
          nTroco:=0
        endif
        FwAlertError("Valor informado ultrapassa o valor apagar!","Falha")
      endif
    elseif (nTipo==1) //Atualizando o troco para a opçao de dinheiro
      nTroco:= 0
    endif
  elseif nValor<>0 //Verificar se é um valor negativo
    
    //Atualizando o campo
    nValor    := 0
    nSoma     := nCredito+nDebito+nDinheiro+nPix

    //Atualizando o troco
    if(nSoma>=nValorTotal)
      nTroco:= (nSoma)-nValorTotal
    else
      nTroco:=0
    endif
    FwAlertError("Valor não pode ser negativo!","Falha")
  endif

  //Atualizar os valores pagos e valores a pagar
  nPago:=nCredito+nDebito+nDinheiro+nPix
  if(nValorTotal-nPago<0)
    nValorApagar:= 0
  else
    nValorApagar:=nValorTotal-nPago
  endif
Return

//Função para cancelar a operação
Static Function CancelarPagamento()
  if(MsgyesNo('Deseja Realmente cancelar a operação?','Confirmação de cancelamento'))
    lRetorno := .F.
    oJanelaFimDlg:End()
  endif
Return 

//Função para executar o pagamento
Static Function Pagar()
  if nValorApagar==0
    if(MsgyesNo('Deseja Realmente Finalziar a venda?','Confirmação do pagamento'))
      GravaVenda()
      lRetorno := .T.
      oJanelaFimDlg:End()
    endif
  else
    FwAlertErro('Existe um saldo a pagar em aberto!'+CRLF+'Valor a pagar: R$ '+StrTran(Str(nValorApagar,,2),'.',','),'Saldo')
  endif
Return 

//Função para Grava os valores informados na venda
Static Function GravaVenda()
  nCreditoVend    := nCredito
  nPIXVend        := nPix
  nDebitoVend     := nDebito
  nDinheiroVend   := nDinheiro
  nTrocoVend      := nTroco
  FwAlertSuccess('Venda Finalzada com sucesso','Sucesso')
Return
