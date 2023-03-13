//Biblioteca
#INCLUDE 'TOTVS.CH'

//Função para validar o tipo do pedido antes de excliuir
User Function A410EXC()
  //Vaiaveis para manipulação no banco de dados
  Local aArea     := GetArea()
  Local aAreaSB1  := SC5->(GetArea())

  //Variavel de retorno do função
  Local lRetorno  := .T.
  
  //validação do tipo
  if(M->C5_TPINCLU=="A")
    lRetorno:= .F.
    FwAlertError("O pedido de venda e do tipo automatico por conta disso não pode ser excluido","Erro ao excluir pedido de venda")
  endif

  RestArea(aArea)
  RestArea(aAreaSB1) 
Return lRetorno
