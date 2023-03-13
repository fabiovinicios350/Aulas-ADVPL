//Biblioteca
#INCLUDE 'TOTVS.CH'

//Função para definir a cor da legenda no cadastro de pedido de venda
User Function MA410COR()
  Local aNovCor := { {"Empty(C5_LIBEROK).And.Empty(C5_NOTA) .AND. Empty(C5_BLQ)" ,"CHECKOK"    },;  //Pedido em Aberto 
                      {"!Empty(C5_NOTA).Or.C5_LIBEROK=='E' .AND. Empty(C5_BLQ)"   ,"BR_CANCEL"   },;  //Pedido Encerrado
                      {"!Empty(C5_LIBEROK).And.Empty(C5_NOTA) .AND. Empty(C5_BLQ)","GCTPIMSE"},; //Pedido Liberado
                      {"C5_BLQ == '1'", "BR_AZUL"},;
                      {"C5_BLQ == '2'", "BR_LARANJA"}}
Return aNovCor
