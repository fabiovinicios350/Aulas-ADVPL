//Bibliotecas
#INCLUDE "TOTVS.CH"

/*/
  @author Fabio
  @since 12/02/2023
/*/

User Function PesquisaNome()
  Local aNomes := {}
  local cNome
  Local cNomeProcurar
  Local nAchei := 0
  Local i

  FwAlertInfo("Algoritimos para econtrar um nome","Bem vindo!")

  for i:=1 to 10
    cNome := ''
    U_RecebeInput(@cNome,'caracter','Digite o nome da pessoa: ')
    aadd(aNomes,UPPER( cNome ) )
  next i

  U_RecebeInput(@cNomeProcurar,'caracter','Digite o nome da pessoa que voce quer encontrar: ')

  for i:=1 to len(aNomes)
    if(aNomes[i]==UPPER(cNomeProcurar))
      nAchei++
    endif
  next i

  if(nAchei>0)
    FwAlertSuccess("Achei",'Resultado!')
  else
    FwAlertSuccess("Nao Achei",'Resultado!')
  endif

Return
