#INCLUDE 'TOTVS.CH'

#DEFINE cTITULO 'Algoritimos para polular um array de forma inversa'

/*/
  @author Fabio
  @since 01/02/2023
/*/

User Function L5Ex07()
  Local aA            := {}
  Local aB            := {}
  Local cMensagemA    := 'Array A: { '
  Local cMensagemB    := 'Array B: { '
  Local nI
  Local nNumero


  FwAlertInfo(cTITULO,"Bem vindo!")

  for nI:= 1 to 15
    nNumero:=randomize(1,100)
    aadd(aA,nNumero)
    cMensagemA +=cValToChar(nNumero)+','
  next nI

  for nI:= len(aA) to 1 step -1
    aadd(aB,aA[nI])
    cMensagemB +=cValToChar(aA[nI])+','
  next nI

  cMensagemA += '}'
  cMensagemB += '}'


  FwAlertSuccess(cMensagemA+CRLF+cMensagemB,"Resultado")
Return 
