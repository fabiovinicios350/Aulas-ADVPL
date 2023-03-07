#INCLUDE 'TOTVS.CH'

User Function A410EXC()
  Local aArea     := GetArea()
  Local aAreaSB1  := SB1->(GetArea())
  Local lRetorno  := .T.
  
  if(M->C5_TPINCLU=="A")
    lRetorno:= .F.
    FwAlertError("O pedido de venda e do tipo automatico por conta disso não pode ser excluido","Erro ao excluir pedido de venda")
  endif

  RestArea(aArea)
  RestArea(aAreaSB1) 
Return lRetorno
