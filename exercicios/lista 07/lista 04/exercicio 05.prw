//Biblioteca
#INCLUDE 'TOTVS.CH'

//Constantes
#DEFINE cTITULO 'Algoritimos para calcular o valor a pagar do aluguel do carro.'

/*/
  @author Fabio
  @since 24/02/2023
/*/

//Função para descobrir o valor a pagar de uma aluguel de carro
User Function Ex05List04()

  //Variaveis globais
  Local cTituloDlg    := 'Aluguel do carro' 
  Local oDlg

  //Variaveis de entrada
  Local nKM      := 0
  Local nDias   := 0
  
  //Variaveis de resultado
  Private cRes
  Private cResultado


  FwAlertInfo(cTITULO,"Bem vindo!")

  DEFINE MSDIALOG oDlg TITLE cTituloDlg FROM 000, 000 to 260, 180 PIXEL

  //Componentes de entrada
  @ 14, 10 SAY "Quantidade de KM percorrido: " SIZE 70, 07 OF oDlg PIXEL
  @ 22, 10 MSGET nKM SIZE 70, 11 OF oDlg PIXEL PICTURE '@E 999999.999'

  @ 45, 10 SAY "Quantidade de dias: " SIZE 70, 07 OF oDlg PIXEL
  @ 53, 10 MSGET nDias SIZE 70, 11 OF oDlg PIXEL PICTURE'@E 999'

  @ 075,010 BUTTON "Calcular" SIZE 30, 15 ACTION (ValoraPagar(nKM,nDias)) PIXEL OF oDlg 
  @ 075,050 BUTTON "Sair" SIZE 30, 15 ACTION (oDlg:End()) PIXEL OF oDlg 

  //Componentes para exibir o resultado
  @ 100, 30 SAY cResultado SIZE 90, 07 OF oDlg PIXEL
  @ 110, 010 SAY cRes SIZE 110, 90 OF oDlg PIXEL

  ACTIVATE MSDIALOG  oDlg CENTERED
Return 


//Função para calcular o valor a pagar
Static Function ValoraPagar(nKM,nDias)
  cResultado := 'RESULTADO'
  cRes := "Valor a Pagar: R$ "+cValToChar(ROUND((nKM*0.15+nDias*60),2))
return
