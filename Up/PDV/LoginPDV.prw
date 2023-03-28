//Biblioteca
#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

//Constantes
#DEFINE cTITULO 'Algoritimos para fazer o login no PDV
#DEFINE cTITULODLG 'Login'

//Cor
#DEFINE COR_FUNDO_PADRAO RGB(216,216,216)
#DEFINE CLR_TEXTO RGB(136,136,136)

//Função para definir o desconto de uma venda
User Function LoginPDV()
  
  //CSS
  Local cCssLogin :=;
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

  //Variaveis de entrada
  Private cCodVendedor    := space(20)
  Private cNomeReduzido   := space(50)
  Private cLoja           := space(30)
  Private cNomeVendedor
  
  //Variaveis Global
  Private oDlgLoginPdv
  //Conexão com o banco de dados\
  PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SA3' MODULO 'FAT'

  //Janela do PDV
  oDlgLoginPdv := TDialog():New(0,0,145,252,cTITULODLG,,,,,CLR_TEXTO,COR_FUNDO_PADRAO,,,.T.)
  oDlgLoginPdv:SetCss( cCssLogin )

  //Imput para informar o vendedor
  oIconeLupa := TBitmap():New(12,15, 8, 8,, "C:\TOTVS12\Protheus\img\iconeLupa.svg", .T., oDlgLoginPdv,{|| VendConsPadrao()},, .F., .F.,,, .F.,, .T.,, .F.)
  oIconeLupa:lStretch:= .T.
  oGetVendedor := TGet():New( 8,28,{|u| If( PCount() == 0, cNomeReduzido, cNomeReduzido:=u )},oDlgLoginPdv,92,13,,,0,,,.F.,,.T.,,.F.,,.F.,.F.,,.T.,.F.,,cNomeReduzido,,,,)
  oGetVendedor:cPlaceHold := 'Vendedor'
  oVendedor:= TGroup():New(8,8,23,120,,oDlgLoginPdv,,,.T.)

  //Imput para mostrar o valor do desconto
  oIconeLoja := TBitmap():New(33,13, 10, 10,, "C:\TOTVS12\Protheus\img\IconsLoja.png", .T., oDlgLoginPdv,,, .F., .F.,,, .F.,, .T.,, .F.)
  oIconeLoja:lStretch:= .T.
  oGetLoja := TGet():New( 31,28,{|u| If( PCount() == 0, cLoja, cLoja:=u )},oDlgLoginPdv,92,13,"@E 9999",,0,,,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,cLoja,,,,)
  oGetLoja:cPlaceHold := 'Loja'
  oLoja:= TGroup():New(31,8,46,120,,oDlgLoginPdv,,,.T.)

  //Botões para finalizar o processo
  oSair:= TButton():New( 54, 8, "Sair",oDlgLoginPdv,{||oDlgLoginPdv:End()}, 53,15,,,.F.,.T.,.F.,,.F.,,,.F. )
  oEntrar := TButton():New( 54, 68, "Entrar",oDlgLoginPdv,{||Logar()}, 53,15,,,.F.,.T.,.F.,,.F.,,,.F. )
  
  oDlgLoginPdv:Activate(,,,.T.,,,)
Return

//Consulta padrão do vendedor
Static Function VendConsPadrao()
  Local aArea   := GetArea()

  DbSelectArea("SA3")
  If ConPad1(,,,"SA3",,,.F.)//Função de Consulta padrão na tabela de vendedor
      cCodVendedor:= SA3->A3_COD
      cNomeVendedor:= SA3->A3_NOME
      cNomeReduzido:= SA3->A3_NREDUZ
  EndIf
  
  DbCloseArea()
  RestArea(aArea)
Return 

//Função para logar no PDV
Static Function Logar()
    if(alltrim(cNomeVendedor)=='')
      FwAlertError("o vendedor não foi informado","Falha")
    elseif(alltrim(cLoja)=='')
      FwAlertError("A loja nao foi informada","Falha")
    else
      U_HomePdv({cCodVendedor,cNomeVendedor},cLoja)//Chamar o PDV
      oDlgLoginPdv:End()
    endif
Return

