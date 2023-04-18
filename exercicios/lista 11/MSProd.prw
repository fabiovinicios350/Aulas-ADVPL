#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'RPTDEF.CH'
#INCLUDE 'FWPRINTSETUP.CH'

#DEFINE PRETO     RGB(0,0,0)
#DEFINE VERMELHO  RGB(255,0,0)
#DEFINE MAX_LINE  700

/*/{Protheus.doc} User Function MSProd
  (Função para gerar o relatorio em MSPrinter)
  @type  Function
  @author Fabio
  @since 13/04/2023
/*/
User Function MSProd()
  Local cAlias := GeraCons()

  if !Empty(cAlias)
    Processa({|| MontaRel(cAlias)}, 'Aguarde...', 'Impimindo relatorio', .T.)
  else
    FwAlertError("Nenhum registro encontrado","Atenção")
  endif
Return

Static Function GeraCons()
  Local aArea     := GetArea()
  Local cAlias    := GetNextAlias()
  Local cQuery    := ''

  cQuery := "SELECT B1_COD, B1_DESC, B1_UM, B1_PRV1, B1_LOCPAD"+CRLF+;
  "FROM "+RetSqlName('SB1')+" SB1"+CRLF+;
  "WHERE D_E_L_E_T_ =' '"

  TCQUERY cQuery ALIAS (cAlias) NEW

  (cAlias)->(DbGoTop())

  if (cAlias)->(EOF())
    cAlias := ''
  endif 

  RestArea(aArea)
Return cAlias

Static Function MontaRel(cAlias)
  Local cCaminho := 'C:\Users\User\Desktop\ADVPL\'
  Local cArquivo := 'RelProd.pdf'

  Private nLinha := 105
  Private oPrint
  Private oFont10 := TFont():New('Arial',,10,,.F.,,,,,.F.,.F.)
  Private oFont12 := TFont():New('Arial',,12,,.T.,,,,,.F.,.F.)
  Private oFont14 := TFont():New('Arial',,14,,.T.,,,,,.F.,.F.)
  Private oFont16 := TFont():New('Arial',,16,,.T.,,,,,.T.,.F.)

  oPrint := FwMSPrinter():New(cArquivo, IMP_PDF, .F., '', .T.,, @oPrint, '',,,,.T.)
  oPrint:cPathPDF := cCaminho

  oPrint:SetPortrait()
  oPrint:SetPaperSize(9)

  oPrint:StartPage()

  Cabecalho()
  ImprimeDados(cAlias)

  oPrint:EndPage()
  oPrint:Preview()
Return 

Static Function Cabecalho()

  oPrint:Box(15,15, 85,580, '-8')
  oPrint:Say(35,20, 'Empresa /Filial: '+Alltrim(SM0->M0_NOME)+ '/'+Alltrim(SM0->M0_FILIAL), oFont14,, PRETO)
  oPrint:Line(50, 15, 50, 580, VERMELHO,'-6')
  oPrint:Say(70,220,'Cadastro de Produto', oFont16,, PRETO)

  oPrint:Say(nLinha, 20,'CODIGO'      , oFont12,, PRETO)
  oPrint:Say(nLinha, 80,'DESCRICAO'   , oFont12,, PRETO)
  oPrint:Say(nLinha,320,'UNIDADE'     , oFont12,, PRETO)
  oPrint:Say(nLinha,400,'PRECO'       , oFont12,, PRETO)
  oPrint:Say(nLinha,500,'ARMAZEM'     , oFont12,, PRETO)


  nLinha+= 5
  oPrint:Line(nLinha, 15, nLinha, 580,,'-6')

  nLinha+= 10
Return 

Static Function ImprimeDados(cAlias)
  // Local nValorTotal := 0
  Private nCor      := PRETO


  DbSelectArea(cAlias)

  (cAlias)->(DbGoTop())

  While (cAlias)->(!EOF())
    ValidPag()

    oPrint:Say(nLinha, 20,alltrim((cAlias)->(B1_COD))       , oFont10,, PRETO)
    oPrint:Say(nLinha, 80,alltrim((cAlias)->(B1_DESC))      , oFont10,, PRETO)
    oPrint:Say(nLinha, 330,alltrim((cAlias)->(B1_UM))       , oFont10,, PRETO)
    oPrint:Say(nLinha, 400, "R$ "+alltrim(StrTran(Str((cAlias)->(B1_PRV1),,2),'.',',')), oFont10,, PRETO)
    oPrint:Say(nLinha, 520,alltrim((cAlias)->(B1_LOCPAD))   , oFont10,, PRETO)
    
    IncProc()
    // nValorTotal += (cAlias)->(B1_PRV1)
    nLinha+= 20
    (cAlias)->(DbSkip())
  enddo

  // oPrint:Line(730, 15, 730, 580,,'-6')
  // oPrint:Say(740,400,'Valor Total: '+cValToChar(nValorTotal), oFont16,, PRETO)

Return

Static Function ValidPag()
   if nLinha > MAX_LINE
    oPrint:EndPage()
    oPrint:StartPage()

    nLinha := 105

    cabecalho() 
  endif
Return 
