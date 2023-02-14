//Bibliotecas
#INCLUDE "TOTVS.CH"

/*/
  @author Fabio
  @since 12/02/2023
/*/

User Function Imprime1a10()
  Local i
  Local cMensagem := ''
  
  for i:=1 to 10
    cMensagem += cValToChar(i)+' '
  next i

   FwAlertSuccess('Resultado: '+cMensagem,'Resultado!')
Return
