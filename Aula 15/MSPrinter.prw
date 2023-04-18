#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'RPTDEF.CH'
#INCLUDE 'FWPRINTSETUP.CH'

#DEFINE PRETO     RGB(0,0,0)
#DEFINE VERMELHO  RGB(255,0,0)
#DEFINE MAX_LINE  700

/*/{Protheus.doc} User Function MSPrint
  Função de exemplo do FWMSPrinter
  @type  Function
  @author Fabio
  @since 13/04/2023
/*/
User Function MSPrint()
  local cAlias := GeraCons()

  if !Empty(cAlias)
    Processa({|| MontaRel(cAlias)}, 'Aguarde...', 'Imprimindo relatório', .T.)
  else
    FwAlertError("Nenhum registro encontrado","Atenção")	
  endif
Return 

Static Function GeraCons()
  Local aArea   := GetArea()
  Local cAlias  := GetNextAlias()
  Local cQuery  := ''

  cQuery:= "SELECT A1_COD, A1_NOME, A1_END,A1_BAIRRO, A1_MUN, A1_EST, A1_CEP, A1_MSBLQL"+CRLF+;
  "FROM "+RetSqlName('SA1')+" SA1"+CRLF+;
  "WHERE D_E_L_E_T_ =' '"

  TCQUERY cQuery ALIAS (cAlias) NEW

  (cAlias)->(DbGoTop())

  if (cAlias)->(EOF())
    cAlias:= ''
  endif

  RestArea(aArea)
Return cAlias

Static Function MontaRel(cAlias)
  Local cCaminho := 'C:\Users\User\Desktop\ADVPL\'
  Local cArquivo := 'CadCli.pdf'

  Private nLinha  := 105
  Private oPrint
  Private oFont10 := TFont():New('Arial',,10,,.F.,,,,,.F.,.F.)
  Private oFont12 := TFont():New('Arial',,12,,.T.,,,,,.F.,.F.)
  Private oFont14 := TFont():New('Arial',,14,,.T.,,,,,.F.,.F.)
  Private oFont16 := TFont():New('Arial',,16,,.T.,,,,,.T.,.F.)

  oPrint := FwMSPrinter():New(cArquivo, IMP_PDF, .F., '', .T.,,@oPrint, '',,,,.T.)
  oPrint:cPathPDF := cCaminho

  oPrint:SetPortrait()
  oPrint:SetPaperSize(9)

  oPrint:StartPage()

  Cabecalho()
  ImpDados(cAlias)

  oPrint:EndPage()
  oPrint:Preview()
Return 

Static Function Cabecalho()
  oPrint:Box(15,15, 85, 580, '-8')
  oPrint:Line(50,15, 50, 580, VERMELHO, '-6' )

  oPrint:Say(35, 20, 'Empresa /Filial: '+Alltrim(SM0->M0_NOME)+' /'+Alltrim(SM0->M0_FILIAL), oFont14, , PRETO)
  oPrint:Say(70, 220, 'Cadastro de clientes', oFont16, , PRETO)

  oPrint:Say(nLinha, 20, 'CODIGO'     , oFont12, , PRETO)
  oPrint:Say(nLinha, 80, 'NOME'       , oFont12, , PRETO)
  oPrint:Say(nLinha, 200, 'ENDERECO'  , oFont12, , PRETO)
  oPrint:Say(nLinha, 320, 'BAIRRO'    , oFont12, , PRETO)
  oPrint:Say(nLinha, 400, 'CIDADE'    , oFont12, , PRETO)
  oPrint:Say(nLinha, 485, 'UF'        , oFont12, , PRETO)
  oPrint:Say(nLinha, 545, 'CEP'       , oFont12, , PRETO)

  nLinha+= 5

  oPrint:Line(nLinha, 15, nLinha, 580,,'-6')

  nLinha+= 20
Return 

Static Function ImpDados(cAlias)
  Local cString := ''
  Private nCor  := PRETO

  DbSelectArea(cAlias)

  (cAlias)->(DbGoTop())

  While (cAlias)->(!EOF())
    VeriQuePg(MAX_LINE)

    if alltrim((cAlias)->(A1_MSBLQL))=='1'
      nCor := VERMELHO
    endif
    oPrint:Say(nLinha, 20, alltrim((cAlias)->(A1_COD))     , oFont10,, nCor)
    
    //Nome
    cString := alltrim((cAlias)->(A1_NOME))
    VeriQuebln(cString, 20, 80)
    
    //Endereço
    cString := alltrim((cAlias)->(A1_END))
    VeriQuebln(cString, 25, 200)
    
    //Bairro
    cString := alltrim((cAlias)->(A1_BAIRRO))
    VeriQuebln(cString, 15, 320)

    //Cidade
    cString := alltrim((cAlias)->(A1_MUN))
    VeriQuebln(cString, 15, 400)
  
    oPrint:Say(nLinha, 485,alltrim((cAlias)->(A1_EST) )    , oFont10,, nCor)
    oPrint:Say(nLinha, 545,alltrim((cAlias)->(A1_CEP))     , oFont10,, nCor)

    nLinha+=30

    IncProc()

    (cAlias)->(DbSkip())
  enddo
Return 

Static Function VeriQuebln(cString, nLinhaTam, nColum)
  Local cTxtLinha   := ''
  Local lTemQuebra  := .F.
  Local nQtdLinhas  := MLCount(cString, nLinhaTam,, .F.)  
  Local nI          := 0

  if nQtdLinhas>1
    lTemQuebra := .T.
    For nI := 1 to nQtdLinhas
      cTxtLinha := MemoLine(cString,nLinhaTam, nI)
      oPrint:Say(nLinha, nColum, cTxtLinha, oFont10,, nCor)
      nLinha+=10
    next
  else
    oPrint:Say(nLinha, nColum, cString, oFont10,, nCor)
  endif

  if lTemQuebra 
    nLinha -= nQtdLinhas*10
  endif

Return

Static Function VeriQuePg(nMax)
  if nLinha > nMax
    oPrint:EndPage()
    oPrint:StartPage()

    nLinha := 105

    cabecalho() 
  endif
Return 
