#INCLUDE 'TOTVS.CH'

#DEFINE cTITULO 'Algoritimos para juntar dois array'

/*/
  @author Fabio
  @since 01/02/2023
/*/

User Function L5Ex10()
  Local aA            := {}
  Local aB            := {}
  Local aC            := {}
  Local cMensagemA    := 'Array A: { '
  Local cMensagemB    := 'Array B: { '
  Local cMensagemC    := 'Array C: { '
  Local nI
  Local nNumero


  FwAlertInfo(cTITULO,"Bem vindo!")

  for nI:= 1 to 10
    nNumero:=randomize(1,100)
    aadd(aA,nNumero)
    aadd(aC,nNumero)
    cMensagemA +=cValToChar(nNumero)+','
    cMensagemC +=cValToChar(nNumero)+','
  next nI

  cMensagemC    += CRLF

  for nI:= 1 to 15
    nNumero:=randomize(1,100)
    aadd(aB,nNumero)
    aadd(aC,nNumero)
    cMensagemB +=cValToChar(nNumero)+','
    cMensagemC +=cValToChar(nNumero)+','
  next nI

  cMensagemA += '}'
  cMensagemB += '}'
  cMensagemC += '}'


  FwAlertSuccess(cMensagemA+CRLF+cMensagemB+CRLF+cMensagemC,"Resultado")
Return 
