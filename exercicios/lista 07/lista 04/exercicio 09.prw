//Biblioteca
#INCLUDE 'TOTVS.CH'

//Constantes
#DEFINE cTITULO 'Algoritimos para calcular o TMB.'

/*/
  @author Fabio
  @since 24/02/2023
/*/

//Fun��o para descobrir o TMB
User Function Ex09List04()

  //Variaveis de entrada
  Local nPeso      := 0
  Local nAltura      := 0
  Local nIdade      := 0

  //Variaveis globais
  Local cTituloDlg    := 'Calculo IMC' 
  Local oDlg
  Local oOpcao

  //Variaivesi para exibir o resultado
  Private nTMB
  Private cRes
  Private cTituloRes
  Private cResList    := '01'  
  Private aGenero     := {"Homen", "Mulher"}

  FwAlertInfo(cTITULO,"Bem vindo!")

  DEFINE MSDIALOG oDlg TITLE cTituloDlg FROM 000, 000 to 400, 180 PIXEL
  //Componentes de entrada de dados
  @ 14, 10 SAY "Digite o seu Peso: " SIZE 70, 07 OF oDlg PIXEL
  @ 22, 10 MSGET nPeso SIZE 70, 11 OF oDlg PIXEL PICTURE '@E 999999.999'

  @ 45, 10 SAY "Digite a sua altura (cm): " SIZE 70, 07 OF oDlg PIXEL
  @ 53, 10 MSGET nAltura SIZE 70, 11 OF oDlg PIXEL PICTURE'@E 999'

  @ 075, 10 SAY "Digite a sua idade: " SIZE 70, 07 OF oDlg PIXEL
  @ 083, 10 MSGET nIdade SIZE 70, 11 OF oDlg PIXEL PICTURE'@E 999'

  oOpcao  := TComboBox():New(105, 010, {|u| Iif(PCount() > 0 , cResList := u, cResList)}, aGenero, 70, 11, oDlg, , /*bChange*/, /*bValid*/, /*nClrText*/, /*nClrBack*/, .T.,)

  @ 135,010 BUTTON "Calcular" SIZE 30, 15 ACTION (CalcTmb(nPeso,nAltura,nIdade)) PIXEL OF oDlg 
  @ 135,050 BUTTON "Sair" SIZE 30, 15 ACTION (oDlg:End()) PIXEL OF oDlg 

  //Componentes para exibir o resultado
  @ 168, 30 SAY cTituloRes SIZE 90, 07 OF oDlg PIXEL
  @ 178, 010 SAY cRes SIZE 110, 90 OF oDlg PIXEL

  ACTIVATE MSDIALOG  oDlg CENTERED
Return 

 //Fun��o para calculcar o TMB
Static Function CalcTmb(nPeso,nAltura,nIdade)
  if(cResList=="Homen")
    nTMB := 66.5+(13.75*nPeso) + (5.003*nAltura)-(6.75*nIdade)
  else
    nTMB := 655.1+(9.563*nPeso) + (1.850*nAltura)-(4.676*nIdade)
  endif

  cTituloRes := 'RESULTADO'
  cRes := ' TMB: '+cValToChar(Round(nTMB, 2 ))
return


