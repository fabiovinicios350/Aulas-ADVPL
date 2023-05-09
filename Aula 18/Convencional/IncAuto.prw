#INCLUDE  'TOTVS.CH'
#INCLUDE  'TBICONN.CH'

User Function AutInc1()
  Local aDados        := {}
  //Operação a ser executada
  Local nOper         := 3
  Private lMsErroAuto := .F.

  PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' MODULO 'COM'

  //Os dados a serem colocados
  AADD(aDados, {'B1_FILIAL' , xFilial('SB1'), nil})
  AADD(aDados, {'B1_COD'    , 'C0000127', nil})
  AADD(aDados, {'B1_DESC'   , 'TESTE - EXECAUTO', nil})
  AADD(aDados, {'B1_TIPO'   , 'PA', nil})
  AADD(aDados, {'B1_UM'     , 'UN', nil})
  AADD(aDados, {'B1_LOCPAD' , '01', nil})

  //Executando a operação e os dados dentro da rotina
  MsExecAuto({|x,y| MATA010(x,y)}, aDados, nOper)

  //Verificando se teve algum erro
  if lMsErroAuto
    MostraErro()
  endif
Return 
