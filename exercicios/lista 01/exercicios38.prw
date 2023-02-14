//Bibliotecas
#INCLUDE "TOTVS.CH"

/*/
  @author Fabio
  @since 12/02/2023
/*/

User Function QuantIdade()
  local aIdade  := {}
  Local nQuant  := 0
  Local cIdade
  Local i
  FwAlertInfo("Algoritimo para verifcar a idade","Bem vindo!")

  For i:=1 to 10
    cIdade := ''
    U_RecebeInput(@cIdade,'numerico','Digite uma idade: ')
    if(val(cIdade)>=18)
      nQuant++
    endif
    aadd(aIdade,val(cIdade))
  next i

  FwAlertSuccess('Quantidade de pessoal com a idade maior ou igual a 18: '+cValToChar(nQuant),'Resultado!')

Return
