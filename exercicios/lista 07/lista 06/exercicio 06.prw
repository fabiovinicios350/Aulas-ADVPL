//Biblioteca
#INCLUDE 'TOTVS.CH'

//Fun��o para deixar com status de bloqueado os novos cadastros de clientes.
User Function M030INC()
  //variaveis para manipula��o no banco de dados
  Local aArea     := GetArea()
  Local aAreaSB1  := SA1->(GetArea())
  
  SA1->A1_MSBLQL := "1" 

  RestArea(aArea)
  RestArea(aAreaSB1)
Return .T.
