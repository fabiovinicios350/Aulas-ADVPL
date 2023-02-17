//Bibliotecas
#INCLUDE "TOTVS.CH"

//Constantes5
#DEFINE cTITULO 'Algoritimos para calculcar o tempo de uma partida de poker'

/*/
  @author Fabio
  @since 12/02/2023
/*/

User Function HorasJogo()
  Local nHoras
  Local nInicio
  Local nFinal

  FwAlertInfo(cTITULO,"Bem vindo!")
  
  U_FwInputBoxVal(@nInicio,'N','Digite a hora que comecou o jogo')
  U_FwInputBoxVal(@nFinal,'N','Digite a hora que terminou o jogo')

  nInicio := round(nInicio,2)
  nFinal := round(nFinal,2)

  if(nInicio<nFinal)
    nHoras := nFinal - nInicio
  else
    nHoras:= 24 - nInicio + nFinal
  ENDIF
  
  FwAlertSuccess('Quantidade de horas de jogo:'+cValToChar(nHoras),'Resultado!')

Return
