#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function RelProduto
  FunÃ§Ã£o para criaÃ§Ã£o do relatorio de produtos
  @type  Function
  @author Fabio
  @since 03/04/2023
/*/
User Function RelProd()
  Local cTitulo       := 'Cadastro de Produto'
  Private cAlias      := 'SB1'
  Private cProgram    := 'RelProd'
  Private cDescr      := 'Relatorio de produtos'
  Private cSize       := 'M'
  Private aReturn     := {'Zebrado', 1, 'Administração', 1, 2, '', '', 1}
  Private cNomeRel    := SetPrint(cAlias,cProgram,'', @cTitulo, cDescr,,, .F.,, .T., cSize, .F.)
  Private nQtdLin     := 58
  Private m_pag       := 1
  
  SetDefault(aReturn, cAlias)

  RptStatus({|| ImprimeRel()}, cTitulo, 'Gerando relatorio... ' )
  
Return 

//FunÃ§Ã£o para montar o relatorio
Static Function ImprimeRel()
  Local nLinha  := 1
  Local nCont   := 0

  DbSelectArea('SB1')
  SB1->(DbSetOrder(1))

  while SB1->(!EOF())
    nCont++
    @ ++nLinha, 00 PSAY PADR('Codigo:', 15)+Alltrim(SB1->B1_COD)
    @ ++nLinha, 00 PSAY PADR('Descrição:', 15)+Alltrim(SB1->B1_DESC)
    @ ++nLinha, 00 PSAY PADR('Unid. medida:', 15)+Alltrim(SB1->B1_UM)
    @ ++nLinha, 00 PSAY PADR('Preço Venda:', 15)+'R$'+Strtran(Str(SB1->B1_PRV1,,2),'.',',')
    @ ++nLinha, 00 PSAY PADR('Armazen:', 15)+Alltrim(SB1->B1_LOCPAD)
    @ ++nLinha, 00 PSAY Replicate('-',100)
    if(nCont==10)
      nLinha :=0
      nCont := 0
    endif
    SB1->(DbSkip())
  enddo

  SET DEVICE TO SCREEN

  if aReturn[5] == 1
    SET PRINTER TO DbCommitAll()
    OurSpool(cNomeRel)
  endif

  MS_FLUSH()
Return 
