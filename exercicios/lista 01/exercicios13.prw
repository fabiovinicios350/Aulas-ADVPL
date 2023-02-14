//Bibliotecas
#INCLUDE "TOTVS.CH"

/*/
  @author Fabio
  @since 11/02/2023
/*/

User Function CalculaoDesconto()
  Local cNome 
  Local nPreco 
  Local nQuantidade
  Local nDesconto 
  Local ntotal

  FwAlertInfo("Algoritimos para calcular desconto","Bem vindo!")

  cNome := FwInputBox("Digite o nome do produto ",cNome)
  U_RecebeInput(@nPreco,'numerico','Digite o valor unitario do produto: ')
  U_RecebeInput(@nQuantidade,'numerico','Digite a quantidade que foi adiquirida: ')


  if(val(nQuantidade)>10)
    nDesconto := 0.05
  elseif (val(nQuantidade)>5)
    nDesconto := 0.03
  else
    nDesconto := 0.02
  endif

  ntotal := (val(nPreco)*val(nQuantidade))-(val(nPreco)*val(nQuantidade)*0.05)


  FwAlertSuccess('Voce comprou  '+nQuantidade+' '+cNome+'(s)'+CRLF+;
                'Preço unitario: '+nPreco+CRLF+;
                '% Desconto: '+cValToChar(nDesconto*100)+CRLF+;
                'Valor Total: '+cValToChar(ntotal),'Resultado!')
Return 
