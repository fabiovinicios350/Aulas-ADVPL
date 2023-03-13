//Biblioteca
#INCLUDE 'TOTVS.CH'

//Função para definir a descrição legenda do cadastro de pedido de venda
User Function MA410LEG()
  Local aNovLeg := {{'CHECKOK'      ,"Pedido em aberto"},;              
                    {'BR_CANCEL'    ,"Pedido encerrado"},;              
                    {'GCTPIMSE'     ,"Pedido Liberado" },;
                    {'BR_AZUL'      ,"Pedido Bloqueado por Regra" },;
                    {'BR_LARANJA'   ,"Pedido Bloqueado por verba" },}

Return aNovLeg
