//Bibliotecas
#INCLUDE "TOTVS.CH"

/*/
  @author Fabio
  @since 11/02/2023
/*/

User Function ValidarTrinagulo()
  Local cValor01
  Local cValor02
  Local cValor03

  FwAlertInfo("Algoritimos para Verificar se forma um triangulo","Bem vindo!")
  U_RecebeInput(@cValor01,'numerico','Digite o valor de um lado do tringulo: ')
  U_RecebeInput(@cValor02,'numerico','Digite o valor de um lado do tringulo: ')
  U_RecebeInput(@cValor03,'numerico','Digite o valor de um lado do tringulo: ')

  cValor01 := val(cValor01)
  cValor02 := val(cValor02)
  cValor03 := val(cValor03)

  if(cValor01+cValor02>cValor03 .and. cValor01+cValor03>cValor02 .and. cValor02+cValor03>cValor01)
    FwAlertSuccess('Os valores forma uma triangulo','Resultado!')
  else
    FwAlertError('Os valores nao forma um trianguo ','Resultado!')
  endif

Return 
