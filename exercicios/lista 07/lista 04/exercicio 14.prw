//Biblioteca
#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

//Constantes
#DEFINE cTITULO 'Algoritimos para puxar os pedidos de venda de um determindo produto'

/*/
  @author Fabio
  @since 27/02/2023
/*/

//Função para exibir os pedidos de venda de um produto
User Function Ex14List04()
  //variaveis globais
  Local oDlg
  Local cTituloDlg    := 'Pesquisa de pedido venda'
  
  //variaveis de entrada
  Local cCodigo       :=space(25)

  //variaveis para exibir o resultado
  Private cDescricao  := ''
  Private cValor      := ''

   //Conexão com o banco de dados
  PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SB1' MODULO 'COM'

  FwAlertInfo(cTITULO,"Bem vindo!")

  DEFINE MSDIALOG oDlg TITLE cTituloDlg FROM 000, 000 to 190, 180 PIXEL
  
  //Componentes de entrada
  @ 14, 10 SAY "Selecione um Produto: " SIZE 70, 07 OF oDlg PIXEL
  @ 22, 10 MSGET cCodigo F3 "SB1" SIZE 70, 11 OF oDlg PIXEL HASBUTTON
  @ 45,010 BUTTON "Pesquisar" SIZE 30, 15 ACTION (BuscaProd(cCodigo)) PIXEL OF oDlg 
  @ 45,050 BUTTON "Sair" SIZE 30, 15 ACTION (oDlg:End()) PIXEL OF oDlg 

  ACTIVATE MSDIALOG  oDlg CENTERED
Return 

//Função para busca os pedidos de uma determinar produto
Static Function BuscaProd(cCodigo)
  //Variaveis para manibulação do banco
  Local aArea       := GetArea()
  Local cAlias      := GetNextAlias()
  local cQuery      := ''
  
  //variaveis para exibir o resultado
  Local cMensagem   := '' 
  Local cPedido

  cQuery := "Select C6_NUM from "+RetSqlName('SC6')+" where C6_PRODUTO= '"+cCodigo+"'"

  //Armazenar o retorno da execução da query no banco de dados
  TCQUERY cQuery ALIAS &(cAlias) NEW

  //Ler o retorno da query
  while &(cAlias)->(!EOF())
    cPedido:= &(cAlias)->(C6_NUM)
    cMensagem += cPedido+', '+CRLF
    &(cAlias)->(DbSkip())
  enddo

  //Informar o resultado
  if(cMensagem=='')
    fwAlertError("Nao existe venda para esse produto",'Retorno')
  else
    fwAlertSuccess(cMensagem,'Retorno')
  endif

  //Fechar a conexão com o banco de dados
  &(cAlias)->(DbCloseArea())
  RestArea(aArea)
return
