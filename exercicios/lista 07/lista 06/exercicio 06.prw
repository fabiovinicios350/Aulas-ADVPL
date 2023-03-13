//Biblioteca
#INCLUDE 'TOTVS.CH'

//Função para deixar com status de bloqueado os novos cadastros de clientes.
User Function M030INC()
  //variaveis para manipulação no banco de dados
  Local aArea     := GetArea()
  Local aAreaSB1  := SA1->(GetArea())
  
  SA1->A1_MSBLQL := "1" 

  RestArea(aArea)
  RestArea(aAreaSB1)
Return .T.
