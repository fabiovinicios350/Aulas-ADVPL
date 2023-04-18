#INCLUDE 'TOTVS.CH'

//Ponto de entrada para adionar um botão na rotina de pedido de venda
User Function MT120BRW()
  AAdd( aRotina, { 'Imprimir detalhes', 'U_MSPED', 0, 6 } )
  AAdd( aRotina, { 'Imprimir pedidos', 'U_MSPRel', 0, 6 } )
Return
