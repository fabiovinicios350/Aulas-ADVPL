#INCLUDE 'TOTVS.CH'

#DEFINE cTITULO 'Algoritimos para apresentar o array inverso'

/*/
  @author Fabio
  @since 01/02/2023
/*/

User Function List05Ex02()
  Local aNumero       := {}
  Local nI
  Local cMensagem     := 'Array: { '


  FwAlertInfo(cTITULO,"Bem vindo!")

  for nI:= 1 to 10
    aadd(aNumero,randomize(1,100))
    cMensagem += cValToChar(aNumero[nI])+','
  next nI

  cMensagem += "}"+CRLF+" Array inverso{"

  for nI:= len(aNumero) to 1 step -1 
    cMensagem += cValToChar(aNumero[nI])+','
  next nI

  cMensagem += "}"

  FwAlertSuccess(cMensagem,"Resultado")
Return 
