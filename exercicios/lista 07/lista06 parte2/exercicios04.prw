//Biblioteca
#INCLUDE 'TOTVS.CH'

//Fun��o para apresentar uma mensagem ao cancelar a opera��o no cadastro de fornecedor
User Function M410ABN()
  FwAlertError("Opera��o cancelada pelo usuario","Opera��o cancelada")
Return .T.
