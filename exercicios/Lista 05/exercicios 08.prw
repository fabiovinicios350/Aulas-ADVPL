#INCLUDE 'TOTVS.CH'

#DEFINE cTITULO 'Algoritimos para polular um array de forma inversa'

/*/
  @author Fabio
  @since 01/02/2023
/*/

User Function L5Ex08()
  Local aA            := {}
  Local cMensagemA    := 'Array A: { '
  Local cMensagemB    := 'Array B: { '
  Local nJ
  Local nI              
  Local nAuxTroca
  Local nNumero


  FwAlertInfo(cTITULO,"Bem vindo!")

  for nI:= 1 to 8
    nNumero:=randomize(1,100)
    aadd(aA,nNumero)
    cMensagemA +=cValToChar(nNumero)+','
  next nI

  cMensagemA+= '}'

  nJ := len(aA)
  for nI:=1 to len(aA)
    if(nI>=nJ)
      cMensagemB+=cValToChar(aA[nI] )+','
    else
      nAuxTroca:= aA[nJ]
      aA[nJ] := aA[nI]
      aA[nI] := nAuxTroca
      cMensagemB+=cValToChar(aA[nI] )+','
    endif
    nJ--
  next nI
  cMensagemB+= '}'

  FwAlertSuccess(cMensagemA+CRLF+cMensagemB,"Resultado")
Return 
