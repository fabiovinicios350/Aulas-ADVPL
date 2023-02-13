//Bibliotecas
#INCLUDE "TOTVS.CH"
#INCLUDE "validacao.prw"

/*/
  @author Fabio
  @since 11/02/2023
/*/

User Function CalculoHorasExtras()
  
  Local cSalario
  Local cHorasTrabalhada
  Local nValorExtra
  Local nTotalReceber
  Local nValorHora

  FwAlertInfo("Algoritimos para calcular as horas extras de um funcionario","Bem vindo!")
  RecebeInput(@cSalario,'numerico','Digite o seu salario mensal: ')
  RecebeInput(@cHorasTrabalhada,'numerico','Digite a quantidade de horas trabalhas: ')

  nValorHora := (val(cSalario)/28)/8

  if val(cHorasTrabalhada)>160
    nValorExtra := (val(cHorasTrabalhada)-160)*(nValorHora+(nValorHora*0.50))
  else
    nValorExtra := 0
  endif

  nTotalReceber := val(cSalario) + nValorExtra

  FwAlertSuccess('Salario: '+cSalario+CRLF+;
                'Horas trabalhaddas: '+cHorasTrabalhada+CRLF+;
                'Valor de horas extras: '+cValToChar(round(nValorExtra,2))+CRLF+;
                'Total a receber: '+cValToChar(round(nTotalReceber,2)),'Resultado!')

Return 


