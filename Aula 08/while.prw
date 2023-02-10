#INCLUDE 'TOTVS.CH'

#DEFINE nQtdNotas 3

User Function ExemploWhile()
  Local cNome   := ''
  Local cNota   := ''
  Local nMedia  := 0
  Local nCont   := 1
  cNome := FwInputBox('Digite o nome: ', cNome)

  while nQtdNotas < 4
    cNota := FwInputBox('Digite a nota: ', cNota)
    nMedia += val(cNota)
    nCont++
  enddo

  nMedia /= nQtdNotas

  if  nMedia >= 6
    FwAlertSuccess('Voce foi aprovado!' + CRLF + 'Sua media foi: ' + cValToChar(nMedia), 'Parabens')
  else
    FwAlertError('Voce foi reprovado!' + CRLF + 'Sua media foi: ' + cValToChar(nMedia), 'Parabens')
  endif

Return 
