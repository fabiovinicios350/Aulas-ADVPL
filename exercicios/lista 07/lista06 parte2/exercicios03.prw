#INCLUDE 'TOTVS.CH'

User Function MTA410I()
  Local aArea     := GetArea()
  Local aAreaSC6  := SC6->(GetArea())
  Local cTexto    := SUBSTR( SC6->C6_DESCRI, 1, 8)

  if(cTexto<>"Inc. PE ")
    SC6->C6_DESCRI  := "Inc. PE "+SC6->C6_DESCRI
  endif

  RestArea(aArea)
  RestArea(aAreaSC6)
Return .T.
