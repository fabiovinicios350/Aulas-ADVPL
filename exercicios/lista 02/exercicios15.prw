//Bibliotecas
#INCLUDE "TOTVS.CH"

//Constantes5
#DEFINE cTITULO 'Algoritimos para calcular a soma do Fibonacci.'

/*/
  @author Fabio
  @since 12/02/2023
/*/

User Function Fibonacci()
  Local lTentar       := .T.
  Local nAnterior     := 0
  Local nAtual        := 0
  Local nFibonacci    := 1
  Local nNumero
  Local nI

  while(lTentar)
    nAnterior     := 0
    nAtual        := 0
    nFibonacci    := 1
    nNumero       := ''
    FwAlertInfo(cTITULO,"Bem vindo!")

    U_FwInputBoxVal(@nNumero,'N','Digitr um numero para calcular o Fibonacci: ')

    for nI:=1 to nNumero
      nFibonacci  := nAtual + nAnterior
      if(nFibonacci==0)
        nFibonacci:=1
      endif
      nAnterior  := nAtual
      nAtual   := nFibonacci
    next nI

    FwAlertSuccess('A soma do Fibonacci e:'+cValToChar(nFibonacci),'Resultado!')
    lTentar := MsgyesNo("Deseja tentar novamente? ","Tentar Novamente")
  enddo

  FwAlertInfo('Fim do algoritimo','Resultado!')
Return
