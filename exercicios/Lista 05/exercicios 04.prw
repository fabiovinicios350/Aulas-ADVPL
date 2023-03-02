#INCLUDE 'TOTVS.CH'

#DEFINE cTITULO 'Algoritimos para polular um array com numeros pares'

/*/
  @author Fabio
  @since 01/02/2023
/*/

User Function L5Ex04()
  Local aNumero       := {}
  Local cMensagem     := '{ '
  Local nI
  Local nNumero


  FwAlertInfo(cTITULO,"Bem vindo!")

  for nI:= 1 to 10
    nNumero:=randomize(2,20)
    if(nNumero%2==0)
      aadd(aNumero,nNumero)
      cMensagem += cValToChar(nNumero)+','
    else
      nI--
    endif
  next nI

  cMensagem += "}"

  FwAlertSuccess("Array: "+CRLF+cMensagem,"Resultado")
Return 
