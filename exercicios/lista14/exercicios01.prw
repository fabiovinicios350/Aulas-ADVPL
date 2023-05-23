#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'

/*/
  {Protheus.doc} User Function IncCli
  Inclusão de cliente por rotina automática
  @type  Function
  @author Fabio Vinicios
  @since 22/05/2023
/*/
User Function IncCli()
  Local aVetor := {}
  Local nOper  := 3
  Private lMsErroAuto := .F.
  
  PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' MODULO 'COM'
  
  //Adicionando dados ao Array
  Aadd(aVetor, {'A1_FILIAL', xFilial('SA1'), NIL})
  Aadd(aVetor, {'A1_COD', 'CL0050', NIL})
  Aadd(aVetor, {'A1_LOJA' , '01', NIL})
  Aadd(aVetor, {'A1_NOME' ,'MARIA APARECIDA', NIL})
  Aadd(aVetor, {'A1_NREDUZ' ,'MARIA APARECIDA', NIL})
  Aadd(aVetor, {'A1_END', 'RUA ITATIAIUAU', NIL})
  Aadd(aVetor, {'A1_TIPO' ,'F', NIL})
  Aadd(aVetor, {'A1_EST', 'SP', NIL})
  Aadd(aVetor, {'A1_COD_MUN', '50308', NIL})
  
  //Executa a rotina automática  
  MSExecAuto({|x, y| MATA030(x, y)}, aVetor, nOper) //nOper = 3 - Operação de Inclusão
  
  //Se houver algum erro
  if lMsErroAuto
    MostraErro()
  endif
Return
