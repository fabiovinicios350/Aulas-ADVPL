//Bibliotecas
#INCLUDE "TOTVS.CH"
#INCLUDE "validacao.prw"

/*/
  @author Fabio
  @since 11/02/2023
/*/

User Function CalculandoSalario()
  
  Local cSalario
  Local cAjuste
  Local nSalarioNovo

  FwAlertInfo("Algoritimos Calculcar o ajuste de um salario","Bem vindo!")

  RecebeInput(@cSalario,'numerico','Digite o seu salario: ')
  RecebeInput(@cAjuste,'numerico','Digite a porcentagem de ajuste')

  nSalarioNovo := val(cSalario) + (val(cSalario)*(val(cAjuste)/100))

  FwAlertSuccess('Valor do seu salario: '+cSalario+CRLF+;
                'Ajuste: '+cAjuste+'%'+CRLF+;
                'Salario ajustado: '+cValToChar(nSalarioNovo),'Resultado!')

Return 


