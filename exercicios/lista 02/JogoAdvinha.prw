//Bibliotecas
#INCLUDE "TOTVS.CH"

//Constantes5
#DEFINE cTITULO 'Jogo de adivinha o numero'

/*/
  @author Fabio
  @since 12/02/2023
/*/

User Function JogoAdivinha()
  Local lTentar   := .T.
  Local nNumero
  Local nNumeroCorreto
  Local nTentativas

  while(lTentar)

    nNumeroCorreto := Randomize( 0, 100)
    nNumero := ''
    FwAlertInfo(cTITULO,"Bem vindo!")
    U_FwInputBoxVal(@nNumero,'N','Digite um numero entre 0 e 100 : ')

    while(nNumero<0 .and. nNumero>100)
      nNumero := ''
      FwAlertError("O Numero informado e invalido, tente novamente","Valor Invalido!")
      U_FwInputBoxVal(@nNumero,'N','Digite um numero entre 0 e 100 : ')
    ENDDO
    nTentativas := ValidaValor(@nNumero,nNumeroCorreto)

    if(nTentativas<5)
      FwAlertSuccess('Voce e muito bom, acertou '+cValToChar(nTentativas)+' tentativas.','Resultado!')
    elseif (nTentativas<9)
      FwAlertInfo('Voce e bom, acertou '+cValToChar(nTentativas)+' tentativas.','Resultado!')

    elseif(nTentativas<13)
      FwAlertInfo('Voce e mediano, acertou '+cValToChar(nTentativas)+' tentativas.','Resultado!')
    else
      FwAlertError('Voce e muito fraco, acertou '+cValToChar(nTentativas)+' tentativas.','Resultado!')
    endif

    lTentar := MsgyesNo("Deseja tentar novamente? ","Tentar Novamente")
  enddo
  FwAlertInfo('Fim do algoritimo','Resultado!')
Return


Static Function ValidaValor(nNumero,nNumeroCorreto)
  Local nCount := 1
  
  while (nNumero<>nNumeroCorreto)
    if(nNumero<nNumeroCorreto)
      FwAlertInfo("Numero sorteado e maior que o numero informado!, tente novamente","Valor Invalido!")
    else
      FwAlertInfo("Numero sorteado e menor que o numero informado!, tente novamente","Valor Invalido!")
    endif
    nNumero := ''
    U_FwInputBoxVal(@nNumero,'N','Digite um numero entre 0 e 100 : ')
    nCount++
  enddo
Return nCount
