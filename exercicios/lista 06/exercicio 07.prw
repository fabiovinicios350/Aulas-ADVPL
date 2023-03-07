User Function MA020ROT()
  Local aRotUser := {}
 
  AAdd( aRotUser,{ 'Cad. Produto', 'U_CadProduto', 0, 6 })
  
Return (aRotUser)


User Function CadProduto()
  Local cAlias  := 'SB1'
  Local cTitulo := 'Cadastro de Produtos'

  DbSelectArea(cAlias)
  DbSetOrder(1)
  Axcadastro(cAlias, cTitulo,'.T.','.T.')

Return
