#INCLUDE 'TOTVS.CH'

User Function Funcoes()
  Private cNome 

  cNome := FwInputBox("Digite seu nome")

  FwAlertSuccess('Nome: '+cNome+CRLF+;
                'Pais: '+cPaisloc,'Informações')
Return
