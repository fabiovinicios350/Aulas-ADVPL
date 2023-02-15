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

  FwAlertInfo(cTITULO,"Bem vindo!")
  
  U_FwInputBoxVal(@nDolar,'N','Digite o primeiro numero')
  
  nReal := nDolar * 5.22

  FwAlertSuccess('Dolar: '+cValToChar(nDolar)+CRLF+;
                'Real: '+cValToChar(nReal),'Resultado!')
Return
