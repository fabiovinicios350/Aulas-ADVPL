//Bibliotecas
#INCLUDE "TOTVS.CH"

/*/
  @author Fabio
  @since 11/02/2023
/*/

User Function ValidarPostivo()
  
  Local cNumero
  Local cResultado

  FwAlertInfo("Algoritimos mostra se o numero e positivo ou negativo","Bem vindo!")
  U_RecebeInput(@cNumero,'numerico','Digite um numero: ')

  if(Asc(SubStr(cNumero,1,1))==45)
    cResultado := 'Negativo'
  elseif (val(cNumero)==0)
    cResultado := 'Zero'
  else
    cResultado := 'Positivo'
  endif

  FwAlertSuccess('O Numero '+cNumero+' e '+cResultado,'Resultado!')

Return 


