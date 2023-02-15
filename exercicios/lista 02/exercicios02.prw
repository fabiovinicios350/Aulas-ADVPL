//Bibliotecas
#INCLUDE "TOTVS.CH"

//Constantes
#DEFINE cTITULO 'Algoritimos para calcular o combustivel gasto em uma viagem'

/*/
  @author Fabio
  @since 15/02/2023
/*/

User Function CalCombustivel()
  Local nTempo
  Local nVelocidade
  Local nDistancia
  local nCombustivel

  FwAlertInfo(cTITULO,"Bem vindo!")
  
  U_FwInputBoxVal(@nTempo,"N","Digite o tempo gasto na viagem (Minutos): ")
  U_FwInputBoxVal(@nVelocidade,"N","Digite a velocidade(h) media (KM): ")
  
  nDistancia := nTempo * (nVelocidade/60)
  nCombustivel := nDistancia / 12


  FwAlertSuccess('Tempo gasto de viagem: '+cValToChar(nTempo)+' Horas'+CRLF+;
                'Velocidade(h) media: '+cValToChar(nVelocidade)+' KM'+CRLF+;
                'Distancia percorrida: '+cValToChar(nDistancia)+' KM'+CRLF+;
                'Quantidade de litros de combustivos gastos: '+cValToChar(nCombustivel)+' Litros','Resultado!')
Return
