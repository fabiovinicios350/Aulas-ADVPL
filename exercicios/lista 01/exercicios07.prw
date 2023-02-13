//Bibliotecas
#INCLUDE "TOTVS.CH"
#INCLUDE "validacao.prw"

/*/
  @author Fabio
  @since 11/02/2023
/*/

User Function CalculoMaca()
  
  Local cQuant
  Local nTotal

  FwAlertInfo("Algoritimos para calcular o valor da compra","Bem vindo!")
  RecebeInput(@cQuant,'numerico','Digite a quantidade de maça: ')

  if val(cQuant)>=12
    nTotal := val(cQuant)*1.00
  else
    nTotal := val(cQuant)*1.30
  endif

  FwAlertSuccess('Quantidade de maça: '+cQuant+CRLF+;
                'Total a pagar: '+cValToChar(nTotal),'Resultado!')

Return 


