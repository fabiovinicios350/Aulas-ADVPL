//Bibliotecas
#INCLUDE "TOTVS.CH"

//Constantes5
#DEFINE cTITULO 'Algoritimos para gerar 50 numeros aleatorios entre 10 e 99 usando While'

/*/
  @author Fabio
  @since 12/02/2023
/*/

User Function NumeroAleatorioWhile()
  Local lTentar   := .T.
  Local nMensagem := ''
  Local nI := 1

  while(lTentar)
    FwAlertInfo(cTITULO,"Bem vindo!")

    while(nI<51)
      nMensagem += ' '+cValToChar(Randomize( 10, 99))+','
      nI++
    enddo
  
    FwAlertSuccess('Numero aleatorio entre 10 e 99: '+nMensagem,'Resultado!')
    lTentar := MsgyesNo("Deseja tentar novamente? ","Tentar Novamente")
  enddo

  FwAlertInfo('Fim do algoritimo','Resultado!')
Return
