#INCLUDE 'TOTVS.CH'

User Function InsereFilial()
  if INCLUI
    oObj:GetModel("SA2MASTER"):LoadValue("A2_LOJA", "0"+cValToChar(RANDOMIZE( 1, 9 )))
    oView := FwViewActive()
    oView:Refresh()
  endif
Return 


