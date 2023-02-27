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


User Function Ex11List04()
  Local cCodigo       := space(15)
  Local oDlg
  Local cTituloDlg    := 'Pesquisa de produto'
  Private cRes        := ''
  Private cResultado


  FwAlertInfo(cTITULO,"Bem vindo!")

  DEFINE MSDIALOG oDlg TITLE cTituloDlg FROM 000, 000 to 200, 180 PIXEL

  @ 14, 10 SAY "Digite o codigo do Produto: " SIZE 70, 07 OF oDlg PIXEL
  @ 22, 10 MSGET cCodigo SIZE 70, 11 OF oDlg PIXEL

  @ 45,010 BUTTON "Pesquisar" SIZE 30, 15 ACTION (Resultado(cCodigo)) PIXEL OF oDlg 
  @ 45,050 BUTTON "Sair" SIZE 30, 15 ACTION (oDlg:End()) PIXEL OF oDlg 

  @ 075, 30 SAY cResultado SIZE 90, 07 OF oDlg PIXEL
  @ 085, 10 SAY cRes SIZE 90, 07 OF oDlg PIXEL

  ACTIVATE MSDIALOG  oDlg CENTERED

Return 

Static Function Resultado(cCodigo)
  Local aArea       := GetArea()
  Local cAlias      := GetNextAlias()
  local cQuery      := ''
  Local cDescricao
  Local cPrecoVenda

  cResultado := 'RESULTADO'

  PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SB1' MODULO 'COM'

  cQuery := "Select B1_COD, B1_DESC, B1_PRV1"+CRLF+; 
            "from "+RetSqlName('SB1')+CRLF+; 
            "where B1_COD='"+cCodigo+"'"

  TCQUERY cQuery ALIAS &(cAlias) NEW

  while &(cAlias)->(!EOF())
    cCodigo:= &(cAlias)->(B1_COD)
    cDescricao:= &(cAlias)->(B1_DESC)
    cPrecoVenda:= &(cAlias)->(B1_PRV1)
    cRes += cCodigo+' - '+cDescricao+' - '+cValToChar(cPrecoVenda)+CRLF
    &(cAlias)->(DbSkip())
  enddo

  if(cRes=='')
    fwAlertError("Produto não foi encontrado na nossa base de dados",'Produto nao existe')
  endif

  &(cAlias)->(DbCloseArea())
  RestArea(aArea)
return


