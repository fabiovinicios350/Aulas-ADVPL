//Bibliotecas
#INCLUDE "TOTVS.CH"

//Constantes5
#DEFINE cTITULO 'Algoritimos '

/*/
  @author Fabio
  @since 12/02/2023
/*/

User Function Divisivel23()
  Local cMensagem := ''
  Local nNumero
  Local i

  FwAlertInfo(cTITULO,"Bem vindo!")

  for i:=1 to 4
    nNumero := ''
    U_FwInputBoxVal(@nNumero,'N','Digite o primeiro numero')
    if(nNumero%2==0 .and. nNumero%3==0)
      cMensagem += ' '+cValToChar(nNumero)
    endif
  next i

  if(len(cMensagem)>1)
    FwAlertSuccess('Numero divisiveis por 2 e 3: '+cMensagem,'Resultado!')
  else
    FwAlertSuccess('nenhum dos numeros informado e divisivel por 2 e 3 ','Resultado!')
  endif
Return
