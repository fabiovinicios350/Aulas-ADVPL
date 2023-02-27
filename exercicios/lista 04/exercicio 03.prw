//Biblioteca
#INCLUDE 'TOTVS.CH'

//Constantes
#DEFINE cTITULO 'Algoritimos para o ajuste do salario do funcionario'

/*/
  @author Fabio
  @since 24/02/2023
/*/


User Function Ex03List04()
  Local nSalario      := 0
  Local nPorcentagem   := 0
  Local cTituloDlg    := 'Ajuste salarial' 
  Local oDlg
  Private cRes
  Private cResultado


  FwAlertInfo(cTITULO,"Bem vindo!")

  DEFINE MSDIALOG oDlg TITLE cTituloDlg FROM 000, 000 to 250, 180 PIXEL

  @ 14, 10 SAY "Salario mensal: " SIZE 70, 07 OF oDlg PIXEL
  @ 22, 10 MSGET nSalario SIZE 70, 11 OF oDlg PIXEL PICTURE'@E 9,999,999.99'

  @ 45, 10 SAY "Porcentage de aumento %: " SIZE 70, 07 OF oDlg PIXEL
  @ 53, 10 MSGET nPorcentagem SIZE 70, 11 OF oDlg PIXEL PICTURE'@E 999.99'

  @ 075,010 BUTTON "Calcular" SIZE 30, 15 ACTION (Resultado(nSalario,nPorcentagem)) PIXEL OF oDlg 
  @ 075,050 BUTTON "Sair" SIZE 30, 15 ACTION (oDlg:End()) PIXEL OF oDlg 

  @ 100, 30 SAY cResultado SIZE 90, 07 OF oDlg PIXEL
  @ 110, 010 SAY cRes SIZE 110, 07 OF oDlg PIXEL


  ACTIVATE MSDIALOG  oDlg CENTERED

Return 

Static Function Resultado(nSalario,nPorcentagem)

  cResultado := 'RESULTADO'
  cRes := "Novo Salario: R$ "+cValToChar(ROUND((nSalario+(nSalario*(nPorcentagem/100))),2))

return
