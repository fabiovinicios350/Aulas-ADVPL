//Bibliotecas
#INCLUDE "TOTVS.CH"

/*/
  @author Fabio
  @since 12/02/2023
/*/

User Function Imprimir10a1()
  Local i
  Local cMensagem := ''
  
  for i:=10 to 1 step -1
    cMensagem += cValToChar(i)+' '
  next 

   FwAlertSuccess('Resultado: '+cMensagem,'Resultado!')
Return
