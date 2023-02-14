//Bibliotecas
#INCLUDE "TOTVS.CH"

/*/
  @author Fabio
  @since 12/02/2023
/*/

User Function TabelaDesconto()
  Local cMensagem   := ''
  Local nDesc
  Local nValorFinal
  Local i

  FwAlertInfo("Algoritimos Informar a tabela de desconto","Bem vindo!")
  cMensagem += ' Valor da compra  -  % Desconto  -  Valor Final  '+CRLF+CRLF

  For i:=500 to 2900 step 100
    nDesc := (i-400)/100
    nValorFinal := i-(i*(nDesc/100))

    cMensagem += 'R$ '+cValToChar(i)+' - '+cValToChar(nDesc)+'% - '+cValToChar(nValorFinal)+CRLF
  next i

  FwAlertSuccess(cMensagem,'Resultado!')

Return
