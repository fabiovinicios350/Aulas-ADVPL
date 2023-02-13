//Bibliotecas
#INCLUDE "TOTVS.CH"

/*/
  @author Fabio
  @since 11/02/2023
/*/

User Function CalculandoSalario()
  
  Local cSalario
  Local cAjuste
  Local nSalarioNovo

  FwAlertInfo("Algoritimos Calculcar o ajuste de um salario","Bem vindo!")

  U_RecebeInput(@cSalario,'numerico','Digite o seu salario: ')
  U_RecebeInput(@cAjuste,'numerico','Digite a porcentagem de ajuste')

  nSalarioNovo := val(cSalario) + (val(cSalario)*(val(cAjuste)/100))

  FwAlertSuccess('Valor do seu salario: '+cSalario+CRLF+;
                'Ajuste: '+cAjuste+'%'+CRLF+;
                'Salario ajustado: '+cValToChar(nSalarioNovo),'Resultado!')

Return 


