#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'FWMVCDEF.CH'

User Function IncAutMVC()
  Local aDados          := {}
  
  Private lMsErroAuto   := .F.
  Private aRotina       := {}
  Private oModel        := NIL

  PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' MODULO 'COM'
  oModel := FwLoadModel('MATA010')

  Aadd(aDados, {'B1_FILIAL' ,  FwFilial('SB1')    , NIL})
  Aadd(aDados, {'B1_COD'    , '002RATST'          , NIL})
  Aadd(aDados, {'B1_DESC'   , 'PRODUTO AUTOMATICO', NIL})
  Aadd(aDados, {'B1_TIPO'   , 'PA'                , NIL})
  Aadd(aDados, {'B1_UM'     , 'KG'                , NIL})
  Aadd(aDados, {'B1_LOCPAD' , '01'                , NIL})

  FwMVCRotAuto(oModel, 'SB1', MODEL_OPERATION_INSERT, {{'SB1MASTER', aDados}})

  if lMsErroAuto
    MostraErro()
  endif
Return 
