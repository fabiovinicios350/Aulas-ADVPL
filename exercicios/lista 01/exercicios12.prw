//Bibliotecas
#INCLUDE "TOTVS.CH"

/*/
  @author Fabio
  @since 11/02/2023
/*/

User Function ValidaVencedor()
  Local aTime := {}
  Local cNome 
  Local cGol

  FwAlertInfo("Algoritimos para verificar o time vencedor","Bem vindo!")

  cNome := FwInputBox("Digite o nome do primeiro Time",cNome)
  U_RecebeInput(@cGol,'numerico','Digite a quantidade de gols que o time '+cNome+' Fez: ')
  AADD(aTime, {cNome,val(cGol)})
  cNome := ''
  cGol := ''

  cNome := FwInputBox("Digite o nome do primeiro Time",cNome)
  U_RecebeInput(@cGol,'numerico','Digite a quantidade de gols que o time '+cNome+' Fez: ')
  AADD(aTime, {cNome,val(cGol)})
  cNome := ''
  cGol := ''

  if(aTime[1][2]>aTime[2][2])
    FwAlertSuccess('O time vencedor foi o '+aTime[1][1]+' por '+cValToChar(aTime[1][2])+' a '+cValToChar(aTime[2][2]),'Resultado!')
  elseif (aTime[1][2]<aTime[2][2])
    FwAlertSuccess('O time vencedor foi o '+aTime[2][1]+' por '+cValToChar(aTime[2][2])+' a '+cValToChar(aTime[1][2]),'Resultado!')
  else
    FwAlertSuccess('O resultado da partida foi de '+cValToChar(aTime[1][2])+' a '+cValToChar(aTime[2][2])+CRLF+;
    				      'Sendo assim deu EMPATE','Resultado!')
  endif

Return 
