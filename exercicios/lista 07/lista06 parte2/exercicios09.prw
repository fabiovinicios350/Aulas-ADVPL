//Biblioteca
#INCLUDE 'TOTVS.CH'

//Fun��o para pedir a confirma��o da exclus�o para o usuario  
User Function ConfirmaExclusao()
  Local lRetorno := MsgyesNo("Deseja realmente excluir esse fornecedor ","Confirma")	
Return lRetorno
