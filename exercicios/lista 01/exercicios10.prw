//Bibliotecas
#INCLUDE "TOTVS.CH"
#INCLUDE "validacao.prw"

/*/
  @author Fabio
  @since 11/02/2023
/*/

User Function OrderandoValor()
  
  Local cValor := {0,0,0}
  Local nOrdenado := {}
  Local i

  FwAlertInfo("Algoritimos Order os valores indormado","Bem vindo!")
  RecebeInput(@cValor[1],'numerico','Digite um numero: ')
  RecebeInput(@cValor[2],'numerico','Digite um numero: ')
  RecebeInput(@cValor[3],'numerico','Digite um numero: ')

   for i=1 to len(cValor)
        nRetorno := CalcularMenor(nValor)
        AAdd(nOrdem,nRetorno[1])
        ADel(nValor,nRetorno[2])
    next i




Return 
