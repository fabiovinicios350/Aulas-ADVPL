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
    cRetorno:= "Mat�ria Prima Produ��o"
  elseif(cTipo=="PA")
    cRetorno:= "Produto para Comercializa��o"
  else
    cRetorno:= "Outros produtos"
  endif

Return cRetorno
