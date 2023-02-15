//Bibliotecas
#INCLUDE "TOTVS.CH"

//Constantes
#DEFINE cTITULO 'Algoritimos para calcular o quadrado da diferenca'

/*/
  @author Fabio
  @since 12/02/2023
/*/

User Function NumerDQ()
  Local nNumero1 
  Local nNumero2
  Local nDiferenca
  Local nQuadrado

  FwAlertInfo(cTITULO,"Bem vindo!")
  
  validaInputpositivo(@nNumero1,'N','Digite o primeiro numero')
  validaInputpositivo(@nNumero2,'N','Digite o Segundo numero')

  if(nNumero1>=nNumero2)
    nDiferenca  := nNumero1 - nNumero2
  else
    nDiferenca  := nNumero2 - nNumero1
  endif

  nQuadrado   := nDiferenca * nDiferenca

  FwAlertSuccess('Diferença: '+cValToChar(nDiferenca)+CRLF+;
                'Quadrado: '+cValToChar(nQuadrado),'Resultado!')
Return



Static Function validaInputpositivo(nNumero,cTipo,cTexto)
  U_FwInputBoxVal(@nNumero,cTipo,cTexto)

  while(!Positivo(nNumero))
    nNumero := ""
    FwAlertError("O numero informado nao e um numero positivo","Valor Invalido!")
    U_FwInputBoxVal(@nNumero,cTipo,cTexto)
  enddo
Return 
