#INCLUDE 'TOTVS.CH'

User Function VerificaOper()

  if(nOper==5)
    FwAlertInfo("Cuidado, você esta preste a excluir o fornecedor "+alltrim(SA2->A2_NOME),"Exclusão")
  elseif INCLUI
    FwAlertInfo("Bem vindo(a) ao Cadastro de Fornecedores!","Inclusão")
  elseif ALTERA
    FwAlertInfo("Você esta preste a ealterar o fornecedor "+alltrim(SA2->A2_NOME),"Alteração")
  endif
Return 
