//Bibliotecas
#INCLUDE "TOTVS.CH"

/*/
  @author Fabio
  @since 12/02/2023
/*/

User Function PositivoNegativo()
  Local cNumero
  Local aValores := {}
  Local i
  Local nPositivo := 0
  Local nNegativo := 0

  FwAlertInfo("Algoritimos para verificar quanto numero positivos e negativos ","Bem vindo!")

  For i:=1 to 10
    cNumero := ''
    U_RecebeInput(@cNumero,'numerico','Digite um numero: ')
    if(Positivo(val(cNumero))== .T.)
      nPositivo++
    else
      nNegativo++
    endif
    AaDd(aValores,val(cNumero))
  next i
  
  FwAlertSuccess('Numero positivos: '+cValToChar(nPositivo)+CRLF+;
                'Numero Negativos: '+cValToChar(nNegativo),'Resultado!')

Return
