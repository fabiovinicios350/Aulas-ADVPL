#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'

/*/
  {Protheus.doc} User Function AltCli
  Alteração de cliente por rotina automática
  @type  Function
  @author Fabio Vinicios
  @since 22/05/2023
/*/
User Function AltCli()
  Local aVetor := {}
  Local nOper  := 4
  Private lMsErroAuto := .F.
  
  PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' MODULO 'COM'
  
  //Adicionando dados ao Array
  Aadd(aVetor, {'A1_COD', 'CL0050', NIL})
  Aadd(aVetor, {'A1_END', 'RUA FUNILANDIA', NIL})
  Aadd(aVetor, {'A1_TEL', '960602586', NIL})
  
  //Executa a rotina automática  
  MSExecAuto({|x, y| MATA030(x, y)}, aVetor, nOper) //nOper = 4 - Operação de alteração
  
  //Se houver algum erro
  if lMsErroAuto
    MostraErro()
  endif
Return
