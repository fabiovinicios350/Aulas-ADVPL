//Biblioteca
#INCLUDE 'TOTVS.CH'

//Constantes
#DEFINE cTITULO 'Algoritimos para o ajuste do salario do funcionario'

/*/
  @author Fabio
  @since 24/02/2023
/*/

//Função para criar a interface de ajuste do salario
User Function Ex03List04()
  
  //Variaveis globais
  Local nSalario      := 0
  Local nPorcAjust   := 0
  Local cTituloDlg    := 'Ajuste salarial' 
  Local oDlg

  //Variaveis para o resultado
  Private cRes
  Private cTituloRes

  FwAlertInfo(cTITULO,"Bem vindo!")

  DEFINE MSDIALOG oDlg TITLE cTituloDlg FROM 000, 000 to 250, 180 PIXEL

  //Componentes para receber os valores
  @ 14, 10 SAY "Salario mensal: " SIZE 70, 07 OF oDlg PIXEL
  @ 22, 10 MSGET nSalario SIZE 70, 11 OF oDlg PIXEL PICTURE'@E 9,999,999.99'

  @ 45, 10 SAY "Porcentage de aumento %: " SIZE 70, 07 OF oDlg PIXEL
  @ 53, 10 MSGET nPorcAjust SIZE 70, 11 OF oDlg PIXEL PICTURE'@E 999.99'

  @ 075,010 BUTTON "Calcular" SIZE 30, 15 ACTION (Resultado(nSalario,nPorcAjust)) PIXEL OF oDlg 
  @ 075,050 BUTTON "Sair" SIZE 30, 15 ACTION (oDlg:End()) PIXEL OF oDlg 

  //Componentes para apresentar o resultado
  @ 100, 30 SAY cTituloRes SIZE 90, 07 OF oDlg PIXEL
  @ 110, 010 SAY cRes SIZE 110, 07 OF oDlg PIXEL

  ACTIVATE MSDIALOG  oDlg CENTERED
Return 


//Função para apresentar o resultado
Static Function Resultado(nSalario,nPorcAjust)
  cTituloRes := 'RESULTADO'
  cRes := "Novo Salario: R$ "+cValToChar(ROUND((nSalario+(nSalario*(nPorcAjust/100))),2))//Calculo do ajuste
return
