//Biblioteca
#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'
//Constantes
#DEFINE cTITULO 'Algoritimos para puxar os pedidos de venda de um determindo produto'

/*/
  @author Fabio
  @since 27/02/2023
/*/


User Function Ex20List04()
  Local cAlias        := 'ZZ1'
  Local aCores        :={{'ZZ1_IDADE>=18','ENABLE'},;
                        {'ZZ1_IDADE<18','DISABLE' }}
  Private cCadastro   := 'cadastro de Alunos'
  Private aRotina     := {}

  Aadd(aRotina,{'Pesquisa',     'AxPesquisa',   0, 1})
  Aadd(aRotina,{'Visualizar',   'AxVisual',     0, 2})
  Aadd(aRotina,{'Incluir',      'AxInclui',     0, 3})
  Aadd(aRotina,{'Alterar',      'AxAltera',     0, 4})
  Aadd(aRotina,{'Excluir',      'AxDeleta',     0, 5})
  Aadd(aRotina,{'Legenda',      'U_ZZLegenda',     0, 6})

  DbSelectArea(cAlias)
  DbSetOrder(1)

  MBrowse(,,,,cAlias,,,,,,aCores)

  DbCloseArea()
Return 


User Function ZZLegenda()
  Local aLegenda  :={}

  AaDD(aLegenda,{"BR_VERDE", "Maior de 18 anos"})
  AaDD(aLegenda,{"BR_VERMELHO", "Menor de 18 anos"})

  BrwLegenda("Legenda", "Maior/Menor de 18 anos", aLegenda)
  
Return aLegenda
