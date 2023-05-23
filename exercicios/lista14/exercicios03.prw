#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'

/*/
  {Protheus.doc} User Function ExcFor
  Exclusao de Fornecedor por rotina automática
  @type  Function
  @author Fabio Vinicios
  @since 22/05/2023
/*/
User Function ExcFor()
  Local aVetor := {}
  Local nOper  := 5
  Private lMsErroAuto := .F.
  
  PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' MODULO 'COM'
  
  //Adicionando dados ao Array
  Aadd(aVetor, {'A2_COD', 'C89080', NIL})
  Aadd(aVetor, {'A2_LOJA', '04', NIL})
  
  //Executa a rotina automática  
  MSExecAuto({|x, y| MATA020(x, y)}, aVetor, nOper) //nOper = 5 - Operação de exclução
  
  //Se houver algum erro
  if lMsErroAuto
    MostraErro()
  endif
Return
