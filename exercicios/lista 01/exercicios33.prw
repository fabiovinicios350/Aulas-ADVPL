//Bibliotecas
#INCLUDE "TOTVS.CH"

/*/
  @author Fabio
  @since 12/02/2023
/*/

User Function RepeteArray()
  Local aNumeroRepetido :={}
  local aNumero         := {}
  Local cMensagem := ''
  local cNumero
  local cPosicao
  local lRepete := .F.
  local nCount
  Local i
  Local j

  FwAlertInfo("Algoritimos para verificar valores repitidos da arrays","Bem vindo!")

  For i:=1 to 20
    cNumero := ''
    U_RecebeInput(@cNumero,'numerico','Digite o '+cValToChar(i)+'º numero: ')
    aadd(aNumero,val(cNumero))
  next i

  For i:=1 to len(aNumero)
    cPosicao := ''
    nCount := 0
    For j:=1 to len(aNumeroRepetido)
      if(aNumero[i]==aNumeroRepetido[j][1])
        lRepete := .T.
      endif
    next j
    if(lRepete = .F.)
      For j:=1 to len(aNumero)
        if(aNumero[i]==aNumero[j])
          cPosicao += ' '+cValToChar(j)+','
          nCount++
        endif
      next j
      if nCount>1
        aadd(aNumeroRepetido,{aNumero[i],cPosicao})
        cMensagem += 'Numero '+cValToChar(aNumero[i])+' nas posicoes: '+cPosicao+CRLF
      endif
    endif
  next i

  FwAlertSuccess(cMensagem,'Resultado!')
Return
