//Bibliotecas
#INCLUDE "TOTVS.CH"

/*/
  @author Fabio
  @since 12/02/2023
/*/

User Function ImprimeSequencia()
  Local aResultado := {}
  Local cMensagem := ''
  Local cNumeros
  Local i
  Local j

  FwAlertInfo("Algoritimos para imprimir uma sequencia desejada","Bem vindo!")

  for i:=1 to 10
    cNumeros := ''
    for j:=1 to 10
      cNumeros += ' '+cValToChar(j)
    next j
      AADD(aResultado,{i,cNumeros})
    cMensagem += '('+cValToChar(i)+','+cNumeros+')'+CRLF
  next i

  
  FwAlertSuccess(cMensagem,'Resultado!')

Return
