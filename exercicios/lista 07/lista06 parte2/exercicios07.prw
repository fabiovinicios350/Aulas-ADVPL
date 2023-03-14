//Bibliota
#INCLUDE 'TOTVS.CH'

//Função para incluir a filial de forma randomica
User Function InsereFilial()
  if INCLUI
    //Efeturar a alteração no campo 
    oObj:GetModel("SA2MASTER"):LoadValue("A2_LOJA", "0"+cValToChar(RANDOMIZE( 1, 9 )))
    
    //Recaregar os campos da tela
    oView := FwViewActive()
    oView:Refresh()
  endif
Return 


