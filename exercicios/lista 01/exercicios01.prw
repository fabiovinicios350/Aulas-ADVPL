//Bibliotecas
#INCLUDE "TOTVS.CH"
#INCLUDE "validacao.prw"

/*/
  @author Fabio
  @since 10/02/2023
/*/

User Function ValorAntecessor()
  Local nAntec
  Local cValor := ""
  
  FwAlertInfo("Algoritimos para mostrar o numero antecessor","Bem vindo!")
  cValor := FwInputBox("Digite um valor para calulcar o antecessor: ",cValor)

  while(ValidarCaracter(cValor,"numerico")=.F.)
    cValor := ""
    FwAlertError("O Valor informado nao é um numero, clicar em fechar para digitar o valor novamente","Valor Invalido!")
    cValor := FwInputBox("Digite um valor para calulcar o antecessor: ",cValor)
  enddo

  nAntec := val(cValor)-1

  FwAlertSuccess('Valor informador: '+cValor+CRLF+;
                'Valor antecessor: '+cValToChar(nAntec),'Resultado!')

Return 




