#INCLUDE 'PROTHEUS.CH'

User Function Inclusao(cAlias,nReg, nOpc)
  Local cMsg  :=  'Esse Botao abrira a tela de inclusao'
  Local lMax  :=  '.T.'

  FwAlertInfo(cMsg, 'Bem vindo!')

  AxInclui(cAlias,nReg, nOpc,nil, nil, nil, lMax)
Return 
