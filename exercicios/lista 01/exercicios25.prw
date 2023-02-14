//Bibliotecas
#INCLUDE "TOTVS.CH"

/*/
  @author Fabio
  @since 12/02/2023
/*/

User Function SomaEntreNumeros()
  local nSoma := 0
  Local cNumero
  Local i

  FwAlertInfo("Algoritimos para calcular a soma dos numeros informados","Bem vindo!")

  For i:=1 to 10
    cNumero := ''
    U_RecebeInput(@cNumero,'numerico','Digite um numero: ')
    nSoma += val(cNumero)
  next i
  
  FwAlertSuccess('Resultado da soma dos numeros: '+cValToChar(nSoma),'Resultado!')

Return
