#INCLUDE 'PROTHEUS.CH'

User Function CadSA1()
  Local cAlias := 'SA1'
  Private cCadastro := 'Meus Clientes'
  Private aRotina := {}

  Aadd(aRotina,{'Pesquisa',     'AxPesquisa',   0, 1})
  Aadd(aRotina,{'Visualizar',   'AxVisual',     0, 2})
  Aadd(aRotina,{'Alterar',      'AxAltera',     0, 4})
  Aadd(aRotina,{'Excluir',      'AxDeleta',     0, 5})
  Aadd(aRotina,{'Cadastrar',    'U_Inclusao',   0, 3})

  DbSelectArea(cAlias)
  DbSetOrder(1)

  MBrowse(nil, nil, nil, nil, cAlias)

  DbCloseArea()
Return 
