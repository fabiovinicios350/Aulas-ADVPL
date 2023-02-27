//Biblioteca
#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'
//Constantes
#DEFINE cTITULO 'Algoritimos para pesquisar um produto'

/*/
  @author Fabio
  @since 27/02/2023
/*/


User Function Ex15List04()
  Local cCodigo       := space(15)
  Local oDlg
  Local cTituloDlg    := 'Pesquisa de produto'
  Private cDescricao  := ''
  Private cValor      := ''
  Private cResultado


  FwAlertInfo(cTITULO,"Bem vindo!")

  DEFINE MSDIALOG oDlg TITLE cTituloDlg FROM 000, 000 to 210, 180 PIXEL

  @ 14, 10 SAY "Digite o codigo do Produto: " SIZE 70, 07 OF oDlg PIXEL
  @ 22, 10 MSGET cCodigo SIZE 70, 11 OF oDlg PIXEL

  @ 45,010 BUTTON "Pesquisar" SIZE 30, 15 ACTION (Resultado(cCodigo)) PIXEL OF oDlg 
  @ 45,050 BUTTON "Sair" SIZE 30, 15 ACTION (oDlg:End()) PIXEL OF oDlg 

  @ 075, 30 SAY cResultado SIZE 90, 07 OF oDlg PIXEL
  @ 085, 10 SAY cDescricao SIZE 90, 07 OF oDlg PIXEL
  @ 095, 10 SAY cValor SIZE 90, 07 OF oDlg PIXEL

  ACTIVATE MSDIALOG  oDlg CENTERED

Return 

Static Function Resultado(cCodigo)
  Local aArea       := GetArea()
  Local cAlias      := GetNextAlias()
  local cQuery      := ''
  Local cDescr
  Local cPrecoVenda
  Local lCadastro   := .F.

  cResultado := 'RESULTADO'

  PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SB1' MODULO 'COM'

  cQuery := "Select B1_COD, B1_DESC, B1_PRV1"+CRLF+; 
            "from "+RetSqlName('SB1')+CRLF+; 
            "where B1_COD='"+cCodigo+"'"

  TCQUERY cQuery ALIAS &(cAlias) NEW

  while &(cAlias)->(!EOF())
    cCodigo:= &(cAlias)->(B1_COD)
    cDescr:= &(cAlias)->(B1_DESC)
    cPrecoVenda:= &(cAlias)->(B1_PRV1)
    cDescricao := "Descricao: "+cDescr
    cValor := "Valor: R$ "+cValToChar(cPrecoVenda)
    &(cAlias)->(DbSkip())
  enddo

  if(cDescricao=='')
    lCadastro := MsgyesNo("Produto não foi encontrado na nossa base de dados, deseja cadastrar o produto?",'Produto nao existe')
    if(lCadastro)
      Axcadastro('SB1', "Cadastrar Produto")
    endif
  endif



  

  &(cAlias)->(DbCloseArea())
  RestArea(aArea)
return


