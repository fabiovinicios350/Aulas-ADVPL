//Bibliotecas
#INCLUDE "TOTVS.CH"

/*/
  @author Fabio
  @since 11/02/2023
/*/

User Function OrderandoValor()
  
  Local cValor := {0,0,0}
  Local nOrdenado := {}
  Local nRetorno
  Local cMensagem
  Local i

  FwAlertInfo("Algoritimos Order os valores indormado","Bem vindo!")
  U_RecebeInput(@cValor[1],'numerico','Digite um numero: ')
  U_RecebeInput(@cValor[2],'numerico','Digite um numero: ')
  U_RecebeInput(@cValor[3],'numerico','Digite um numero: ')

   for i=1 to len(cValor)
        nRetorno := CalcularMenor(nValor)
        AAdd(nOrdenado,nRetorno[1])
        ADel(nValor,nRetorno[2])
        cMensagem += cValToChar(nRetorno[1])
    next i

Return 

static Function CalcularMenor(nNumeros)

  Local nMenor := nNumeros[1]
  Local nPosicao
  Local i

    for i=1 to len(nNumeros)
        if nNumeros[i]<nMenor
          nMenor := nNumeros[i]
          nPosicao := i
        endif
    next i

Return {nMenor,nPosicao}
