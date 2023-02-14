//Bibliotecas
#INCLUDE "TOTVS.CH"

/*/
  @author Fabio
  @since 12/02/2023
/*/

User Function Tabuada()
  Local nNumero
  Local cMensagem := ''
  Local i

  FwAlertInfo("Algoritimos para calcular a tabuada","Bem vindo!")

  U_RecebeInput(@nNumero,'numerico','Digite um numero de 1 a 10: ')

  while(val(nNumero)>10 .and. val(nNumero)<1)
    nNumero := ""
    FwAlertError("Numero precisa se entre 1 e 10","Valor Invalido!")
    U_RecebeInput(@nNumero,'numerico','Digite um numero de 1 a 10: ')
  enddo

  for i:=1 to 10
    cMensagem += cValToChar(i)+' X '+nNumero+' = '+cValToChar(val(nNumero)*i)+CRLF
  next i

  FwAlertSuccess(cMensagem,'Resultado!')

Return
