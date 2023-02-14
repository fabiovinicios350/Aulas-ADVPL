//Bibliotecas
#INCLUDE "TOTVS.CH"

/*/
  @author Fabio
  @since 12/02/2023
/*/

User Function OrdernarArray()
  local aNumero := {}
  Local cNumero
  Local cMensagem := ''
  Local i

  FwAlertInfo("Algoritimos para Ordenar o array","Bem vindo!")

  For i:=1 to 10
    cNumero := ''
    U_RecebeInput(@cNumero,'numerico','Digite um numero: ')
    aadd(aNumero,val(cNumero))
  next i

  aSort(aNumero)

  For i:=1 to len(aNumero)
    cMensagem += ' '+cValToChar(aNumero[i])
  next 
  
  FwAlertSuccess('Resultado Ordenado: '+cMensagem,'Resultado!')

Return
