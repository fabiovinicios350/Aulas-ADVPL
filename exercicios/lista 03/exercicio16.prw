//Bibliotecas
#INCLUDE "TOTVS.CH"

//Constantes5
#DEFINE cTITULO 'Algoritimo para mostrar o nome de tras pra frente'

/*/
  @author Fabio
  @since 12/02/2023
/*/

User Function InverterNome()
  Local lTentar   := .T.
  Local cNome
  Local cTrasNome
  Local nI
  
  FwAlertInfo(cTITULO,"Bem vindo!")
  
  while(lTentar)
    cNome := ''
    cTrasNome := ''

    U_FwInputBoxVal(@cNome,'C','Digite um nome: ')

    cNome := UPPER(cNome)

    for nI:=len(cNome) to 1 step -1
      cTrasNome +=SubStr(cNome,nI,1)
    next

    FwAlertSuccess("Nome de tras para frente: "+cTrasNome,'Resultado!')
    lTentar := MsgyesNo("Deseja tentar novamente? ","Tentar Novamente")
  enddo

  FwAlertInfo('Fim do algoritimo','Resultado!')
Return
