//Biblioteca
#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'
//Constantes
#DEFINE cTITULO 'Algoritimos para chamar o tela de cadastro de cursos'

/*/
  @author Fabio
  @since 27/02/2023
/*/

//Fun��o para chamar o xCadastro de cursos
User Function Ex18List04()
  Local cAlias        := 'ZZC'
  Local cTitulo       := 'Cadastro de Cursos'
  Local lVlexclusao   := 'U_ExclusaoVld()'

  DbSelectArea(cAlias)
  DbSetOrder(1)
  
    Axcadastro(cAlias, cTitulo, lVlexclusao)

  DbCloseArea()
Return

//Fun��o para confirmar a exclus�o
User Function ExclusaoVld()
  Local lRet := .F.

  FwAlertError("Um curso nao pode ser exluido!","Erro na Exclusao")	

Return lRet

