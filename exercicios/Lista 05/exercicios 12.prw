#INCLUDE 'TOTVS.CH'

#DEFINE cTITULO 'Algoritimos para juntar dois array'

/*/
  @author Fabio
  @since 01/02/2023
/*/

User Function L5Ex12()
  Local aA            := {}
  Local aB            := {}
  Local cMensagemA    := 'Array A: { '
  Local cMensagemB    := 'Array B: { '
  Local nNumero
  Local nI


  FwAlertInfo(cTITULO,"Bem vindo!")

  for nI:= 1 to 5
    nNumero:=randomize(-20,20)
    aadd(aA,nNumero)
    aadd(aB,nNumero*(-1))
    cMensagemA +=cValToChar(nNumero)+','
    cMensagemB +=cValToChar(nNumero*(-1))+','
  next nI

  cMensagemA += '}'
  cMensagemB += '}'


  FwAlertSuccess(cMensagemA+CRLF+cMensagemB,"Resultado")
Return 
