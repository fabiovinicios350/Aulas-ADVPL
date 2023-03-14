//Bibliota
#INCLUDE 'TOTVS.CH'

//Função para verificar a rotina e apresentar a mensagem de acordo com a rotina
User Function VerificaOper()

  if(nOper==5)//Verificando se e uma exclusão
    FwAlertInfo("Cuidado, você esta preste a excluir o fornecedor "+alltrim(SA2->A2_NOME),"Exclusão")
  elseif INCLUI
    FwAlertInfo("Bem vindo(a) ao Cadastro de Fornecedores!","Inclusão")
  elseif ALTERA
    FwAlertInfo("Você esta preste a ealterar o fornecedor "+alltrim(SA2->A2_NOME),"Alteração")
  endif
Return 
