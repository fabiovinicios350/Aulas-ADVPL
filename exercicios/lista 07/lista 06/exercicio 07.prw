//Biblioteca
#INCLUDE 'TOTVS.CH'

//Fun��o para Incluir um bot�o no tela principal de cadastro de fornecedores
User Function MA020ROT()
  Local aRotUser := {}
  AAdd( aRotUser,{ 'Cad. Produto', 'U_CadProduto', 0, 6 })
Return (aRotUser)

//Fun��o para direcionar para o cadastro de produtos
User Function CadProduto()
  Local cAlias  := 'SB1'
  Local cTitulo := 'Cadastro de Produtos'

  DbSelectArea(cAlias)
  DbSetOrder(1)
  Axcadastro(cAlias, cTitulo,'.T.','.T.')
Return
