//Biblioteca
#INCLUDE 'TOTVS.CH'

//Função para apresentar uma mensagem ao cancelar a operação no cadastro de fornecedor
User Function M410ABN()
  FwAlertError("Operação cancelada pelo usuario","Operação cancelada")
Return .T.
