#INCLUDE 'TOTVS.CH'

#DEFINE cTITULO 'Algoritimos para polular um array de forma inversa'

/*/
  @author Fabio
  @since 01/02/2023
/*/

User Function L5Ex06()
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
    cMensagemA +=cValToChar(nNumero)+','
    nNumero:=randomize(1,100)
    aadd(aB,nNumero)
    cMensagemB +=cValToChar(nNumero)+','
    aadd(aC,aA[nI])
    cMensagemC +=cValToChar(aA[nI])+','
    aadd(aC,aB[nI])
    cMensagemC +=cValToChar(aB[nI])+','
  next nI

  cMensagemA += '}'
  cMensagemB += '}'
  cMensagemC += '}'


  FwAlertSuccess(cMensagemA+CRLF+cMensagemB+CRLF+cMensagemC,"Resultado")
Return 
