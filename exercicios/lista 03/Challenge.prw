//Bibliotecas
#INCLUDE "TOTVS.CH"
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

/*/
  @author Fabio
  @since 21/02/2023
/*/
User Function CorrigirGrupo()
  Local aArea       := GetArea()
  Local cAlias      := GetNextAlias()
  Local cQuery

  PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SB1' MODULO 'COM'

  cQuery:= "Select B1_TIPO, B1_ZZGRP, B1_COD from "+RetSqlName('SB1')+" where B1_ZZGRP=''"
  TCQUERY cQuery ALIAS &(cAlias) NEW

  While(&(cAlias)->(!EOF()))
    DbSelectarea('SB1') 
    DbSetOrder(1)
    if dbSeek(XFilial('SB1')+ &(cAlias)->(B1_COD))
      RecLock("SB1",.F.)
        if(&(cAlias)->(B1_TIPO)=="MP")
          SB1->B1_ZZGRP:= "Matéria Prima Produção"
        elseif(&(cAlias)->(B1_TIPO)=="PA")
          SB1->B1_ZZGRP:= "Produto para Comercialização"
        else
          SB1->B1_ZZGRP:= "Outros produtos"
        endif
      MsUnLock()
    endif

    DbCloseArea()
    &(cAlias)->(DbSkip())
  enddo

  FwAlertSuccess("Grupos corrigidos",'Resultado!')

  &(cAlias)->(DbCloseArea())
  RestArea(aArea)
Return 
