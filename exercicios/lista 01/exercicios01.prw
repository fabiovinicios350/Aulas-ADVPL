//Bibliotecas
#INCLUDE "TOTVS.CH"

/*/
  @author Fabio
  @since 10/02/2023
/*/

User Function ValorAntecessor()
  Local nAntec
  Local cValor := ""
  
  FwAlertInfo("Algoritimos para mostrar o numero antecessor","Bem vindo!")
  U_RecebeInput(@cValor,"numerico","Digite um numero: ")

  nAntec := val(cValor)-1

  FwAlertSuccess('Valor informador: '+cValor+CRLF+;
                'Valor antecessor: '+cValToChar(nAntec),'Resultado!')

Return 




