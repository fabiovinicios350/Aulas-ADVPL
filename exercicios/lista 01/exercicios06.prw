//Bibliotecas
#INCLUDE "TOTVS.CH"
#INCLUDE "validacao.prw"

/*/
  @author Fabio
  @since 11/02/2023
/*/

User Function ConverterFahrCels()
  
  Local cFahr
  Local nCels

  FwAlertInfo("Algoritimos para converter graus Fahrenheit em Celsius","Bem vindo!")
  RecebeInput(@cFahr,'numerico','Digite a temperatura em graus Fahrenheit: ')

  nCels := (val(cFahr)-32)/1.80000

  FwAlertSuccess('Fahrenheit: '+cFahr+CRLF+;
                'Celsius: '+cValToChar(round(nCels,2)),'Resultado!')

Return 


