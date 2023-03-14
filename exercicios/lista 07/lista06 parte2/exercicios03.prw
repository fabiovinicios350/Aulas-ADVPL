//Biblioteca
#INCLUDE 'TOTVS.CH'

//Fun��o para alterar a descri��o do produto no processo de inclus�o e altera��o
User Function MTA410I()
  //Variaveis de manipula��o de banco de dados
  Local aArea     := GetArea()
  Local aAreaSC6  := SC6->(GetArea())

  //Variaveis globais
  Local cTexto    := SUBSTR( SC6->C6_DESCRI, 1, 8)

  //Verifica se o texto ja ta na descri��o do produto
  if(cTexto<>"Inc. PE ")
    SC6->C6_DESCRI  := "Inc. PE "+SC6->C6_DESCRI
  endif

  RestArea(aArea)
  RestArea(aAreaSC6)
Return .T.
