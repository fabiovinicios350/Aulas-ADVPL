//Biblioteca
#INCLUDE 'TOTVS.CH'

//Constantes
#DEFINE cTITULO 'Algoritimos para calcular o IMC.'

/*/
  @author Fabio
  @since 24/02/2023
/*/

//Função para descobrir o ICM
User Function Ex08List04()

  //Variaveis de entrada
  Local nPeso      := 0
  Local nAltura      := 0

  //Variaveis globais
  Local cTituloDlg    := 'Calculo IMC' 
  Local oDlg

  //Variaveis para exibir o resultado
  Private nIMC
  Private cRes
  Private cTituloRes

  FwAlertInfo(cTITULO,"Bem vindo!")

  DEFINE MSDIALOG oDlg TITLE cTituloDlg FROM 000, 000 to 260, 180 PIXEL
  //Componentes de entrada
  @ 14, 10 SAY "Digite o seu Peso: " SIZE 70, 07 OF oDlg PIXEL
  @ 22, 10 MSGET nPeso SIZE 70, 11 OF oDlg PIXEL PICTURE '@E 999999.999'

  @ 45, 10 SAY "Digite a sua altura: " SIZE 70, 07 OF oDlg PIXEL
  @ 53, 10 MSGET nAltura SIZE 70, 11 OF oDlg PIXEL PICTURE'@E 999999.999'

  @ 075,010 BUTTON "Calcular" SIZE 30, 15 ACTION (CalcIcm(nPeso,nAltura)) PIXEL OF oDlg 
  @ 075,050 BUTTON "Sair" SIZE 30, 15 ACTION (oDlg:End()) PIXEL OF oDlg 

  //Componentes para apresentar o resultado
  @ 100, 30 SAY cTituloRes SIZE 90, 07 OF oDlg PIXEL
  @ 110, 010 SAY cRes SIZE 110, 90 OF oDlg PIXEL

  ACTIVATE MSDIALOG  oDlg CENTERED
Return 

//Função para calculcar o IMC
Static Function CalcIcm(nPeso,nAltura)

  nIMC := nPeso/(nAltura*nAltura)//Calculo ICM
    
  if (nIMC<18.5)
    cRes := "Magreza - Obes. (Grau): 0"
  elseif (nIMC>=18.5 .and. nIMC<=24.9)
    cRes := "Normal - Obes. (Grau): 0"
  elseif (nIMC>=25.0 .and. nIMC<=29.0)
    cRes := "Sobrepeso - Obes. (Grau): I"
  elseif (nIMC>=30.0 .and. nIMC<=39.9)
    cRes := "Obesidade - Obes. (Grau): II"
  else
    cRes := "Obes. Grave - Obes. (Grau): III"
  endif
return
