//Bibliotecas
#INCLUDE "TOTVS.CH"

/*/
  @author Fabio
  @since 12/02/2023
/*/

User Function CalculoSalario()
  Local cValorHora
  Local cQuantHora
  Local nSalarioBruto
  Local nSalarioLiquido
  Local nIR
  local nPorc
  Local nINSS
  Local nFGTS
  Local nDescontos

  FwAlertInfo("Algoritimo Calcular o salario liquido","Bem vindo!")

  U_RecebeInput(@cValorHora,'numerico','Digite o valor da sua hora de trabalho: ')
  U_RecebeInput(@cQuantHora,'numerico','Digite a quantidade de horas trabalhadas: ')

  nSalarioBruto:= val(cValorHora)*val(cQuantHora)

  nINSS := nSalarioBruto*0.10
  nFGTS := nSalarioBruto*0.11

  if(nSalarioBruto<=1200)
    nPorc := 0
  elseif(nSalarioBruto<=1800) 
    nPorc := 5
  elseif(nSalarioBruto<=2500) 
    nPorc := 10
  else
    nPorc:= 20
  endif

  nIR := nSalarioBruto*(nPorc/100)
  nDescontos := nIR + nINSS
  nSalarioLiquido := nSalarioBruto - nDescontos

  FwAlertSuccess('Salario bruto: '+cValToChar(nSalarioBruto)+CRLF+;
                'IR ('+cValToChar(nPorc)+'%): '+cValToChar(nIR)+CRLF+;
                'INSS (10%): '+cValToChar(nINSS)+CRLF+;
                'FGTS (11%): '+cValToChar(nFGTS)+CRLF+;
                'Total de desconto: '+cValToChar(nDescontos)+CRLF+;
                'Salario liquido: '+cValToChar(nSalarioLiquido),'Resultado!')

Return
