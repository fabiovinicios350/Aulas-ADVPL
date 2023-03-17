//Biblioteca
#INCLUDE 'TOTVS.CH'

//Constantes
#DEFINE cTITULO 'Algoritimos para aplicar desconto'
#DEFINE cTITULODLG 'Desconto' 

//Cor
#DEFINE COR_FUNDO_PADRAO RGB(216,216,216)
#DEFINE CLR_TEXTO RGB(136,136,136)

//Função para definir o desconto de uma venda
User Function AplicaDesc(nValTotal,nDesc)

  //CSS
  Local cCssDlgDesconto :=;
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

  //Variaveis de entrada
  Private cDesc         := space(30)
  Private cPor          := space(30)
  
  //Variaveis Global
  Private oDlgAplicaDesc
  Private nDesconto
  Private nRes

  //Verificar se ja existe um desconto
  if(nDesc>0)
    cDesc:= "R$ "+cValToChar(nDesc)
    cPor:= cValToChar((nDesc*100)/nValTotal)
  endif

  //Janela do PDV
  oDlgAplicaDesc := TDialog():New(0,0,145,252,cTITULODLG,,,,,CLR_TEXTO,COR_FUNDO_PADRAO,,,.T.)
  oDlgAplicaDesc:SetCss( cCssDlgDesconto )

  //Imput para informar a porcentagem de desconto
  oIconeLupa := TBitmap():New(12,15, 8, 8,, "C:\TOTVS12\Protheus\img\Porcentagem_icons.png", .T., oDlgAplicaDesc,{|| ProdConsPadrao()},, .F., .F.,,, .F.,, .T.,, .F.)
  oIconeLupa:lStretch:= .T.
  oGetDesconto := TGet():New( 8,28,{|u| If( PCount() == 0, cPor, cPor:=u )},oDlgAplicaDesc,92,13,"@E 999",,0,,,.F.,,.T.,,.F.,,.F.,.F.,{||  CalcDesc(val(cPor),nValTotal)},.F.,.F.,,cPor,,,,)
  oGetDesconto:cPlaceHold := 'Desconto'
  oPorcentagem:= TGroup():New(8,8,23,120,,oDlgAplicaDesc,,,.T.)

  //Imput para mostrar o valor do desconto
  oIconeLupa := TBitmap():New(33,13, 10, 10,, "C:\TOTVS12\Protheus\img\desconto_Icons.png", .T., oDlgAplicaDesc,{|| ProdConsPadrao()},, .F., .F.,,, .F.,, .T.,, .F.)
  oIconeLupa:lStretch:= .T.
  oGetValDesc := TGet():New( 31,28,{|u| If( PCount() == 0, cDesc, cDesc:=u )},oDlgAplicaDesc,92,13,,,0,,,.F.,,.T.,,.F.,,.F.,.F.,,.T.,.F.,,cDesc,,,,)
  oGetValDesc:cPlaceHold := 'Valor do desconto'
  oDesconto:= TGroup():New(31,8,46,120,,oDlgAplicaDesc,,,.T.)

  //Botões para finalizar o processo
  oCancelaLibera := TButton():New( 54, 8, "Cancelar",oDlgAplicaDesc,{||oDlgAplicaDesc:End()}, 53,15,,,.F.,.T.,.F.,,.F.,,,.F. )
  oLiberar := TButton():New( 54, 68, "Aplicar",oDlgAplicaDesc,{||AplicDesc(nValTotal)}, 53,15,,,.F.,.T.,.F.,,.F.,,,.F. )
  oLiberar:SetCss( cCssAplica )

  oDlgAplicaDesc:Activate(,,,.T.,,,)
Return nRes

//Função para calculcar o desconto
Static Function CalcDesc(nPorc,nValor)
  cDesc:= "R$ "+cValToChar((nPorc/100)*nValor)
  nDesconto:= (nPorc/100)*nValor
Return 

//Função para validar e aplicar o desconto
Static Function AplicDesc(nValor)
  Local lAprova := .T.

  if ((nDesconto*100)/nValor)>10
    lAprova := U_SenhaLibera()
  endif

  if lAprova
    nRes := nDesconto
    oDlgAplicaDesc:End()
  else
    FwAlertError("Desconto não aprovado pelo Supervidor","Não aprovado")
  endif

Return 

