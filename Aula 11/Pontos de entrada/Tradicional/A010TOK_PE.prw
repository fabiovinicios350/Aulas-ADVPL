#INCLUDE 'TOTVS.CH'

User Function A010TOK()
  Local aArea     := GetArea()
  Local aAreaSB1  := SB1->(GetArea())
  Local lRetorno  := .F. 
  Local cPergunta := 'Confirma o cadastro do produto'

  lRetorno := MsgYesNo(cPergunta, 'Tem certeza')


  RestArea(aArea)
  RestArea(aAreaSB1)
Return lRetorno
