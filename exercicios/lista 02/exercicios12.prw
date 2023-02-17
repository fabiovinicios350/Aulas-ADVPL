//Bibliotecas
#INCLUDE "TOTVS.CH"

//Constantes5
#DEFINE cTITULO 'Algoritimos para exibir os multiplos de 3 entre 1 e 100'

/*/
  @author Fabio
  @since 12/02/2023
/*/

User Function multiplos3()
  Local lTentar   := .T.
  Local nMensagem := ''
  Local nI

  while(lTentar)
    FwAlertInfo(cTITULO,"Bem vindo!")

    for nI:= 1 to 100
      if(nI%3==0)
      nMensagem += ' '+cValToChar(nI)+','
      endif
    next nI
  
    FwAlertSuccess('Numero multiplos de 3:'+CRLF+nMensagem,'Resultado!')
    lTentar := MsgyesNo("Deseja tentar novamente? ","Tentar Novamente")
  enddo

  FwAlertInfo('Fim do algoritimo','Resultado!')
Return
