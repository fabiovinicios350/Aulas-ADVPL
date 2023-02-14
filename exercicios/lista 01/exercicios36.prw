//Bibliotecas
#INCLUDE "TOTVS.CH"

/*/
  @author Fabio
  @since 12/02/2023
/*/

User Function Fatorial()
  Local cNumero
  Local nFat
  Local i

  FwAlertInfo("Algoritimos para calcular o fatorial de um numero","Bem vindo!")

  U_RecebeInput(@cNumero,'numerico','Digite um numero: ')

  nFat := val(cNumero)
  For i:=val(cNumero)-1 to 1 step -1
    nFat *= i
  next 
  
  FwAlertSuccess('O fatorial de '+cNumero+'! e: '+cValToChar(nFat),'Resultado!')

Return
