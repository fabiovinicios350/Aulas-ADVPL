//Bibliotecas
#INCLUDE "TOTVS.CH"

/*/
  @author Fabio
  @since 12/02/2023
/*/

User Function MultiplicaArray()
  Local aNumeros := {}
  Local aNumerosMult := {}
  local cMensagem := ''
  Local cNumero
  Local nNum
  Local nI

  FwAlertInfo("Algoritimos para multiplicar os valores do arrya","Bem vindo!")

  For nI:=1 to 10
    cNumero := ''
    U_RecebeInput(@cNumero,'numerico','Digite um numero: ')
    aadd(aNumeros,val(cNumero))
  next nI

  U_RecebeInput(@nNum,'numerico','Digite um numero para multiplicar os valores da array: ')

   For nI:=1 to len(aNumeros)
    aadd(aNumerosMult,(aNumeros[nI]*val(nNum)))
    cMensagem += ' '+cValToChar(aNumeros[nI]*val(nNum))
  next nI

  FwAlertSuccess('Resultado e: '+cMensagem,'Resultado!')
Return
