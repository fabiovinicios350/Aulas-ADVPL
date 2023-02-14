//Bibliotecas
#INCLUDE "TOTVS.CH"

/*/
  @author Fabio
  @since 11/02/2023
/*/

User Function OrderandoValor()
  Local aValor := {}
  Local nOrdenado := {}
  Local cMensagem := ''
  Local nRetorno
  Local cValor
  Local i

  FwAlertInfo("Algoritimos Order os valores indormado","Bem vindo!")

  U_RecebeInput(@cValor,'numerico','Digite um numero: ')
  AAdd(aValor,val(cValor))
  cValor := " "

  U_RecebeInput(@cValor,'numerico','Digite um numero: ')
  AAdd(aValor,val(cValor))
  cValor := " "
  
  U_RecebeInput(@cValor,'numerico','Digite um numero: ')
  AAdd(aValor,val(cValor))
  cValor := " "

  for i=1 to len(aValor)
      nRetorno := CalcularMenor(aValor)
      AAdd(nOrdenado,nRetorno[1])
      ADel(aValor,nRetorno[2])
      cMensagem += cValToChar(nRetorno[1])+' '
  next i

  FwAlertSuccess('A Ordem correta e: '+cMensagem,'Resultado!')

Return 

static Function CalcularMenor(nNumeros)

  Local nMenor := nNumeros[1]
  Local nPosicao := 1
  Local i

    for i=1 to len(nNumeros)
        if(nNumeros[i]<>nil)
          if(nMenor<>nil)
            if nNumeros[i]<nMenor
              nMenor := nNumeros[i]
              nPosicao := i
            endif
          else
            nMenor := nNumeros[i]
          endif
        endif
    next i

Return {nMenor,nPosicao}
