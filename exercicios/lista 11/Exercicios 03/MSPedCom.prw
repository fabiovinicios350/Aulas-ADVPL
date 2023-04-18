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
User Function MSPED()
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

  cQuery := 'SELECT C7_NUM, C7_EMISSAO, C7_FORNECE, C7_FILIAL, C7_COND, C7_PRODUTO, C7_DESCRI, C7_QUANT, C7_PRECO, C7_TOTAL'+CRLF+;
  'FROM '+RetSqlName('SC7') + " SC7 "+CRLF+;
  "WHERE D_E_L_E_T_=' ' AND C7_NUM='"+SC7->C7_NUM+"'"

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

  oPrint:Say(35, 20, 'Empresa /Filial: '+Alltrim(SM0->M0_NOME)+' /'+Alltrim(SM0->M0_FILIAL), oFont14, , PRETO)
  oPrint:Line(50,15, 50, 580, VERMELHO, '-6' )
  oPrint:Say(70, 210, 'Informações do Pedido', oFont16, , PRETO)

  nLinha+= 20
Return 

Static Function CabecPed()
  oPrint:Say(nLinha, 20,  'NUMERO'     , oFont12,, PRETO)
  oPrint:Say(nLinha, 175, 'DATA DE EMISSÃO'   , oFont12,, PRETO)
  oPrint:Say(nLinha, 330, 'FORNECEDOR'   , oFont12,, PRETO)
  oPrint:Say(nLinha, 440, 'LOJA'   , oFont12,, PRETO)
  oPrint:Say(nLinha, 510, 'COND. PAG', oFont12,, PRETO)

  nLinha+= 5

  oPrint:Line(nLinha, 15, nLinha, 580,,'-6')

  nLinha+= 20
Return 

Static Function CabecItem()
  oPrint:Say(nLinha, 20,  'PRODUTO'       , oFont12,, PRETO)
  oPrint:Say(nLinha, 80,  'DESCRIÇAO'     , oFont12,, PRETO)
  oPrint:Say(nLinha, 290, 'QTD. VENDIDO'  , oFont12,, PRETO)
  oPrint:Say(nLinha, 400, 'VALOR UNIT'    , oFont12,, PRETO)
  oPrint:Say(nLinha, 510, 'VALOR TOTAL'   , oFont12,, PRETO)

  nLinha+= 5

  oPrint:Line(nLinha, 15, nLinha, 580,,'-6')

  nLinha+= 20
Return 

Static Function ImpDados(cAlias)
  Local cString := ''
  Local nValorTotal := 0
  Private nCor  := PRETO

  DbSelectArea(cAlias)

  CabecPed()

  (cAlias)->(DbGoTop())
  oPrint:Say(nLinha, 20,alltrim((cAlias)->(C7_NUM))       , oFont10,, nCor)
  oPrint:Say(nLinha, 175,alltrim((cAlias)->(C7_EMISSAO))  , oFont10,, nCor)
  oPrint:Say(nLinha, 350,alltrim((cAlias)->(C7_FORNECE))  , oFont10,, nCor)
  oPrint:Say(nLinha, 450,alltrim((cAlias)->(C7_FILIAL))   , oFont10,, nCor)
  oPrint:Say(nLinha, 530,alltrim((cAlias)->(C7_COND))     , oFont10,, nCor)

  nLinha+= 20

  CabecItem()
  While (cAlias)->(!EOF()) 
    VeriQuePg()
    oPrint:Say(nLinha, 20, alltrim((cAlias)->(C7_PRODUTO)), oFont10,, nCor)
    
    //Nome
    cString := alltrim((cAlias)->(C7_DESCRI))
    VeriQuebln(cString, 50, 80)
    
    oPrint:Say(nLinha, 320,cValToChar((cAlias)->(C7_QUANT))     , oFont10,, nCor)
    oPrint:Say(nLinha, 415, "R$ "+alltrim(StrTran(Str((cAlias)->(C7_PRECO),,2),'.',',')), oFont10,, nCor)
    oPrint:Say(nLinha, 525, "R$ "+alltrim(StrTran(Str((cAlias)->(C7_TOTAL),,2),'.',',')), oFont10,, nCor)
    nValorTotal+=(cAlias)->(C7_TOTAL)
    nLinha+=20

    IncProc()
    (cAlias)->(DbSkip())
  enddo

  oPrint:Line(730, 15, 730, 580,,'-6')
  oPrint:Say(750,400,'Valor Total: '+"R$ "+alltrim(StrTran(Str(nValorTotal,,2),'.',',')), oFont16,, PRETO)
  
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

Static Function VeriQuePg()
  if nLinha > MAX_LINE
    oPrint:EndPage()
    oPrint:StartPage()

    nLinha := 105

    CabecItem()
  endif
Return 
