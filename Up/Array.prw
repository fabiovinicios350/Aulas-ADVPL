#INCLUDE 'TOTVS.CH'

/*/
  @author Fabio
  @since 28/02/2023
/*/

User Function testeFabio()
  Local aArray  := {}
  Local cValor
  Local nPosicao
  Local cMensagem :='{ '
  Local nI

  for nI:=1 to 11
    cValor := ''
    cValor:= FwInputBox("Digite o "+cValToChar(nI)+"º valor: ",cValor)
    aadd(aArray,cValor)
    cMensagem+= cValor+", "
  next nI

  cMensagem +=' }'

  nPosicao := round((len(aArray)/2),0)

  FwAlertSuccess("Array: "+ cMensagem+CRLF+;
                "Posição: "+cValToChar(nPosicao)+CRLF+;
                "Valor: "+aArray[nPosicao],"Resultado")
  
Return 
