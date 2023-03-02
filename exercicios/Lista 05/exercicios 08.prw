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
  Local nPmenor 
  Local nAuxTroca
  Local nI
  Local nJ
  Local nNumero


  FwAlertInfo(cTITULO,"Bem vindo!")

  for nI:= 1 to 8
    nNumero:=randomize(1,100)
    aadd(aA,nNumero)
    cMensagemA +=cValToChar(nNumero)+','
  next nI
  cMensagemA+= '}'

  for nI:= 1 to len(aA)
    nPmenor:= nI
    for nJ:=nI to len(aA)
      if(aA[nPmenor]>aA[nJ])
        nPmenor:= nj
      endif
    next nJ
    nAuxTroca:= aA[nPmenor]
    aA[nPmenor]:= aA[nI]
    aA[nI]:=nAuxTroca
    cMensagemB +=cValToChar(aA[nI])+','
  next nI
  cMensagemB+= '}'

  FwAlertSuccess(cMensagemA+CRLF+cMensagemB,"Resultado")
Return 
