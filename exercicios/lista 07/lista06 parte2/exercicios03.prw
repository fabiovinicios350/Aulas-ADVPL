//Biblioteca
#INCLUDE 'TOTVS.CH'

//Função para alterar a descrição do produto no processo de inclusão e alteração
User Function MTA410I()
  //Variaveis de manipulação de banco de dados
  Local aArea     := GetArea()
  Local aAreaSC6  := SC6->(GetArea())

  //Variaveis globais
  Local cTexto    := SUBSTR( SC6->C6_DESCRI, 1, 8)

  //Verifica se o texto ja ta na descrição do produto
  if(cTexto<>"Inc. PE ")
    SC6->C6_DESCRI  := "Inc. PE "+SC6->C6_DESCRI
  endif

  RestArea(aArea)
  RestArea(aAreaSC6)
Return .T.
