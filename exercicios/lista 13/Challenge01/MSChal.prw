#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'RPTDEF.CH'
#INCLUDE 'FWPRINTSETUP.CH'

#DEFINE PRETO         RGB(0,0,0)
#DEFINE VERMELHO      RGB(255,0,0)
#DEFINE MAX_LINE      635

#DEFINE LOGO_EMPRESA  'C:\TOTVS12\Protheus\img\logo-totvs.jpeg'

/*/{Protheus.doc} User Function MSChal
  (Função para gerar o relatorio em MSPrinter de pedido de venda)
  @type  Function
  @author Fabio
  @since 17/04/2023
/*/
User Function MSVeCha()
  Local cAlias 

  cConteudoLog += 'Log do pedido '+M->C5_NUM+CRLF+CRLF
  cAlias := GeraCons()

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

  cConteudoLog += '['+Time()+'] - Gerando consulta SQL'+CRLF
  cQuery := "SELECT"+CRLF+;
	"SA1.A1_COD, SA1.A1_NOME, SA1.A1_EMAIL, SA1.A1_IPWEB, SA1.A1_CONTATO, SA1.A1_END, SA1.A1_BAIRRO, SA1.A1_MUN, SA1.A1_CEP, SA1.A1_DDD,SA1.A1_TEL, SA1.A1_FAX, SA1.A1_CGC, SA1.A1_INSCR,"+CRLF+;
	"SE4.E4_CODIGO, SE4.E4_DESCRI,"+CRLF+;
	"SA4.A4_COD, SA4.A4_NOME,"+CRLF+;
	"SC5.C5_NUM, SC5.C5_EMISSAO, SC5.C5_ESPECI1,SC5.C5_VOLUME1, SC5.C5_TPFRETE, SC5.C5_FRETE, SC5.C5_DESPESA, SC5.C5_MENNOTA, SC5.C5_DESC1, SC5.C5_DESC2, SC5.C5_DESC3, SC5.C5_DESC4,"+CRLF+;
	"SA3.A3_COD, SA3.A3_NOME,"+CRLF+;
	"SC6.C6_ITEM, SC6.C6_PRODUTO, SC6.C6_DESCRI, SC6.C6_UM, SC6.C6_QTDVEN, SC6.C6_PRCVEN, SC6.C6_VALOR, SC6.C6_IPITRF, SC6.C6_ENTREG, SC6.C6_DTVALID"+CRLF+;
  "FROM "+RetSqlName('SC5')+" SC5"+CRLF+;
  "JOIN "+RetSqlName('SC6')+" SC6 ON SC6.C6_NUM = SC5.C5_NUM AND SC6.D_E_L_E_T_=' '"+CRLF+;
  "JOIN "+RetSqlName('SA1')+" SA1 ON SA1.A1_COD = SC5.C5_CLIENTE AND SA1.D_E_L_E_T_=' '"+CRLF+;
  "JOIN "+RetSqlName('SE4')+" SE4 ON SE4.E4_CODIGO = SC5.C5_CONDPAG AND SE4.D_E_L_E_T_=' '"+CRLF+;
  "LEFT JOIN "+RetSqlName('SA4')+" SA4 ON SA4.A4_COD = SC5.C5_TRANSP AND SA4.D_E_L_E_T_=' '"+CRLF+;
  "LEFT JOIN "+RetSqlName('SA3')+" SA3 ON SA3.A3_COD = SC5.C5_VEND1 AND SA3.D_E_L_E_T_=' '"+CRLF+;
  "WHERE SC5.D_E_L_E_T_=' ' AND SC5.C5_NUM='"+M->C5_NUM+"'"

  TCQUERY cQuery ALIAS (cAlias) NEW

  (cAlias)->(DbGoTop())

  if (cAlias)->(EOF())
    cAlias := ''
  endif 

  RestArea(aArea)
Return cAlias

Static Function MontaRel(cAlias)
  Local cArquivo := 'Vend'+M->C5_NUM+'.pdf'

  Private nLinha := 145
  Private oPrint
  Private oFont10     := TFont():New('Arial',,10,,.F.,,,,,.F.,.F.)
  Private oFont10Bold := TFont():New('Arial',,10,,.T.,,,,,.F.,.F.)
  Private oFont12     := TFont():New('Arial',,12,,.F.,,,,,.F.,.F.)
  Private oFont12Bold := TFont():New('Arial',,12,,.T.,,,,,.F.,.F.)
  Private oFont14     := TFont():New('Arial',,14,,.F.,,,,,.F.,.F.)
  Private oFont14Bold := TFont():New('Arial',,14,,.T.,,,,,.F.,.F.)
  Private oFont16     := TFont():New('Arial',,16,,.F.,,,,,.F.,.F.)
  Private oFont16Bold := TFont():New('Arial',,16,,.T.,,,,,.F.,.F.)
  Private oFont18Bold := TFont():New('Arial',,18,,.T.,,,,,.F.,.F.)

  cConteudoLog += '['+Time()+'] - Criando o relatorio'+CRLF

  oPrint := FwMSPrinter():New(cArquivo, IMP_PDF, .F., '', .T.,, @oPrint, '',,,,.T.)
  oPrint:cPathPDF := cCaminho + cPasta
  cConteudoLog += '['+Time()+'] -  Executando a Query no banco de dados'+CRLF

  oPrint:SetPortrait()
  oPrint:SetPaperSize(9)

  oPrint:StartPage()

  Cabecalho()
  ImprimeDados(cAlias)

  oPrint:EndPage()
  oPrint:Preview()
  cConteudoLog += '['+Time()+'] - Finalizando o relatorio'+CRLF
Return

Static Function Cabecalho()
  cConteudoLog += '['+Time()+'] - Adicionando o Cabeçalho do pedido'+CRLF
  oPrint:SayBitMap(15, 15, LOGO_EMPRESA, 300,90)
  oPrint:SayAlign(30, 15, "MICROSIGA SOFWARES S.A.", oFont18Bold,565,,,1)
  oPrint:SayAlign(47, 15, "AV. BRASIL, 329 CAMPINAS/SP 13098-888", oFont14,565,,,1)
  oPrint:SayAlign(60, 15, "E-mail: motores@ultramotores.com.br", oFont12Bold,565,,,1)
  oPrint:SayAlign(75, 15, "Fone: 30276600 FAX: 30276600", oFont12,565,,,1)
  oPrint:SayAlign(90, 15, "CNPJ: 53.113.791/0001-12 - IE: 111.010.945.111", oFont12,565,,,1)
Return

Static Function CabecaItens()
  cConteudoLog += '['+Time()+'] - Adicionando o Cabeçalho dos itens'+CRLF
  oPrint:Box(nLinha,15,  nLinha+((nQtdItens+1)*12.4),45, '-6')
  oPrint:Box(nLinha,45,  nLinha+((nQtdItens+1)*12.4),115, '-6')
  oPrint:Box(nLinha,115, nLinha+((nQtdItens+1)*12.4),285, '-6')
  oPrint:Box(nLinha,285, nLinha+((nQtdItens+1)*12.4),305, '-6')
  oPrint:Box(nLinha,305, nLinha+((nQtdItens+1)*12.4),340, '-6')
  oPrint:Box(nLinha,340, nLinha+((nQtdItens+1)*12.4),410, '-6')
  oPrint:Box(nLinha,410, nLinha+((nQtdItens+1)*12.4),480, '-6')
  oPrint:Box(nLinha,480, nLinha+((nQtdItens+1)*12.4),510, '-6')
  oPrint:Box(nLinha,510, nLinha+((nQtdItens+1)*12.4),580, '-6')
  nLinha+=2
  oPrint:SayAlign(nLinha, 15, "Item",                   oFont10Bold,30,,,2)
  oPrint:SayAlign(nLinha, 45, "Produto",                oFont10Bold,70,,,2)
  oPrint:SayAlign(nLinha, 120,"Descrição do Produto",   oFont10Bold,165,,,0)
  oPrint:SayAlign(nLinha, 285,"UM",                     oFont10Bold,20,,,2)
  oPrint:SayAlign(nLinha, 305,"Qtd.",                   oFont10Bold,35,,,2)
  oPrint:SayAlign(nLinha, 340,"Prc Unit.",              oFont10Bold,70,,,2)
  oPrint:SayAlign(nLinha, 410,"Prc Total",              oFont10Bold,70,,,2)
  oPrint:SayAlign(nLinha, 480,"IPI",                    oFont10Bold,30,,,2)
  oPrint:SayAlign(nLinha, 510,"Data Entrega",           oFont10Bold,70,,,2)

  oPrint:Line(nLinha+11, 15, nLinha+11, 580,,'-6')

Return

Static Function ImprimeDados(cAlias)
  
  //Variaveis do Cliente Pedido
  Local cNomeCli
  Local cEmailCli
  Local cEndCli
  Local cCidadeCli 
  Local cTelCli
  Local cCNPJCli
  Local cSiteCli
  Local cContatoCli
  Local cBairroCli
  Local cCEPCli
  Local cFAXCli
  Local cIECli

  

  Private nQtdItens   := 0
  Private nCor        := PRETO
  Private nValorTotal := 0

  DbSelectArea(cAlias)

  //Recebendo os dados do Cliente
  cNomeCli := alltrim((cAlias)->(A1_COD))+' - '+alltrim((cAlias)->(A1_NOME))
  cEmailCli := alltrim((cAlias)->(A1_EMAIL))
  cEndCli := alltrim((cAlias)->(A1_END))
  cCidadeCli := alltrim((cAlias)->(A1_MUN))
  cTelCli := '('+alltrim((cAlias)->(A1_DDD))+') '+TRANSFORM((alltrim((cAlias)->(A1_TEL))),'@R 9999-9999')
  cCNPJCli := TRANSFORM((alltrim((cAlias)->(A1_CGC))),'@R 99.999.999/9999-99')
  cSiteCli := alltrim((cAlias)->(A1_IPWEB))
  cContatoCli := alltrim((cAlias)->(A1_CONTATO))
  cBairroCli := alltrim((cAlias)->(A1_BAIRRO))
  cCEPCli := TRANSFORM((alltrim((cAlias)->(A1_CEP))),'@R 99999-999')
  cFAXCli := '('+alltrim((cAlias)->(A1_DDD))+') '+TRANSFORM((alltrim((cAlias)->(A1_FAX))),'@R 9999-9999')
  cIECli := alltrim((cAlias)->(A1_INSCR))


  oPrint:Line(105, 15, 105, 580, PRETO,'-9')
  oPrint:SayAlign(110, 15, "Pedido de venda: Nº "+alltrim((cAlias)->(C5_NUM)), oFont16Bold,282,,,0)
  oPrint:SayAlign(110, 297, "Data: "+TRANSFORM((StoD((cAlias)->(C5_EMISSAO))),'@R 99/99/9999'), oFont16Bold,282,,,1)
  oPrint:Line(130, 15, 130, 580,,'-9')

  oPrint:Say(nLinha, 15,'Cliente ', oFont12Bold,, PRETO)
  oPrint:Say(nLinha, 60,': '+cNomeCli, oFont12,, PRETO)
  oPrint:Say(nLinha, 297,'Site ', oFont12Bold,, PRETO)
  oPrint:Say(nLinha, 342,': '+cSiteCli, oFont12,, PRETO)
  nLinha+= 15
  oPrint:Say(nLinha, 15,'E-Mail ', oFont12Bold,, PRETO)
  oPrint:Say(nLinha, 60,': '+cEmailCli, oFont12,, PRETO)
  oPrint:Say(nLinha, 297,'Contato ', oFont12Bold,, PRETO)
  oPrint:Say(nLinha, 342,': '+cContatoCli, oFont12,, PRETO)
  nLinha+= 15
  oPrint:Say(nLinha, 15,'Endereço ', oFont12Bold,, PRETO)
  oPrint:Say(nLinha, 60,': '+cEndCli, oFont12,, PRETO)
  oPrint:Say(nLinha, 297,'Bairro ', oFont12Bold,, PRETO)
  oPrint:Say(nLinha, 342,': '+cBairroCli, oFont12,, PRETO)
  nLinha+= 15
  oPrint:Say(nLinha, 15,'Cidade ', oFont12Bold,, PRETO)
  oPrint:Say(nLinha, 60,': '+cCidadeCli, oFont12,, PRETO)
  oPrint:Say(nLinha, 297,'CEP ', oFont12Bold,, PRETO)
  oPrint:Say(nLinha, 342,': '+cCEPCli, oFont12,, PRETO)
  nLinha+= 15
  oPrint:Say(nLinha, 15,'TEL ', oFont12Bold,, PRETO)
  oPrint:Say(nLinha, 60,': '+cTelCli, oFont12,, PRETO)
  oPrint:Say(nLinha, 297,'FAX ', oFont12Bold,, PRETO)
  oPrint:Say(nLinha, 342,': '+cFAXCli, oFont12,, PRETO)
  nLinha+= 15
  oPrint:Say(nLinha, 15,'CNPJ ', oFont12Bold,, PRETO)
  oPrint:Say(nLinha, 60,': '+cCNPJCli, oFont12,, PRETO)
  oPrint:Say(nLinha, 297,'I.E. ', oFont12Bold,, PRETO)
  oPrint:Say(nLinha, 342,': '+cIECli, oFont12,, PRETO)
  nLinha+= 15

  cConteudoLog += '['+Time()+'] - Adicionando os dados do cliente'+CRLF

  While (cAlias)->(!EOF())
    nQtdItens++
    (cAlias)->(DbSkip())
  enddo

  CabecaItens()
  (cAlias)->(DbGoTop())
  While (cAlias)->(!EOF())
    cConteudoLog += '['+Time()+'] - Adicionando o Item '+(cAlias)->(C6_ITEM)+CRLF
    nLinha+=12
    oPrint:SayAlign(nLinha, 15, alltrim((cAlias)->(C6_ITEM)),     oFont10,30,,,2)
    oPrint:SayAlign(nLinha, 45, alltrim((cAlias)->(C6_PRODUTO)),  oFont10,70,,,2)
    oPrint:SayAlign(nLinha, 120,alltrim((cAlias)->(C6_DESCRI)),   oFont10,165,,,0)
    oPrint:SayAlign(nLinha, 285,alltrim((cAlias)->(C6_UM)),       oFont10,20,,,2)
    oPrint:SayAlign(nLinha, 305,cValToChar((cAlias)->(C6_QTDVEN)),   oFont10,35,,,2)
    oPrint:SayAlign(nLinha, 340,"R$ "+alltrim(Strtran(Str((cAlias)->(C6_PRCVEN),,2),'.',',')),   oFont10,70,,,2)
    oPrint:SayAlign(nLinha, 410,"R$ "+alltrim(Strtran(Str((cAlias)->(C6_VALOR),,2),'.',',')),    oFont10,70,,,2)
    oPrint:SayAlign(nLinha, 480,cValtoChar((cAlias)->(C6_IPITRF))+' %',   oFont10,30,,,2)
    oPrint:SayAlign(nLinha, 510,DtoC(StoD((cAlias)->(C6_ENTREG))),   oFont10,70,,,2)
    nValorTotal+=(cAlias)->(C6_VALOR)
    (cAlias)->(DbSkip())
  enddo
  (cAlias)->(DbGoTop())
  Resumo(cAlias)
  Rodap(cAlias)
Return

Static Function ValidPag()   
  if nLinha > MAX_LINE
    oPrint:EndPage()
    oPrint:StartPage()

    nLinha := 105

    cabecalho() 
  endif
Return

Static Function Resumo(cAlias)
  cConteudoLog += '['+Time()+'] - Adicionando o Resumo'+CRLF
  //Criando as celulas de resumo
  nLinha+= 20
  oPrint:Box(nLinha,115, nLinha+27,305, '-6')
  oPrint:Box(nLinha,340, nLinha+13.5,480, '-6')
  oPrint:Line(nLinha, 210, nLinha+27, 210,,'-6')

  //Inserindo os registro de resumo
  nLinha+=1
  oPrint:SayAlign(nLinha, 120,"Valor Frete",   oFont12Bold,87,,,0)
  oPrint:SayAlign(nLinha, 212,"R$ "+alltrim(Strtran(Str((cAlias)->(C5_FRETE),,2),'.',',')),   oFont12Bold,87,,,1)

  oPrint:SayAlign(nLinha, 345,"Valor Total",   oFont12Bold,65,,,0)
  oPrint:SayAlign(nLinha, 415,"R$ "+alltrim(Strtran(Str(nValorTotal,,2),'.',',')),   oFont12Bold,60,,,1)

  nLinha+=12
  oPrint:Line(nLinha, 115, nLinha, 305,,'-6')

  nLinha+=2
  oPrint:SayAlign(nLinha, 120,"Valor Despesa",   oFont12Bold,87,,,0)
  oPrint:SayAlign(nLinha, 212,"R$ "+alltrim(Strtran(Str((cAlias)->(C5_DESPESA),,2),'.',',')),   oFont12Bold,87,,,1)
Return 

Static Function Rodap(cAlias)
  //Variaveis do pedido
  Local cFormaPag
  Local cTransportadora
  Local cEspVol
  Local cTipoFrete
  Local cVendedor
  Local cValidade
  Local cMensagem
  Local cDesconto

  //Variaveis Globais
  Local nLinhaRod := 685

  cConteudoLog += '['+Time()+'] - Adicionando oo rodape'+CRLF
  //Recebendo os dados ddo pedido
  cFormaPag := alltrim((cAlias)->(E4_CODIGO))+" - "+alltrim((cAlias)->(E4_DESCRI))
  cTransportadora := "("+alltrim((cAlias)->(A4_COD))+") "+alltrim((cAlias)->(A4_NOME))
  cEspVol := alltrim((cAlias)->(C5_ESPECI1))
  cVolume := alltrim((cAlias)->(C5_VOLUME1))
  cTipoFrete := alltrim((cAlias)->(C5_TPFRETE))
  cVendedor := "("+alltrim((cAlias)->(A3_COD))+") "+alltrim((cAlias)->(A3_NOME))
  cValidade := DtoC(StoD((cAlias)->(C6_DTVALID)))
  cMensagem := alltrim((cAlias)->(C5_MENNOTA))
  cDesconto := alltrim(Strtran(Str((cAlias)->(C5_DESC1),,2),'.',','))+' + '+alltrim(Strtran(Str((cAlias)->(C5_DESC2),,2),'.',','))+' + '+alltrim(Strtran(Str((cAlias)->(C5_DESC3),,2),'.',','))+' + '+alltrim(Strtran(Str((cAlias)->(C5_DESC4),,2),'.',','))

  oPrint:Box(nLinhaRod,15, 790,580, '-6')
  nLinhaRod+= 10
  oPrint:SayAlign(nLinhaRod,15,"Informações Gerais",   oFont16Bold,565,,,2)

  nLinhaRod+= 30
  oPrint:Say(nLinhaRod, 25,'Forma de Pagamento ', oFont12Bold,, PRETO)
  oPrint:Say(nLinhaRod, 150,': '+cFormaPag, oFont12,, PRETO)
  nLinhaRod+= 15
  oPrint:Say(nLinhaRod, 25,'Transportadora ', oFont12Bold,, PRETO)
  oPrint:Say(nLinhaRod, 150,': '+cTransportadora, oFont12,, PRETO)
  nLinhaRod+= 15
  oPrint:Say(nLinhaRod, 25,'Especie', oFont12Bold,, PRETO)
  oPrint:Say(nLinhaRod, 150,': '+cEspVol, oFont12,, PRETO)
  oPrint:Say(nLinhaRod, 300,'Tipo Frete ', oFont12Bold,, PRETO)
  oPrint:Say(nLinhaRod, 342,': '+cTipoFrete, oFont12,, PRETO)
  nLinhaRod+= 15
  oPrint:Say(nLinhaRod, 25,'Volume', oFont12Bold,, PRETO)
  oPrint:Say(nLinhaRod, 150,': '+cTipoFrete, oFont12,, PRETO)
  oPrint:Say(nLinhaRod, 300,'Vendedor', oFont12Bold,, PRETO)
  oPrint:Say(nLinhaRod, 342,': '+cVendedor, oFont12,, PRETO)
  nLinhaRod+= 15
  oPrint:Say(nLinhaRod, 25,'Desconto', oFont12Bold,, PRETO)
  oPrint:Say(nLinhaRod, 150,': '+cDesconto, oFont12,, PRETO)
  oPrint:Say(nLinhaRod, 300,'Validade', oFont12Bold,, PRETO)
  oPrint:Say(nLinhaRod, 342,': '+cValidade, oFont12,, PRETO)
  nLinhaRod+= 15

  
  oPrint:Box(nLinhaRod,15, 830,580, '-6')
  nLinhaRod+= 15
  oPrint:Say(nLinhaRod, 25,'Mensagem', oFont12Bold,, PRETO)
  oPrint:Say(nLinhaRod, 50,': '+cMensagem, oFont12,, PRETO)

  oPrint:SayAlign(nLinhaRod,455,"Paginas 1/1",   oFont16Bold,100,,,1)
Return 
