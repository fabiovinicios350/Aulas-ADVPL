#INCLUDE 'TOTVS.CH'


User Function Exemplo()
  Local cNome     := ''
  Local cNota     := ''
  Local Nnota1    := 0
  Local Nnota2    := 0
  Local Nnota3    := 0
  Local nMedia    := 0

  cNome := FwInputBox('Digite seu Nome: ', cNome)
  
  Nnota1 := val(FwInputBox('Digite a primeira Nota: ', cNota))
  Nnota2 := val(FwInputBox('Digite a Segunda Nota: ', cNota))
  Nnota3 := val(FwInputBox('Digite a terceira Nota: ', cNota))

  nMedia := (Nnota1 + Nnota2 + Nnota3) / 3

  if  nMedia >= 6
    FwAlertSuccess('Voce foi aprovado!' + CRLF + 'Sua media foi: ' + cValToChar(nMedia), 'Parabens')
  else
    FwAlertError('Voce foi reprovado!' + CRLF + 'Sua media foi: ' + cValToChar(nMedia), 'Parabens')
  endif
  
Return 
