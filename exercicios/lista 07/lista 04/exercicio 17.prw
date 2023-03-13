//Biblioteca
#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'
//Constantes
#DEFINE cTITULO 'Algoritimos para chamar o tela de cadastro de aluno'

/*/
  @author Fabio
  @since 27/02/2023
/*/

//Função para chamar o xCadastro de alunos
User Function Ex17List04()
  Local cAlias  := 'ZZ1'
  Local cTitulo := 'Cadastro de Alunos'

  DbSelectArea(cAlias)
  DbSetOrder(1)
  
    Axcadastro(cAlias, cTitulo)

  DbCloseArea()
Return 

