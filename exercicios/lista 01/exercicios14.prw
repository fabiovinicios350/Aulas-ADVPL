//Bibliotecas
#INCLUDE "TOTVS.CH"

/*/
  @author Fabio
  @since 11/02/2023
/*/

User Function CalDiv()
  Local nNumero1
  Local nNumero2
  Local nDivisao

  FwAlertInfo("Algoritimos para calcular a divisao","Bem vindo!")

  U_RecebeInput(@nNumero1,'numerico','Digite o primeiro numero: ')
  U_RecebeInput(@nNumero2,'numerico','Digite o primeiro numero: ')
  
  while (val(nNumero2)==0)
    nNumero2 := ""
    FwAlertError("O valor informado nao pode ser zero","Valor Invalido!")
    U_RecebeInput(@nNumero2,'numerico','Digite o segundo numero: ')
  enddo

  nDivisao := val(nNumero1)/val(nNumero2)

  FwAlertSuccess('O valor da Divisao e: '+cValToChar(nDivisao),'Resultado!')
Return 
