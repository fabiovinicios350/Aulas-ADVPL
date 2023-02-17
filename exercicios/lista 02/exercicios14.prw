//Bibliotecas
#INCLUDE "TOTVS.CH"

//Constantes5
#DEFINE cTITULO 'Algoritimos para calcular a soma dos N primeiros numeros.'

/*/
  @author Fabio
  @since 12/02/2023
/*/

User Function NCalcula()
  Local lTentar   := .T.
  Local nQuantN 
  Local cParImpar 
  Local cAuxParImpar 
  Local nSoma     := 0
  Local nI

  while(lTentar)
    nQuantN := ''
    cParImpar  := ''
    nMensagem  := ''
    FwAlertInfo(cTITULO,"Bem vindo!")

    U_FwInputBoxVal(@nQuantN,'N','Digitr a quatidade de numeros: ')
    U_FwInputBoxVal(@cParImpar,'C','Digite (P) para somar apenas os numeros par ou (I) para somar apenas os numeros impa:')
    cParImpar := Upper(cParImpar)
    While(cParImpar<>"I" .and. cParImpar<>"P")
      cParImpar := ''
      FwAlertError('Valor invalido, tente novamente!','Valor invalido!')
      U_FwInputBoxVal(@cParImpar,'C','Digite (P) para somar apenas os numeros par ou (I) para somar apenas os numeros impa:')
      cParImpar := Upper(cParImpar)
    enddo

    for nI:=1 to nQuantN
      if(cParImpar=="P" .and. nI%2==0)
        cAuxParImpar := "Par"
        nSoma += nI
      elseif(cParImpar=="I" .and. nI%2<>0)
        cAuxParImpar := "Impar"
        nSoma += nI
      endif
    next nI
  
    FwAlertSuccess('A Soma dos numeros '+cAuxParImpar+': '+cValToChar(nSoma),'Resultado!')
    lTentar := MsgyesNo("Deseja tentar novamente? ","Tentar Novamente")
  enddo

  FwAlertInfo('Fim do algoritimo','Resultado!')
Return
