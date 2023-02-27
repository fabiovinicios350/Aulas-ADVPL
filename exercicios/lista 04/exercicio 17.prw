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


User Function Ex17List04()
  Local cAlias  := 'ZZ1'
  Local cTitulo := 'Cadastro de Alunos'

  DbSelectArea(cAlias)
  DbSetOrder(1)
  
    Axcadastro(cAlias, cTitulo)

  DbCloseArea()
Return 

