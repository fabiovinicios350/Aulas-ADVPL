#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'FWMVCDEF.CH'

User Function IncMVC2()
  Local oModel        := NIL
  Private lMsErroAuto   := .F.

  PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' MODULO 'COM'
  
  oModel := FwLoadModel('MATA010')

  oModel:SetOperation(MODEL_OPERATION_INSERT)

  oModel:ACTIVATE()

  oModel:SetValue('SB1MASTER','B1_FILIAL'   ,  FwFilial('SB1')    )
  oModel:SetValue('SB1MASTER', 'B1_COD'     , '003RATST'          )
  oModel:SetValue('SB1MASTER', 'B1_DESC'    , 'PRODUTO AUTOMATICO')
  oModel:SetValue('SB1MASTER', 'B1_TIPO'    , 'PA'                )
  oModel:SetValue('SB1MASTER', 'B1_UM'      , 'KG'                )
  oModel:SetValue('SB1MASTER', 'B1_LOCPAD'  , '01'                )

  FwMVCRotAuto(oModel, 'SB1', MODEL_OPERATION_INSERT, {{'SB1MASTER', aDados}})

  if oModel:VlData()
    oModel:CommitData()
    MsgInfo('Processo Concluido!','Incluindo')
  else
    VarInfo('', oModel:GetErrorMessage())
  endif
  oModel:DeActivate()
  oModel:Destroy()
  oModel:= nil
Return 
