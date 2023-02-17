//Bibliotecas
#INCLUDE "TOTVS.CH"

//Constantes5
#DEFINE cTITULO 'Algoritimos para gerar 50 numeros aleatorios entre 10 e 99 usando For'

/*/
  @author Fabio
  @since 12/02/2023
/*/

User Function ForNumeroAleatorio()
  Local lTentar   := .T.
  Local nMensagem := ''
  Local nI

  while(lTentar)
    FwAlertInfo(cTITULO,"Bem vindo!")

    for nI:= 1 to 50
      nMensagem += ' '+cValToChar(Randomize( 10, 99))+','
    next nI
  
    FwAlertSuccess('Numero aleatorio entre 10 e 99:'+CRLF+nMensagem,'Resultado!')
    lTentar := MsgyesNo("Deseja tentar novamente? ","Tentar Novamente")
  enddo

  FwAlertInfo('Fim do algoritimo','Resultado!')
Return
