//Biblioteca
#INCLUDE 'TOTVS.CH'

//Fun��o para validar o tipo do pedido antes de excliuir
User Function A410EXC()
  //Vaiaveis para manipula��o no banco de dados
  Local aArea     := GetArea()
  Local aAreaSB1  := SC5->(GetArea())

  //Variavel de retorno do fun��o
  Local lRetorno  := .T.
  
  //valida��o do tipo
  if(M->C5_TPINCLU=="A")
    lRetorno:= .F.
    FwAlertError("O pedido de venda e do tipo automatico por conta disso n�o pode ser excluido","Erro ao excluir pedido de venda")
  endif

  RestArea(aArea)
  RestArea(aAreaSB1) 
Return lRetorno
