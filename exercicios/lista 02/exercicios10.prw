//Bibliotecas
#INCLUDE "TOTVS.CH"

//Constantes5
#DEFINE cTITULO 'Algoritimos para mostrar o menos numero informado'

/*/
  @author Fabio
  @since 12/02/2023
/*/

User Function MenorNumero()
  Local lTentar   := .T.
  Local nNumero
  Local nMenor
  Local nI

  while(lTentar)
    FwAlertInfo(cTITULO,"Bem vindo!")
    nNumero := ''
    for nI:=1 to 5
      nNumero := ''
      U_FwInputBoxVal(@nNumero,'N','Digite o '+cValToChar(nI)+'º numero: ')
      if(nMenor==nil .or. nMenor>nNumero)
        nMenor := nNumero
      endif
    next nI

    FwAlertSuccess('O menor numero informador e :'+cValToChar(nMenor),'Resultado!')
    lTentar := MsgyesNo("Deseja tentar novamente? ","Tentar Novamente")
  enddo

  FwAlertInfo('Fim do algoritimo','Resultado!')
Return
