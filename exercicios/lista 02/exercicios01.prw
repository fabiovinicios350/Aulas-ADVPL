//Bibliotecas
#INCLUDE "TOTVS.CH"

//Constantes
#DEFINE cTITULO 'Algoritimos para definir a Soma, Diferença, produto e quociente entre dois numeros'

/*/
  @author Fabio
  @since 12/02/2023
/*/

User Function SDPQNums()
  Local nNumero1 
  Local nNumero2
  Local nSoma
  Local nDiferenca
  Local nProduto
  Local nQuociente

  FwAlertInfo(cTITULO,"Bem vindo!")
  
  validaInputpositivo(@nNumero1,'N','Digite o primeiro numero')
  validaInputpositivo(@nNumero2,'N','Digite o Segundo numero')

  if(nNumero1>=nNumero2)
    nDiferenca  := nNumero1 - nNumero2
    nQuociente   := round((nNumero1 / nNumero2),0)
  else
    nDiferenca  := nNumero2 - nNumero1
    nQuociente   := round((nNumero2 / nNumero1),0)
  endif

  nSoma       := nNumero1 + nNumero2
  nProduto    := nNumero1 * nNumero2

  FwAlertSuccess('Soma: '+cValToChar(nSoma)+CRLF+;
                'Diferença: '+cValToChar(nDiferenca)+CRLF+;
                'Produto: '+cValToChar(nProduto)+CRLF+;
                'Quociente: '+cValToChar(nQuociente),'Resultado!')
Return



Static Function validaInputpositivo(nNumero,cTipo,cTexto)
  U_FwInputBoxVal(@nNumero,cTipo,cTexto)

  while(!Positivo(nNumero))
    nNumero := ""
    FwAlertError("O numero informado nao e um numero positivo","Valor Invalido!")
    U_FwInputBoxVal(@nNumero,cTipo,cTexto)
  enddo
Return 
