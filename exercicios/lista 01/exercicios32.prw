//Bibliotecas
#INCLUDE "TOTVS.CH"

/*/
  @author Fabio
  @since 12/02/2023
/*/

User Function EcontrandoArray()
  local aArray1 := {}
  local aArray2 := {}
  Local nQuant  := 0
  Local i

  FwAlertInfo("Algoritimos para Comparar arrays","Bem vindo!")

  FwAlertInfo("Populando o primeiro array","Inserindo dados!")
  CriarArray(@aArray1,15)
  FwAlertInfo("Populando o segundo array","Inserindo dados!")
  CriarArray(@aArray2,15)

  For i:=1 to len(aArray1)
    if(aArray1[i]==aArray2[i])
      nQuant++
    end
  next i

  FwAlertSuccess('A quantidade de numero igual na mesma posicao e : '+cValToChar(nQuant),'Resultado!')

Return

static Function CriarArray(aArray,nQuant)
  Local cNumero
  Local i

  For i:=1 to nQuant
   cNumero := ''
    U_RecebeInput(@cNumero,'numerico','Digite o '+cValToChar(i)+'º numero: ')
    aadd(aArray,val(cNumero))
  next i
  
Return 
