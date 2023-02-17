//Bibliotecas
#INCLUDE "TOTVS.CH"

//Constantes5
#DEFINE cTITULO 'Algoritimos para exibir o multiplo de um determinado numero'

/*/
  @author Fabio
  @since 12/02/2023
/*/

User Function XMultiplo()
  Local lTentar   := .T.
  Local nMensagem := ''
  Local nMultiplo 
  Local nFim
  Local nI

  while(lTentar)
    nMultiplo := ''
    nFim  := ''
    nMensagem := ''
    FwAlertInfo(cTITULO,"Bem vindo!")

    U_FwInputBoxVal(@nMultiplo,'N','Digite o multiplo de sua escolha : ')
    U_FwInputBoxVal(@nFim,'N','Digite o numero limite para validar se e multiplo de '+cValToChar(nMultiplo)+': ')

    for nI:= 1 to nFim
      if(nI%nMultiplo==0)
      nMensagem += ' '+cValToChar(nI)+','
      endif
    next nI
  
    FwAlertSuccess('Numero multiplos de '+cValToChar(nMultiplo)+':'+CRLF+nMensagem,'Resultado!')
    lTentar := MsgyesNo("Deseja tentar novamente? ","Tentar Novamente")
  enddo

  FwAlertInfo('Fim do algoritimo','Resultado!')
Return
