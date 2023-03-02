//Biblioteca
#INCLUDE 'TOTVS.CH'

//Constantes
#DEFINE cTITULO 'Algoritimos simular um jogo de labirinto'

/*/
  @author Fabio
  @since 24/02/2023
/*/


User Function JogoLabirinto()
  Local cTituloDlg  := 'Soma, Diferença, produto e quociente' 
  Local oDlg
  Private nLagura := 30

  FwAlertInfo(cTITULO,"Bem vindo!")

  DEFINE MSDIALOG oDlg TITLE cTituloDlg FROM 000, 000 to 300, 180 PIXEL
  @ 010,010 BUTTON "Teste" SIZE 30, 15 ACTION (Resultado()) PIXEL OF oDlg 
  @ nLagura,010 BUTTON "Calcular" SIZE 30, 15 ACTION () PIXEL OF oDlg 


  ACTIVATE MSDIALOG  oDlg CENTERED

Return 

Static Function Resultado()
  nLagura+=100
return
