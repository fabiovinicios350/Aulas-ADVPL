//Biblioteca
#INCLUDE 'TOTVS.CH'

//Função para pedir a confirmação da exclusão para o usuario  
User Function ConfirmaExclusao()
  Local lRetorno := MsgyesNo("Deseja realmente excluir esse fornecedor ","Confirma")	
Return lRetorno
