//Bibliotecas
#INCLUDE "TOTVS.CH"

//Constantes
#DEFINE cTITULO 'Algoritimos para calcular o combustivel gasto e+m uma viagem'

/*/
  @author Fabio
  @since 15/02/2023
/*/

User Function CalCarroCombustivel()
  Local nTempo
  Local nVelocidade
  Local nDistancia
  local nCombustivel
  Local nKmLitro
  Local cCarro

  FwAlertInfo(cTITULO,"Bem vindo!")


  FwInputBox("O modelo do seu carro: ",@cCarro)
  U_FwInputBoxVal(@nKmLitro,'N','Digite quantos KM por litro faz o '+cCarro+': ')
  U_FwInputBoxVal(@nTempo,"N","Digite o tempo gasto na viagem (Minutos): ")
  U_FwInputBoxVal(@nVelocidade,"N","Digite a velocidade(h) media (KM): ")
  
  nDistancia := nTempo * (nVelocidade/60)
  nCombustivel := nDistancia / nKmLitro


  FwAlertSuccess('Tempo gasto de viagem: '+cValToChar(nTempo)+' Horas'+CRLF+;
                'Velocidade(h) media: '+cValToChar(nVelocidade)+' KM'+CRLF+;
                'Distancia percorrida: '+cValToChar(nDistancia)+' KM'+CRLF+;
                'Quantidade de litros de combustivos gastos: '+cValToChar(nCombustivel)+' Litros','Resultado!')
Return
