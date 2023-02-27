//Biblioteca
#INCLUDE 'TOTVS.CH'

//Constantes
#DEFINE cTITULO 'Algoritimo para simular uma calculadora'

/*/
  @author Fabio
  @since 24/02/2023
/*/


User Function FabioCalculadora()
  Local cTituloDlg   := 'calculadora' 
  Local oDlg
  Private nValor      := 0
  Private cOperacao   := ''
  Private nResult     := 0
  Private nVigula     := 0
  Private nOpPendente := .F.

  FwAlertInfo(cTITULO,"Bem vindo!")

  oDlg := MsDialog():New(0, 0, 324, 208, cTituloDlg, , , , , , RGB(0, 153, 204), , , .T.)

  @ 005, 004 MSGET nValor SIZE 97, 25 OF oDlg PIXEL PICTURE'@E 999,999,999,999,999.999' 
  
  @ 036, 004 BUTTON "AC" SIZE 22, 22 ACTION (Resultado("L")) PIXEL OF oDlg 
  @ 036, 029 BUTTON "+/-" SIZE 22, 22 ACTION (Resultado("T")) PIXEL OF oDlg 
  @ 036, 054 BUTTON "%" SIZE 22, 22 ACTION (Resultado("%")) PIXEL OF oDlg 
  @ 036, 079 BUTTON "/" SIZE 22, 22 ACTION (Resultado("/")) PIXEL OF oDlg 
  
  @ 061, 004 BUTTON "7" SIZE 22, 22 ACTION (Resultado("7")) PIXEL OF oDlg 
  @ 061, 029 BUTTON "8" SIZE 22, 22 ACTION (Resultado("8")) PIXEL OF oDlg 
  @ 061, 054 BUTTON "9" SIZE 22, 22 ACTION (Resultado("9")) PIXEL OF oDlg 
  @ 061, 079 BUTTON "X" SIZE 22, 22 ACTION (Resultado("*")) PIXEL OF oDlg 
  
  @ 087, 004 BUTTON "4" SIZE 22, 22 ACTION (Resultado("4")) PIXEL OF oDlg 
  @ 087, 029 BUTTON "5" SIZE 22, 22 ACTION (Resultado("5")) PIXEL OF oDlg 
  @ 087, 054 BUTTON "6" SIZE 22, 22 ACTION (Resultado("6")) PIXEL OF oDlg 
  @ 087, 079 BUTTON "-" SIZE 22, 22 ACTION (Resultado("-")) PIXEL OF oDlg 
  
  @ 112, 004 BUTTON "1" SIZE 22, 22 ACTION (Resultado("1")) PIXEL OF oDlg 
  @ 112, 029 BUTTON "2" SIZE 22, 22 ACTION (Resultado("2")) PIXEL OF oDlg 
  @ 112, 054 BUTTON "3" SIZE 22, 22 ACTION (Resultado("3")) PIXEL OF oDlg 
  @ 112, 079 BUTTON "+" SIZE 22, 22 ACTION (Resultado("+")) PIXEL OF oDlg 

  
  @ 137, 004 BUTTON "0" SIZE 48, 22 ACTION (Resultado("0")) PIXEL OF oDlg 
  @ 137, 054 BUTTON "," SIZE 22, 22 ACTION (Resultado(",")) PIXEL OF oDlg 
  @ 137, 079 BUTTON "=" SIZE 22, 22 ACTION (Resultado("=")) PIXEL OF oDlg 

  ACTIVATE MSDIALOG  oDlg CENTERED

Return 

Static Function Resultado(cOpcao)
  Local cAux
  do case
    case ASC(cOpcao) == 76
      Limpa()
    case ASC(cOpcao) == 84
      nValor*= -1
    case ASC(cOpcao) == 37
      nValor/= 100
    case ASC(cOpcao) >=48 .and. ASC(cOpcao) <=57
      cAux := cValToChar(nValor)
      if(nVigula==1)
        cAux+="."
        nVigula:= 2
      endif
      if(len(cOperacao)>0 .and. ISDIGIT(SubStr(cOperacao,len(cOperacao),1)))
        cAux += cOpcao
        nValor:= val(cAux)
        cOperacao += cOpcao
      elseif len(cOperacao)==0
        cAux += cOpcao
        nValor:= val(cAux)
      else
        cAux := cOpcao
        nValor:= val(cAux)
        cOperacao += cValToChar(nValor)
      endif
    case ASC(cOpcao) == 44
      if(nVigula==0)
        nVigula := 1
      endif
    case (ASC(cOpcao) == 42 .or. ASC(cOpcao) == 43 .or. ASC(cOpcao) == 45 .or. ASC(cOpcao) == 47)
      Alert(cOperacao)
      if len(cOperacao)>0
        if(SubStr(cOperacao,len(cOperacao),1)<>cOpcao .and. !ISDIGIT(SubStr(cOperacao,len(cOperacao),1)) )
          cOperacao:= left(cOperacao,len(cOperacao)-1)+cOpcao
        elseif SubStr(cOperacao,len(cOperacao),1)<>cOpcao
          nValor := &(cOperacao)
          cOperacao := cValToChar(nValor)+cOpcao
        endif
      else
        cOperacao := cValToChar(nValor)+cOpcao
        nValor := 0
      endif
      Alert(cOperacao)
    case ASC(cOpcao) == 61
      nValor :=  &(cOperacao)
      cOperacao   := ''
      nVigula     := 0
    otherwise
  endcase
return

Static Function Limpa()
  nValor      := 0
  cOperacao   := ''
  nVigula     := 0
Return 
