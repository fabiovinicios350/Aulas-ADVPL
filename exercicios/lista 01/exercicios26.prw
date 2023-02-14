//Bibliotecas
#INCLUDE "TOTVS.CH"

/*/
  @author Fabio
  @since 12/02/2023
/*/

User Function MediaEntre15100()
  local nSoma := 0
  Local nQuant := 0
  Local nDmedia := 0
  Local i

  FwAlertInfo("Algoritimos para calcular a media dos numero entre 15 e 100","Bem vindo!")

  For i:=15 to 100
    nSoma += i
    nQuant++
  next i

  nDmedia := nSoma/nQuant
  
  FwAlertSuccess('A Media aritimetica: '+cValToChar(nDmedia),'Resultado!')

Return
