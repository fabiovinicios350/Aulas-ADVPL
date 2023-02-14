//Bibliotecas
#INCLUDE "TOTVS.CH"

/*/
  @author Fabio
  @since 12/02/2023
/*/

User Function MostrandoInverso()
  local aNumero := {}
  Local cNumero
  Local cMensagem := ''
  Local i

  FwAlertInfo("Algoritimos para imprimir o array invertido","Bem vindo!")

  For i:=1 to 10
    cNumero := ''
    U_RecebeInput(@cNumero,'numerico','Digite um numero: ')
    aadd(aNumero,val(cNumero))
  next i

  For i:=len(aNumero) to 1 step -1
    cMensagem += ' '+cValToChar(aNumero[i])
  next 
  
  FwAlertSuccess('Resultado Invertido: '+cMensagem,'Resultado!')

Return
