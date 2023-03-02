#INCLUDE 'TOTVS.CH'

#DEFINE cTITULO 'Algoritimos para apresentar o array'

/*/
  @author Fabio
  @since 01/02/2023
/*/

User Function L5Ex03()
  Local aNumero       := {}
  Local nI
  Local cMensagem     := '{ '


  FwAlertInfo(cTITULO,"Bem vindo!")

  for nI:= 1 to 30
    aadd(aNumero,randomize(1,30))
    if(nI==20)
      cMensagem+=CRLF
    end
    cMensagem += cValToChar(aNumero[nI])+','
  next nI

  cMensagem += "}"

  FwAlertSuccess("Array: "+CRLF+cMensagem,"Resultado")
Return 
