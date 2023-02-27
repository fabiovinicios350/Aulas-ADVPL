//Biblioteca
#INCLUDE 'TOTVS.CH'

//Constantes
#DEFINE cTITULO 'Algoritimos para efetura uma cotação em dolar'

/*/
  @author Fabio
  @since 24/02/2023
/*/


User Function Ex02List04()
  Local cDolar      := Space(10000)
  Local cQuantidade := Space(10000)
  Local cTituloDlg  := 'Cotação do Dolar' 
  Local oDlg
  Private cRes
  Private cResultado


  FwAlertInfo(cTITULO,"Bem vindo!")

  DEFINE MSDIALOG oDlg TITLE cTituloDlg FROM 000, 000 to 250, 180 PIXEL

  @ 14, 10 SAY "Cotação atual do dolar: " SIZE 70, 07 OF oDlg PIXEL
  @ 22, 10 MSGET cDolar SIZE 70, 11 OF oDlg PIXEL PICTURE'@E 9.99'

  @ 45, 10 SAY "Quantidade de dolar: " SIZE 70, 07 OF oDlg PIXEL
  @ 53, 10 MSGET cQuantidade SIZE 70, 11 OF oDlg PIXEL PICTURE'@E 9999999'

  @ 075,010 BUTTON "Calcular" SIZE 30, 15 ACTION (Resultado(cDolar,cQuantidade)) PIXEL OF oDlg 
  @ 075,050 BUTTON "Sair" SIZE 30, 15 ACTION (oDlg:End()) PIXEL OF oDlg 

  @ 100, 30 SAY cResultado SIZE 30, 07 OF oDlg PIXEL
  @ 110, 010 SAY cRes SIZE 90, 07 OF oDlg PIXEL


  ACTIVATE MSDIALOG  oDlg CENTERED

Return 

Static Function Resultado(cDolar,cQuantidade)

  cResultado := 'Resultado'

  cRes := "Valor em Real: R$ "+cValToChar(val(cDolar) * val(cQuantidade))

return
