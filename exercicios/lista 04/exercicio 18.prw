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


User Function Ex18List04()
  Local cAlias        := 'ZZC'
  Local cTitulo       := 'Cadastro de Cursos'
  Local lVlexclusao   := 'U_ExclusaoVld()'

  DbSelectArea(cAlias)
  DbSetOrder(1)
  
    Axcadastro(cAlias, cTitulo, lVlexclusao)

  DbCloseArea()
Return 

