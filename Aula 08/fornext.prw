#INCLUDE 'TOTVS.CH'

User Function ExempoFornext()
  Local cMsg  := ''
  Local nCont := 0

  for nCont := 1 to 10
    cMsg += cValToChar(nCont)
  next

  FwAlertInfo(cMsg, 'Resultado')  
Return 
