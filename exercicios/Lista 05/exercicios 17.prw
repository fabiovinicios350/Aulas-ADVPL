//Biblioteca
#INCLUDE 'TOTVS.CH'

//Constantes
#DEFINE cTITULO 'Algoritimos para Apresentar um menu de opcoes'

/*/
  @author Fabio
  @since 02/03/2023
/*/


User Function L05Ex17()
  Local cTituloDlg    := 'Menu' 
  Private oDlg
  Private aNumero     := {}

  FwAlertInfo(cTITULO,"Bem vindo!")

  DEFINE MSDIALOG oDlg TITLE cTituloDlg FROM 000, 000 to 280, 180 PIXEL


  @ 14, 10 BUTTON "Carregar o Array" SIZE 70, 10 ACTION (PopulaArray()) PIXEL OF oDlg 
  @ 26, 10 BUTTON "Exibir Array" SIZE 70, 10 ACTION (ExibiArray()) PIXEL OF oDlg 
  @ 38, 10 BUTTON "Ordenar Array" SIZE 70, 10 ACTION (OdenarArrauy()) PIXEL OF oDlg 
  @ 50, 10 BUTTON "Pesquisar valor" SIZE 70, 10 ACTION (PesquisaArray()) PIXEL OF oDlg 
  @ 62, 10 BUTTON "Informar a soma" SIZE 70, 10 ACTION (SomaArray()) PIXEL OF oDlg 
  @ 74, 10 BUTTON "Informar a media" SIZE 70, 10 ACTION (MediaArray()) PIXEL OF oDlg 
  @ 86, 10 BUTTON "Informar o maior/menor" SIZE 70, 10 ACTION (MaiMenArray()) PIXEL OF oDlg 
  @ 98, 10 BUTTON "Embaralhar" SIZE 70, 10 ACTION (EmbaralhaArrauy()) PIXEL OF oDlg 
  @ 110, 10 BUTTON "Informar os repetidos" SIZE 70, 10 ACTION (VerificaArrauy()) PIXEL OF oDlg 
  @ 122, 10 BUTTON "Limpar Array" SIZE 70, 10 ACTION (LimpaArray()) PIXEL OF oDlg 

  ACTIVATE MSDIALOG  oDlg CENTERED

Return 

Static Function PopulaArray()
  Local nI
  Local nNumero
  Local lNovo := .T.

  if(len(aNumero)>0)
    lNovo:= MsgyesNo("Array ja foi preenchido, deseja reescrever o array","Array ja esta populado!")	
  endif
  
  if(lNovo)
    aNumero:={}

    for nI:=1 to 8
      nNumero := RANDOMIZE( 1, 50 )
      aadd(aNumero, nNumero)
    next nI

    FwAlertSuccess("Array Populador","Sucesso!")
  endif
Return 


Static Function ExibiArray()
  Local cMensagem   := '{ '
  Local nI

  if(len(aNumero)<1)
    if(MsgyesNo("Array esta vazio, Deseja popular o array","Array vazio"))
      PopulaArray()
    endif
  else
    for nI:=1 to len(aNumero)
      cMensagem+=cValToChar(aNumero[nI])+","
    next nI

    cMensagem   += '} '

    FwAlertSuccess('Array'+cMensagem,"Resultado")
  endif
Return 


Static Function OdenarArrauy()

  if(len(aNumero)<1)
    if(MsgyesNo("Array esta vazio, Deseja popular o array","Array vazio"))
      PopulaArray()
    endif
  else
    ASORT(aNumero)
    FwAlertSuccess("Array ordenado com sucesso","Sucesso")
  endif
Return

Static Function PesquisaArray()
  Local nPesq
  Local nValor

  if(len(aNumero)<1)
    if(MsgyesNo("Array esta vazio, Deseja popular o array","Array vazio"))
      PopulaArray()
    endif
  else
    U_FwInputBoxVal(@nValor,'N','Digite o numero para pesquisa: ')
    nPesq:= ASCAN(aNumero,nValor)
    if(nPesq==0)
      FwAlertError("Numero nao encontrado","Falha")	
    else
      FwAlertSuccess("Numero Encontrado","Sucesso!")
    endif
  endif
Return

Static Function SomaArray()
  Local nSoma  := 0
  Local nI

  if(len(aNumero)<1)
    if(MsgyesNo("Array esta vazio, Deseja popular o array","Array vazio"))
      PopulaArray()
    endif
  else
    for nI:=1 to len(aNumero)
      nSoma+=aNumero[nI]
    next nI

    FwAlertSuccess("A soma do array e: "+cValToChar(nSoma),"Sucesso!")
  endif
Return

Static Function MediaArray()
  Local nSoma  := 0
  Local nMedia
  Local nI

  if(len(aNumero)<1)
    if(MsgyesNo("Array esta vazio, Deseja popular o array","Array vazio"))
      PopulaArray()
    endif
  else
    for nI:=1 to len(aNumero)
      nSoma+=aNumero[nI]
    next nI

    nMedia:= nSoma/len(aNumero)
    FwAlertSuccess("A nMedia do array e: "+cValToChar(nMedia),"Sucesso!")
  endif
Return

Static Function MaiMenArray()
  if(len(aNumero)<1)
    if(MsgyesNo("Array esta vazio, Deseja popular o array","Array vazio"))
      PopulaArray()
    endif
  else
    ASORT(aNumero)
    FwAlertSuccess("Maior numero: "+cValToChar(aNumero[1])+CRLF+;
                  "Menor numero: "+cValToChar(aNumero[len(aNumero)]),"Sucesso!")
  endif
Return

Static Function EmbaralhaArrauy()
  Local aAux    := {}
  Local nNumero
  Local nI

  if(len(aNumero)<1)
    if(MsgyesNo("Array esta vazio, Deseja popular o array","Array vazio"))
      PopulaArray()
    endif
  else
    for nI:=1 to len(aNumero)
      nNumero:= RANDOMIZE(1, len(aNumero))
      if(aNumero[nNumero]<>nil)
        AADD( aAux, aNumero[nNumero] )
        Adel(aNumero,nNumero)
      else
        nI--
      endif
    next nI
    aNumero:= ACLONE( aAux )
    FwAlertSuccess("Array embaralhado com sucesso","Sucesso!")
  endif
Return

Static Function VerificaArrauy()
  Local aRepete   := {}
  Local lRepete   := .F. 
  Local cPosicao  := ''
  Local cMensagem := ''
  Local nCount
  Local nI
  Local nJ

  if(len(aNumero)<1)
    if(MsgyesNo("Array esta vazio, Deseja popular o array","Array vazio"))
      PopulaArray()
    endif
  else
    for nI:= 1 to len(aNumero)
      cPosicao := ''
      nCount := 0

      For nJ:=1 to len(aRepete)
        if(aNumero[nI]==aRepete[nJ][1])
          lRepete:= .T.
        endif
      next nJ

      if(!lRepete)
        for nJ:=1 to len(aNumero)
          if(aNumero[nI]==aNumero[nJ])
            cPosicao+= ' '+cValToChar(nJ)+','
            nCount++
          endif
        next nJ
        if nCount>1
          aadd(aRepete,{aNumero[nI],cPosicao})
          cMensagem += ' Numero '+cValToChar(aNumero[nI])+' nas Posições: '+cPosicao+CRLF
        endif
      endif
    next nI
    if(len(aRepete)==0)
      FwAlertError("Nao foi encontrado nenhuma numero repetido!","Falha")
    else
      FwAlertSuccess(cMensagem,'Resultado!')
    endif
  endif
Return

Static Function LimpaArray()
  
  if(len(aNumero)>0)
    aNumero:={}
    FwAlertSuccess("Array Excluido com sucesso","Sucesso")
  else
    FwAlertError("Array esta vazio","Falha")
  endif
Return
