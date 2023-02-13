//Bibliotecas
#INCLUDE "TOTVS.CH"

/*/
  @author Fabio
  @since 11/02/2023
/*/

User Function CalulaRetangulo()
  Local cBase
  Local cAltura
  Local nArea

  FwAlertInfo("Algoritimos Calculcar a area de um retangulo","Bem vindo!")

  U_RecebeInput(@cBase,"numerico","Digite o valor da Base do retangulo: ")
  U_RecebeInput(@cAltura,"numerico","Digite o valor da Altura do retangulo: ")

  nArea := val(cBase)*val(cAltura)

  FwAlertSuccess('Valor da Base: '+cBase+CRLF+;
                'Valor da Altura: '+cAltura+CRLF+;
                'Valor da Area: '+cValToChar(nArea),'Resultado!')

Return 


