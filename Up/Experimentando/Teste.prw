#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

/*/
  @author Fabio
  @since 03/03/2023
/*/

//Função para a criação dos componentes da Home
User Function TesteFabio10()

  //Constantes
  #DEFINE cTITULO 'Algoritimo para teste'
  #DEFINE cTITULODLG 'Algoritimo para teste' 
  //Cor
  #DEFINE COR_FUNDO_PADRAO RGB(216,216,216)
  #DEFINE CLR_TEXTO RGB(136,136,136)

  //Variaveis Global
  Local cTextHtml := " <p><img src='https://logodownload.org/wp-content/uploads/2019/12/totvs-logo.png' width='117' height='38'/></p> "
  Private oDlg
  Private cUrlProduto   := "https://logodownload.org/wp-content/uploads/2019/12/totvs-logo.png"
  Private cCodigoEAN    := "48723198417242987448217"
  


  PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SB1' MODULO 'COM'

  oDlg := TDialog():New(0,0,644,1274,cTITULODLG,,,,,CLR_TEXTO,COR_FUNDO_PADRAO,,,.T.)

  oSay := TSay():New(01,01,{||cTextHtml},oDlg,,,,,,.T.,,,400,300,,,,,,.T.)

  oFotoProduto := TBitmap():New(150,49, 80, 80, NIL, cUrlProduto, .T., oDlg,, NIL, .F., .F., NIL, NIL, .F., NIL, .T., NIL, .F.)
  oFotoProduto:lStretch:= .T.

  oFinalizar := TButton():New( 235, 177, "Alterar",oDlg,{|| Teste()}, 85,25,,,.F.,.T.,.F.,,.F.,,,.F. )

  oDlg:Activate(,,,,,,)
Return 


static Function Teste()
  cUrlProduto:= "C:\TOTVS12\PROTHEUS\IMG\IMG-PRODUTOS\APPLE WATCH SERIES 4 PRETO.PNG                       "
  cCodigoEAN:= "Deu certo"
  oFotoProduto:Load(,cUrlProduto)
Return
