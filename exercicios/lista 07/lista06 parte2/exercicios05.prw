//Biblioteca
#INCLUDE 'TOTVS.CH'

//Fun��o para criar um bot�o no menu principal do cadastro de fornecedor
User Function MT120BRW()
  //! aRotina e uma variavel privada do codigo fonte, onde armazenaos os bot�es da tela de cadastro
  AAdd( aRotina, { 'Mensagem', 'U_MSgApresenta', 0, 6 } )
Return 

//Fun��o para apresentar a mensagem
User Function MSgApresenta()
  FwAlertSuccess("Bot�o adicionado com sucesso",'Sucesso')
Return
