#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'RPTDEF.CH'
#INCLUDE 'FWPRINTSETUP.CH'

#DEFINE PRETO     RGB(0,0,0)
#DEFINE VERMELHO  RGB(255,0,0)
#DEFINE MAX_LINE  700

/*/{Protheus.doc} User Function MSPrint
  FFunção para criar um relatorio de fornecedor
  @type  Function
  @author Fabio
  @since 14/04/2023
/*/
User Function MSFor()

  Processa({|| MontaRel()}, 'Aguarde...', 'Imprimindo relatório', .T.)
Return 

Static Function MontaRel()
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
  ImpDados()

  oPrint:EndPage()
  oPrint:Preview()
Return 

Static Function Cabecalho()
  oPrint:Box(15,15, 85, 580, '-8')
  oPrint:Line(50,15, 50, 580, VERMELHO, '-6' )

  oPrint:Say(35, 20, 'Empresa /Filial: '+Alltrim(SM0->M0_NOME)+' /'+Alltrim(SM0->M0_FILIAL), oFont14, , PRETO)
  oPrint:Say(70, 220, 'Informações do Fornecedores', oFont16, , PRETO)

  oPrint:Say(nLinha, 20,  'CODIGO'    , oFont12, , PRETO)
  oPrint:Say(nLinha, 80,  'NOME'      , oFont12, , PRETO)
  oPrint:Say(nLinha, 200, 'ENDERECO'  , oFont12, , PRETO)
  oPrint:Say(nLinha, 320, 'BAIRRO'    , oFont12, , PRETO)
  oPrint:Say(nLinha, 400, 'CIDADE'    , oFont12, , PRETO)
  oPrint:Say(nLinha, 485, 'UF'        , oFont12, , PRETO)
  oPrint:Say(nLinha, 545, 'CEP'       , oFont12, , PRETO)

  nLinha+= 5

  oPrint:Line(nLinha, 15, nLinha, 580,,'-6')

  nLinha+= 20
Return 

Static Function ImpDados()
  Local cString := ''
  Private nCor  := PRETO

  oPrint:Say(nLinha, 20, alltrim(SA2->A2_COD), oFont10,, nCor)
  
  //Nome
  cString := alltrim(SA2->A2_NOME)
  VeriQuebln(cString, 28, 80)
  
  //Endereço
  cString := alltrim(SA2->A2_END)
  VeriQuebln(cString, 28, 200)
  
  //Bairro
  cString := alltrim(SA2->A2_BAIRRO)
  VeriQuebln(cString, 15, 320)

  //Cidade
  cString := alltrim(SA2->A2_MUN)
  VeriQuebln(cString, 15, 400)

  oPrint:Say(nLinha, 485,alltrim(SA2->A2_EST)    , oFont10,, nCor)
  oPrint:Say(nLinha, 545,alltrim(SA2->A2_CEP)    , oFont10,, nCor)

  nLinha+=20

  IncProc()
Return 

Static Function VeriQuebln(cString, nLinhaTam, nColum)
  Local cTxtLinha   := ''
  Local nLinhaCampo := nLinha
  Local nQtdLinhas  := MLCount(cString, nLinhaTam,, .F.)  
  Local nI          := 0

  if nQtdLinhas>1
    For nI := 1 to nQtdLinhas
      cTxtLinha := MemoLine(cString,nLinhaTam, nI)
      oPrint:Say(nLinhaCampo, nColum, cTxtLinha, oFont10,, nCor)
      nLinhaCampo+=10
    next
  else
    oPrint:Say(nLinhaCampo, nColum, cString, oFont10,, nCor)
  endif
Return
