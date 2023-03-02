//Biblioteca
#INCLUDE 'TOTVS.CH'

//Constantes
#DEFINE cTITULO 'Algoritimos para calcular a media dos alunos.'

/*/
  @author Fabio
  @since 02/03/2023
/*/


User Function L05Ex16()
  Local cNome         := space(20)
  Local nNota01       := 0
  Local nNota02       := 0
  Local nNota03       := 0
  Local cTituloDlg    := 'Media Alunos' 
  Private aAluno      :={{"Fabio",10,5,8,10},{"Denis",10,5,8,10},{"Dalcie",10,5,8,10},{"Paloma",10,5,8,10},{"Cida",10,5,8,10},{"Teste",10,5,8,10}}
  
  Private nMedia      := 0
  Private oDlg

  FwAlertInfo(cTITULO,"Bem vindo!")

  DEFINE MSDIALOG oDlg TITLE cTituloDlg FROM 000, 000 to 400, 180 PIXEL


  @ 14, 10 SAY "Nome do aluno: " SIZE 70, 07 OF oDlg PIXEL
  @ 22, 10 MSGET cNome SIZE 70, 11 OF oDlg PIXEL

  @ 45, 10 SAY "Nota 01: " SIZE 70, 07 OF oDlg PIXEL
  @ 53, 10 MSGET nNota01 SIZE 70, 11 OF oDlg PIXEL VALID Validacao(nNota01) PICTURE '@E 99.99'

  @ 075, 10 SAY "Nota 02: " SIZE 70, 07 OF oDlg PIXEL
  @ 083, 10 MSGET nNota02 SIZE 70, 11 OF oDlg PIXEL VALID Validacao(nNota02) PICTURE '@E 99.99'

  @ 105, 10 SAY "Nota 03: " SIZE 70, 07 OF oDlg PIXEL
  @ 113, 10 MSGET nNota03 SIZE 70, 11 OF oDlg PIXEL VALID Validacao(nNota03) PICTURE '@E 99.99'


  @ 135,010 BUTTON "Registrar" SIZE 70, 15 ACTION (Resultado(@cNome,@nNota01,@nNota02,@nNota03)) PIXEL OF oDlg 
  @ 155,010 BUTTON "Exibir" SIZE 70, 15 ACTION (Apresentar()) PIXEL OF oDlg 
  @ 175,010 BUTTON "Sair" SIZE 70, 15 ACTION (oDlg:End()) PIXEL OF oDlg 


  ACTIVATE MSDIALOG  oDlg CENTERED

Return 

Static Function Resultado(cNome,nNota01,nNota02,nNota03)

  nMedia := (nNota01+nNota02+nNota03)/3
  aadd(aAluno,{cNome,nNota01,nNota02,nNota03,nMedia})

  cNome   := space(20)
  nNota01 := 0
  nNota02 := 0
  nNota03 := 0
  nMedia  := 0

  FwAlertSuccess("Notas cadastradas com sucesso!","Cadastro")
Return 


Static Function Validacao(nNota)
  Local nResultado := .F.
  if(nNota>=0 .and. nNota<=10)
    nResultado:= .T.
  else
    FwAlertError("Nota invalida","Valor invalido")
  endif

Return nResultado



Static Function Apresentar()
  Private cConteudo   := ''
  Private nPosicao
  Private oDlgExibe

  DEFINE MSDIALOG oDlgExibe TITLE "Media dos alunos" FROM 000, 000 to 500, 300 PIXEL

  ListaPagina(1)


  @ 14, 10 SAY cConteudo SIZE 130, 200 OF oDlgExibe PIXEL

  @ 225,022 BUTTON "<" SIZE 30, 15 ACTION ProxAnt(0) PIXEL OF oDlgExibe 
  @ 225,96 BUTTON ">" SIZE 30, 15 ACTION ProxAnt(1) PIXEL OF oDlgExibe 

  ACTIVATE MSDIALOG  oDlgExibe CENTERED
Return 

Static Function ProxAnt(nOpcao)

  if(nOpcao==1)
    if(nPosicao>=len(aAluno))
      FwAlertError("Essa e a ultima pagina","Erro")
    else
      cConteudo:=''
      ListaPagina(nPosicao)
    endif
  elseif (nPosicao-8<1)
    FwAlertError("Essa e a ultima pagina","Erro")
  else
    cConteudo:=''
    ListaPagina(nPosicao-8)
  endif
Return 

Static Function ListaPagina(nPos)
  Local nI
  Local nCont := 1

  cConteudo += CRLF+"-------------------------------------------------------------------------"+CRLF
  for nI:=nPos  to len(aAluno)
    if(nCont<=4)
      cConteudo += "Nome do aluno: "+aAluno[nI][1]+CRLF+;
                  "Nota 01: "+cValToChar(aAluno[nI][2])+CRLF+;
                  "Nota 02: "+cValToChar(aAluno[nI][3])+CRLF+;
                  "Nota 03: "+cValToChar(aAluno[nI][4])+CRLF+;
                  "Media: "+cValToChar(aAluno[nI][4])+CRLF
      cConteudo += CRLF+"-------------------------------------------------------------------------"+CRLF
      if nI==len(aAluno)
        nPosicao+= 4
      endif
    else
      nPosicao:= nI
      EXIT
    endif
    nCont++
  next nI
Return
