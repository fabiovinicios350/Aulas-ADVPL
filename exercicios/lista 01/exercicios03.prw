//Bibliotecas
#INCLUDE "TOTVS.CH"

/*/
  @author Fabio
  @since 11/02/2023
/*/

User Function CalcularIdade()
  
  Local cAnos
  Local cMeses
  Local cDias
  Local nResultadoDias

  FwAlertInfo("Algoritimos Calculcar a sua idade em dias","Bem vindo!")

  U_RecebeInput(@cAnos,'numerico','Digite sua idade em anos você tem: ')
  U_RecebeInput(@cMeses,'numerico','Voce tem '+cAnos+' anos, e quantos meses? ')
  U_RecebeInput(@cDias,'numerico','Voce tem '+cAnos+' anos e '+cMeses+' meses, e quantos dias? ')

  nResultadoDias := val(cDias) + (val(cMeses)*30) + (val(cAnos)*356)

  FwAlertSuccess('A sua idade em dias e: '+cValToChar(nResultadoDias),'Resultado!')

Return 


