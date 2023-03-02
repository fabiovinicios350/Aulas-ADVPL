#INCLUDE 'TOTVS.CH'

#DEFINE cTITULO 'Algoritimos para criar um array apartir de outro array'

/*/
  @author Fabio
  @since 01/02/2023
/*/

User Function L5Ex09()
  Local aA            := {}
  Local aB            := {}
  Local cMensagemA    := 'Array A: { '
  Local cMensagemB    := 'Array B: { '
  Local nI
  Local nNumero


  FwAlertInfo(cTITULO,"Bem vindo!")

  for nI:= 1 to 8
    nNumero:=randomize(1,100)
    aadd(aA,nNumero)
    cMensagemA +=cValToChar(nNumero)+','
    aadd(aB,(nNumero*3))
    cMensagemB +=cValToChar(aB[nI])+','
  next nI

  cMensagemA += '}'
  cMensagemB += '}'

  FwAlertSuccess(cMensagemA+CRLF+cMensagemB,"Resultado")
Return 
