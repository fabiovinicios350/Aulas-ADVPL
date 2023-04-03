#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function RelProduto
  Função para criação do relatorio de produtos
  @type  Function
  @author Fabio
  @since 03/04/2023
/*/
User Function Rel2Pro()
  Local cTitulo       := 'Cadastro de Produto'
  Private cAlias      := 'SB1'
  Private cProgram    := 'Rel2Pro'
  Private cDescr      := 'Relatorio de produtos'
  Private cSize       := 'M'
  Private nLastKey    := 0
  Private aReturn     := {'Zebrado', 1, 'Administra��o', 1, 2, '', '', 1}
  Private cNomeRel    := SetPrint(cAlias,cProgram,'', @cTitulo, cDescr,,, .F.,, .T., cSize, .F.)
  Private nQtdLin     := 58
  Private m_pag       := 1
  
  if nLastKey == 27
		FwAlertError('Opera��o cancelada pelo usu�rio!', 'Cancelado!')
		Return
	endif

  SetDefault(aReturn, cAlias)

  RptStatus({|| ImprimeRel(cTitulo)}, cTitulo, 'Gerando relatorio... ' )
  
Return 

//Função para montar o relatorio
Static Function ImprimeRel(cTitulo)
  Local nLinha  := 8
  Local cCabec  := PADR('Codigo', 10)+PADR('Descri��o', 70)+PADR('UN', 7)+PADR('Pre�o', 10)+PADR('Armaz�m', 8)    
  DbSelectArea('SB1')
  SB1->(DbSetOrder(1))

  Cabec(cTitulo, cCabec, '',, cSize)

  while SB1->(!EOF())
    nLinha++
    @ nLinha, 00 PSAY alltrim(SB1->B1_COD)
    @ nLinha, 10 PSAY alltrim(SB1->B1_DESC)
    @ nLinha, 80 PSAY alltrim(SB1->B1_UM)
    @ nLinha, 87 PSAY alltrim(Strtran(Str(SB1->B1_PRV1,,2),'.',','))
    @ nLinha, 97 PSAY CVALTOCHAR(SB1->B1_LOCPAD)
    @ ++nLinha, 00 PSAY Replicate('-',300)
    SB1->(DbSkip())
  enddo

  SET DEVICE TO SCREEN

  if aReturn[5] == 1
    SET PRINTER TO DbCommitAll()
    OurSpool(cNomeRel)
  endif

  MS_FLUSH()
Return 
