//Bibliotecas
#INCLUDE "TOTVS.CH"

//Constantes5
#DEFINE cTITULO 'Algoritimo para mostrar o nome na vertical'

/*/
  @author Fabio
  @since 12/02/2023
/*/

User Function NomeVertiacal()
  Local lTentar   := .T.
  Local cMensagem := ''
  Local cNomeAux  := ''
  Local cNome
  Local nI
  
  FwAlertInfo(cTITULO,"Bem vindo!")
  
  while(lTentar)
    cNome := ''
    cNomeAux := ''
    cMensagem := ''

    U_FwInputBoxVal(@cNome,'C','Digite um nome: ')

    cNome := UPPER(cNome)

    for nI:=1 to len(cNome)
      cNomeAux += SubStr(cNome,nI,1)
      cMensagem += cNomeAux+CRLF
    next nI

    FwAlertSuccess(cMensagem,'Resultado!')
    lTentar := MsgyesNo("Deseja tentar novamente? ","Tentar Novamente")
  enddo

  FwAlertInfo('Fim do algoritimo','Resultado!')
Return
