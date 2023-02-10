#INCLUDE 'TOTVS.CH'


User Function Exemplo()
  Local cNome  := ''
  Local Nnota1   := 0
  Local Nnota2   := 0
  Local Nnota3   := 0
  Local nMedia   := 0

  cNome := FwInoutBox('Digite seu Nome: ', cNome)
  
  Nnota1 := val(FwInoutBox('Digite a primeira Nota: ', Nnota1))
  Nnota2 := val(FwInoutBox('Digite a Segunda Nota: ', Nnota2))
  Nnota3 := val(FwInoutBox('Digite a terceira Nota: ', Nnota3))

  nMedia := (Nnota1 + Nnota2 + Nnota3) / 3

  if  nMedia >= 6
    FwAlertSuccess('Voce foi aprovado!' + CRLF + 'Sua media foi: ' + cValToChar(nMedia), 'Parabens')
  else
    FwAlertError('Voce foi reprovado!' + CRLF + 'Sua media foi: ' + cValToChar(nMedia), 'Parabens')
  endif
  
Return 
