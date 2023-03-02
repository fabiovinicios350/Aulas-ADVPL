#INCLUDE 'TOTVS.CH'

#DEFINE cTITULO 'Algoritimos para popular um array apenas com numero que representa letra minuscula'

/*/
  @author Fabio
  @since 01/02/2023
/*/

User Function L5Ex14()
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

  for nI:= 1 to 12
    nNumero:=randomize(1,255)
    if(ValidaCaracter(aArray,nNumero))
      aadd(aArray,Chr(nNumero))
      cMensagem +=cValToChar(Chr(nNumero))+','
    else
      nI--
    endif
  next nI
Return 

Static Function ValidaCaracter(aArray,nNumero)
  Local lResultado   := .T.
  Local nI

  if(nNumero>=97 .and. nNumero<=122)
    for nI:= 1 to len(aArray)
      if(CHR(nNumero)==aArray[nI])
        lResultado := .F.
      endif 
    next nI
  else
    lResultado   := .F.
  endif 
  
Return lResultado
