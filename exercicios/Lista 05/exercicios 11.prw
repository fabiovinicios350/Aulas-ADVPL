#INCLUDE 'TOTVS.CH'

#DEFINE cTITULO 'Algoritimos para criar um arra com base de outro!'

/*/
  @author Fabio
  @since 01/02/2023
/*/

User Function L5Ex11()
  Local aA            := {}
  Local aB            := {}
  Local cMensagemA    := 'Array A: { '
  Local cMensagemB    := 'Array B: { '
  Local nSoma         := 0
  Local nNumero
  Local nI


  FwAlertInfo(cTITULO,"Bem vindo!")

  for nI:= 1 to 10
    nNumero:=randomize(1,100)
    aadd(aA,nNumero)
    cMensagemA +=cValToChar(nNumero)+','
  next nI


  for nI:= 1 to len(aA)
    nSoma += aA[nI]
    aadd(aB,nSoma)
    cMensagemB +=cValToChar(aB[nI])+','
  next nI

  cMensagemA += '}'
  cMensagemB += '}'


  FwAlertSuccess(cMensagemA+CRLF+cMensagemB,"Resultado")
Return 
