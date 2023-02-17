//Bibliotecas
#INCLUDE "TOTVS.CH"

//Constantes
#DEFINE cTITULO 'Algoritimos para fazer a conversao de dolar para real'

/*/
  @author Fabio
  @since 12/02/2023
/*/

User Function DolarReal()
  Local nDolar
  Local nReal
  local nConversao

  FwAlertInfo(cTITULO,"Bem vindo!")
  
  U_FwInputBoxVal(@nConversao,'N','Digite a cotacao atual de dolar para real: ')
  U_FwInputBoxVal(@nDolar,'N','Digite a quantidade de dolar a ser convertido: ')
  
  nReal := nDolar * nConversao

  FwAlertSuccess('Dolar: '+cValToChar(nDolar)+CRLF+;
                'Real: '+cValToChar(nReal),'Resultado!')
Return
