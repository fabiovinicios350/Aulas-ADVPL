#INCLUDE 'TOTVS.CH'

User Function M030INC()
  Local aArea     := GetArea()
  Local aAreaSB1  := SA1->(GetArea())

  SA1->A1_MSBLQL := "1" 

  RestArea(aArea)
  RestArea(aAreaSB1)
Return .T.
