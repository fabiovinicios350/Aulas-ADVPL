//Bibliotecas
#INCLUDE "TOTVS.CH"

/*/
  @author Fabio
  @since 12/02/2023
/*/

User Function Intervalo1020()
  Local aValores := {}
  local nIntervalo := 0
  Local cNumero
  Local i

  FwAlertInfo("Algoritimos para verificar quantidade de numero entre 10 e 20 ","Bem vindo!")

  For i:=1 to 10
    cNumero := ''
    U_RecebeInput(@cNumero,'numerico','Digite um numero: ')
    if(val(cNumero)>=10 .and. val(cNumero)<=20)
      nIntervalo++
    endif
    AaDd(aValores,val(cNumero))
  next i
  
  FwAlertSuccess('Quantidade de numeros entre 10 e 20: '+cValToChar(nIntervalo),'Resultado!')

Return
