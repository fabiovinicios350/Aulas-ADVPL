//Bibliotecas
#INCLUDE "TOTVS.CH"

/*/
  @author Fabio
  @since 12/02/2023
/*/

User Function Imprimi10apart100()
  Local i
  Local cMensagem := ''
  
  for i:=101 to 111
    cMensagem += cValToChar(i)+' '
  next i

   FwAlertSuccess('Resultado: '+cMensagem,'Resultado!')
Return
