//Biblioteca
#INCLUDE 'TOTVS.CH'

//Função para criar um botão no menu principal do cadastro de fornecedor
User Function MT120BRW()
  //! aRotina e uma variavel privada do codigo fonte, onde armazenaos os botões da tela de cadastro
  AAdd( aRotina, { 'Mensagem', 'U_MSgApresenta', 0, 6 } )
Return 

//Função para apresentar a mensagem
User Function MSgApresenta()
  FwAlertSuccess("Botão adicionado com sucesso",'Sucesso')
Return
