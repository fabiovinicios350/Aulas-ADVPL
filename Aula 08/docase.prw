#INCLUDE 'TOTVS.CH'

User Function Exemplo02()
Local cNome   := ''

cNome := FwinputBox('Digite seu nome: ', cNome)

do case
  case cNome == 'Fabio'
    Alert('Ola, Fabio')
  case cnome == 'Maria'
    Alert('Ola, Maria')
  case cnome == 'Joao'
    Alert('Ola, Joao')
  case cnome == 'Gustavo'
    Alert('Ola, Gustavo')
  otherwise
    Alert('Não te conheço!')
endcase
  
Return 
