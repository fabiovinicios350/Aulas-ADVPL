//Bibliotecas
#INCLUDE "TOTVS.CH"
#INCLUDE "validacao.prw"

/*/
  @author Fabio
  @since 11/02/2023
/*/

User Function CalculaCustoFinal()
  
  Local cCustoFabrica
  Local nSalarioNovo

  FwAlertInfo("Algoritimos para Calcular o custo final de um carro","Bem vindo!")

  RecebeInput(@cCustoFabrica,'numerico','Digite o Custo de fabrica do carro: ')

  nSalarioNovo := val(cCustoFabrica) + (val(cCustoFabrica)*(28/100)) + (val(cCustoFabrica)*(45/100))

  FwAlertSuccess('Preço de fabrica: '+cCustoFabrica+CRLF+;
                '28% Distribuidor: '+cValToChar(val(cCustoFabrica)*(28/100))+CRLF+;
                '45% Impostos: '+cValToChar(val(cCustoFabrica)*(45/100))+CRLF+;
                'Preço de Final: '+cValToChar(nSalarioNovo),'Resultado!')

Return 


