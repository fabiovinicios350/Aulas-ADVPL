//Bibliotecas
#INCLUDE "TOTVS.CH"

//Constantes5
#DEFINE cTITULO 'Algoritimo para colocar a descricao do grupo de produto'

/*/
  @author Fabio
  @since 12/02/2023
/*/
User Function PreencheGrupo()
  Local cRetorno
  Local cTipo := M -> B1_TIPO
  
  // FwAlertInfo(cTITULO,"Bem vindo!")

  if(cTipo=="MP")
    cRetorno:= "Matéria Prima Produção"
  elseif(cTipo=="PA")
    cRetorno:= "Produto para Comercialização"
  else
    cRetorno:= "Outros produtos"
  endif

Return cRetorno
