//Biblioteca
#INCLUDE 'TOTVS.CH'

//Constantes
#DEFINE cTITULO 'Algoritimos para calcular a folha de pagamento'

/*/
  @author Fabio
  @since 27/02/2023
/*/

//Fun��o para simular uma folha de pagamento
User Function Ex10List04()

  //Variaiveis de entrada
  Local nValorHora    := 0
  Local nQuantHora    := 0

  //variaveis globais
  Local cTituloDlg    := 'Folha de pagamento' 
  Local oDlg

  //Vairiaveis para exibir o resultado
  Private cSalarioBruto
  Private cSalarioLiquido
  Private cIR
  Private nPorc
  Private cINSS
  Private cFGTS
  Private cDescontos
  Private cTituloRes

  FwAlertInfo(cTITULO,"Bem vindo!")

  DEFINE MSDIALOG oDlg TITLE cTituloDlg FROM 000, 000 to 350, 180 PIXEL

  //Componentes de entrada
  @ 14, 10 SAY "Valor por Horas trabalhadas: " SIZE 70, 07 OF oDlg PIXEL
  @ 22, 10 MSGET nValorHora SIZE 70, 11 OF oDlg PIXEL PICTURE '@E 999999.99'

  @ 45, 10 SAY "Quantidade de horas trabalhadas: " SIZE 70, 07 OF oDlg PIXEL
  @ 53, 10 MSGET nQuantHora SIZE 70, 11 OF oDlg PIXEL PICTURE'@E 9999'

  @ 075,010 BUTTON "Calcular" SIZE 30, 15 ACTION (CalcFolha(nValorHora,nQuantHora)) PIXEL OF oDlg 
  @ 075,050 BUTTON "Sair" SIZE 30, 15 ACTION (oDlg:End()) PIXEL OF oDlg 

  //Componentes para exibir o resultado
  @ 100, 30 SAY cTituloRes SIZE 90, 07 OF oDlg PIXEL
  @ 110, 010 SAY cSalarioBruto SIZE 110, 07 OF oDlg PIXEL
  @ 120, 010 SAY cIR SIZE 110, 07 OF oDlg PIXEL
  @ 130, 010 SAY cINSS SIZE 110, 07 OF oDlg PIXEL
  @ 140, 010 SAY cFGTS SIZE 110, 07 OF oDlg PIXEL 
  @ 150, 010 SAY cDescontos SIZE 110, 07 OF oDlg PIXEL
  @ 160, 010 SAY cSalarioLiquido SIZE 110, 07 OF oDlg PIXEL

  ACTIVATE MSDIALOG  oDlg CENTERED
Return 


//Fun��o para efetuar os calculor da folha de pagamento
Static Function CalcFolha(nValorHora,nQuantHora)

  cSalarioBruto:= nValorHora*nQuantHora
  cINSS := cSalarioBruto*0.10
  cFGTS := cSalarioBruto*0.11

  if(cSalarioBruto<=1200)
    nPorc := 0
  elseif(cSalarioBruto<=1800) 
    nPorc := 5
  elseif(cSalarioBruto<=2500) 
    nPorc := 10
  else
    nPorc:= 20
  endif

  cIR := cSalarioBruto*(nPorc/100)
  cDescontos := cIR + cINSS
  cSalarioLiquido := cSalarioBruto - cDescontos
  
  cTituloRes := 'RESULTADO'
  cSalarioBruto:= 'Salario bruto: '+cValToChar(cSalarioBruto)
  cIR:= 'IR ('+cValToChar(nPorc)+'%): '+cValToChar(cIR)
  cINSS:= 'INSS (10%): '+cValToChar(cINSS)
  cFGTS:='FGTS (11%): '+cValToChar(cFGTS)
  cDescontos:= 'Total de desconto: '+cValToChar(cDescontos)
  cSalarioLiquido:='Salario liquido: '+cValToChar(cSalarioLiquido)
return


