#INCLUDE 'TOTVS.CH'

#DEFINE cTITULO 'Algoritimos para popular um array apenas com numero que representa letra maiuscula'

/*/
  @author Fabio
  @since 01/02/2023
/*/

User Function L5Ex13()
  Local aA            := {}
  Local cMensagemA    := 'Array A: { '


  FwAlertInfo(cTITULO,"Bem vindo!")

  GerarArray(@aA,@cMensagemA)
  
  cMensagemA += '}'
  FwAlertSuccess(cMensagemA+CRLF,"Resultado")
Return 

Static Function GerarArray(aArray,cMensagem)
  Local nI
  Local nNumero

  for nI:= 1 to 50
    nNumero:=randomize(1,255)
    if(nNumero>=65 .and. nNumero<=90)
      aadd(aArray,chr(nNumero))
      cMensagem +=cValToChar(chr(nNumero))+','
    else
      nI--
    endif
  next nI
Return 
