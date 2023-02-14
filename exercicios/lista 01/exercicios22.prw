//Bibliotecas
#INCLUDE "TOTVS.CH"

/*/
  @author Fabio
  @since 12/02/2023
/*/

User Function Tabuada()
  Local nNumero
  Local i

  FwAlertInfo("Algoritimos Imprimir numero de 1 a N","Bem vindo!")

  U_RecebeInput(@nNumero,'numerico','Digite um numero: ')


  while(val(nNumero)<1)
    nNumero := ""
    FwAlertError("Numero precisa ser positivo, por favor tente novamente","Valor Invalido!")
    U_RecebeInput(@nNumero,'numerico','Digite um numero: ')
  enddo

  for i:=1 to val(nNumero)
    cMensagem += cValToChar(i)+' '
  next i

   FwAlertSuccess('Resultado: '+cMensagem,'Resultado!')

Return
