#INCLUDE 'TOTVS.CH'

User Function MT010ALT()
  Local aArea     := GetArea()
  Local aAreaSB1  := SB1->(GetArea())

  AlteraDescr()

  RestArea(aArea)
  RestArea(aAreaSB1) 
Return .T.


User Function MT010INC()
  Local aArea     := GetArea()
  Local aAreaSB1  := SB1->(GetArea())

  AlteraDescr()
  if ExistBlock("BlqCadastro")
    ExecBlock("BlqCadastro")
  else
    FwAlertError("Erro ao chamar uma função de usuaruo","Falha na função")	
  endif

  
  RestArea(aArea)
  RestArea(aAreaSB1)
Return .T.

Static Function AlteraDescr()
  Local cTexto := SUBSTR( M->B1_DESC, 1, 14)

  if(cTexto<>"CAD. Manual - ")
    SB1->B1_DESC := ALLTRIM("CAD. Manual - "+ M->B1_DESC)
  endif
Return 
