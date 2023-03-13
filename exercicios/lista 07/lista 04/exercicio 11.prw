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

//Função para pesquisar um produto
User Function Ex11List04()

  //Variaveis de entrada
  Local cCodigo       := space(15)

  //Variaveis globais
  Local oDlg
  Local cTituloDlg    := 'Pesquisa de produto'

  //variaveis para exibir o resultado
  Private cDescricao  := ''
  Private cValor      := ''
  Private cTituloRes


  FwAlertInfo(cTITULO,"Bem vindo!")

  DEFINE MSDIALOG oDlg TITLE cTituloDlg FROM 000, 000 to 210, 180 PIXEL

  //Componentes de entrada
  @ 14, 10 SAY "Digite o codigo do Produto: " SIZE 70, 07 OF oDlg PIXEL
  @ 22, 10 MSGET cCodigo SIZE 70, 11 OF oDlg PIXEL

  @ 45,010 BUTTON "Pesquisar" SIZE 30, 15 ACTION (BuscaProd(cCodigo)) PIXEL OF oDlg 
  @ 45,050 BUTTON "Sair" SIZE 30, 15 ACTION (oDlg:End()) PIXEL OF oDlg 

  //Compontes para exibir o resultado
  @ 075, 30 SAY cTituloRes SIZE 90, 07 OF oDlg PIXEL
  @ 085, 10 SAY cDescricao SIZE 90, 07 OF oDlg PIXEL
  @ 095, 10 SAY cValor SIZE 90, 07 OF oDlg PIXEL

  ACTIVATE MSDIALOG  oDlg CENTERED
Return 

// Função para buscar o produto
Static Function BuscaProd(cCodigo)

  //Variaveis para maninupalação no banco
  Local aArea       := GetArea()
  Local cAlias      := GetNextAlias()
  local cQuery      := ''

  //Variaveis de resultaod
  Local cDescr
  Local cPrecoVenda

  cTituloRes := 'RESULTADO'

  //Abrindo conexão com o banco
  PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SB1' MODULO 'COM'

  cQuery := "Select B1_COD, B1_DESC, B1_PRV1"+CRLF+; 
            "from "+RetSqlName('SB1')+CRLF+; 
            "where B1_COD='"+cCodigo+"'"

  //Armazenadno o retorno da execução da query no banco de dados
  TCQUERY cQuery ALIAS &(cAlias) NEW

  //lendo o retorno no banco de dados
  while &(cAlias)->(!EOF())
    cCodigo:= &(cAlias)->(B1_COD)
    cDescr:= &(cAlias)->(B1_DESC)
    cPrecoVenda:= &(cAlias)->(B1_PRV1)
    cDescricao := "Descricao: "+cDescr
    cValor := "Valor: R$ "+cValToChar(cPrecoVenda)
    &(cAlias)->(DbSkip())
  enddo

  if(cDescricao=='')
    fwAlertError("Produto não foi encontrado na nossa base de dados",'Produto nao existe')
  endif

  &(cAlias)->(DbCloseArea())
  RestArea(aArea)
return


