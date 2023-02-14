//Bibliotecas
#INCLUDE "TOTVS.CH"

/*/
  @author Fabio
  @since 12/02/2023
/*/

User Function IdadePeso()
  local aPessoas  := {}
  Local nQuant    := 0
  Local nSomaIdade:= 0
  Local cIdade
  Local cNome
  Local cPeso
  local nMediaIdade
  Local i
  FwAlertInfo("Algoritimos verificar a idade e peso de 7 pessoas","Bem vindo!")

  For i:=1 to 7
    cNome := ''
    cIdade := ''
    cPeso := ''
    U_RecebeInput(@cNome,'caracter','Digite um nome: ')
    U_RecebeInput(@cIdade,'numerico','Qual e a idade de '+cNome+': ')
    U_RecebeInput(@cPeso,'numerico','Qual e o peso de '+cPeso+': ')
    aadd(aPessoas,{cNome,val(cIdade),val(cPeso)})
  next i

  For i:=1 to len(aPessoas)
    if(aPessoas[i][3]>90)
      nQuant++
    endif
    nSomaIdade += aPessoas[i][2]
  next i

  nMediaIdade := nSomaIdade/len(aPessoas)

  FwAlertSuccess('Quantidade de pessoas com o peso acima de 90 quilos:'+cValToChar(nQuant)+CRLF+;
                'A media de idade e:'+cValToChar(round(nMediaIdade,2)),'Resultado!')

Return
