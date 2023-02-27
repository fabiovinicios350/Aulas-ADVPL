//Biblioteca
#INCLUDE 'TOTVS.CH'

//Constantes
#DEFINE cTITULO 'Algoritimos para calcular a quantidade de tinta utilizada para pintar uma parede!'

/*/
  @author Fabio
  @since 24/02/2023
/*/


User Function Ex04List04()
  Local nLargura      := 0
  Local nAltura   := 0
  Local cTituloDlg    := 'Area' 
  Local oDlg
  Private cArea
  Private nArea
  Private cQuantidade
  Private cResultado


  FwAlertInfo(cTITULO,"Bem vindo!")

  DEFINE MSDIALOG oDlg TITLE cTituloDlg FROM 000, 000 to 260, 180 PIXEL

  @ 14, 10 SAY "Digite a largura da parede: " SIZE 70, 07 OF oDlg PIXEL
  @ 22, 10 MSGET nLargura SIZE 70, 11 OF oDlg PIXEL PICTURE '@E 999999.999'

  @ 45, 10 SAY "Digite a altura da parede: " SIZE 70, 07 OF oDlg PIXEL
  @ 53, 10 MSGET nAltura SIZE 70, 11 OF oDlg PIXEL PICTURE'@E 999999.999'

  @ 075,010 BUTTON "Calcular" SIZE 30, 15 ACTION (Resultado(nLargura,nAltura)) PIXEL OF oDlg 
  @ 075,050 BUTTON "Sair" SIZE 30, 15 ACTION (oDlg:End()) PIXEL OF oDlg 

  @ 100, 30 SAY cResultado SIZE 90, 07 OF oDlg PIXEL
  @ 110, 010 SAY cArea SIZE 110, 07 OF oDlg PIXEL
  @ 120, 010 SAY cQuantidade SIZE 110, 07 OF oDlg PIXEL


  ACTIVATE MSDIALOG  oDlg CENTERED

Return 

Static Function Resultado(nLargura,nAltura)

  nArea := nLargura * nAltura

  cResultado := 'RESULTADO'
  cArea := "Area: R$ "+cValToChar(ROUND((nArea),2))
  cQuantidade := "Quantidade de Tinta:"+cValToChar(ROUND((nArea*2),2))

return
