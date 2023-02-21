//Bibliotecas
#INCLUDE "TOTVS.CH"

//Constantes5
#DEFINE cTITULO 'Algoritimos para apresentar os numeros de um array'

/*/
  @author Fabio
  @since 12/02/2023
/*/

User Function ExibirNumeros()
  Local aNumeros     := {}
  Local cMensagem    :=''
  Local lTentar      := .T.
  Local cNumero
  Local nI
  
  FwAlertInfo(cTITULO,"Bem vindo!")

  while(lTentar)
    for nI := 1 to 5
      cNumero := ''
      U_FwInputBoxVal(@cNumero,"N",'Digite um numero: ')
      aadd(aNumeros,cNumero)
      cMensagem += (cNumero)+', '
    next nI

    for nI := 1 to len(aNumeros)
      cMensagem += cValToChar(aNumeros[nI])+', '
    next nI

    FwAlertSuccess(cMensagem,"Retorno")
    lTentar := MsgyesNo("Deseja tentar novamente? ","Tentar Novamente")
  enddo

  FwAlertInfo('Fim do algoritimo','Resultado!')
Return
