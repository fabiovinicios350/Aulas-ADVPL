#INCLUDE 'TOTVS.CH'

//Ponto de entrada para adionar um botão na rotina de pedido de venda
User Function MT120BRW()
  AAdd( aRotina, { 'Imprimir detalhes', 'U_RelPed', 0, 6 } )
  AAdd( aRotina, { 'Imprimir pedidos', 'U_RelPedi', 0, 6 } )
Return
