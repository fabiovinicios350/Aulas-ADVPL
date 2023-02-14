//Bibliotecas
#INCLUDE "TOTVS.CH"

/*/
  @author Fabio
  @since 12/02/2023
/*/

User Function InfIdade()
  local aIdade  := {}
  local cIdade  := "1"
  Local nSoma   := 0
  Local nMedia

  FwAlertInfo("Algoritimos para informar idade","Bem vindo!")
  FwAlertInfo("Coloque idade ZERO para finalizar","Aviso")

  while (val(cIdade)<>0)
    cIdade := ''
    U_RecebeInput(@cIdade,'numerico','Digite uma idade: ')
    aadd(aIdade,val(cIdade))
    nSoma += val(cIdade)
  enddo

  nMedia := nSoma/len(aIdade)
  
  FwAlertSuccess('A Media das idade e: '+cValToChar(nMedia),'Resultado!')

Return
