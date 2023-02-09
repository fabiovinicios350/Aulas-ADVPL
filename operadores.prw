#INCLUDE 'TOTVS.CH'

User Function Operadores()
  Local nValor    := 10
  Local nValor2   := 5
  Local nAdicao   := 0
  Local nSub      := 0
  Local nMulti    := 0
  Local nDiv      := 0

  nAdicao := STR(nValor + nValor2)
  nSub    := STR(nValor - nValor2)
  nMulti  := STR(nValor * nValor2)
  nDiv    := STR(nValor / nValor2)
  

    FwAlertInfo()
Return 
