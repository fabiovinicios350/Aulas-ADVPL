#INCLUDE 'TOTVS.CH'

User Function VerificaOper()

  if(nOper==5)
    FwAlertInfo("Cuidado, voc� esta preste a excluir o fornecedor "+alltrim(SA2->A2_NOME),"Exclus�o")
  elseif INCLUI
    FwAlertInfo("Bem vindo(a) ao Cadastro de Fornecedores!","Inclus�o")
  elseif ALTERA
    FwAlertInfo("Voc� esta preste a ealterar o fornecedor "+alltrim(SA2->A2_NOME),"Altera��o")
  endif
Return 
