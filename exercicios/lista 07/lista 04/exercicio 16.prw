//Biblioteca
#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

//Constantes
#DEFINE cTITULO 'Algoritimos para puxar os clientes de um determinado estado'

/*/
  @author Fabio
  @since 27/02/2023
/*/

//Função para exibir os cliente de um determinado estado
User Function Ex16List04()

  //variaveis globais
  Local oDlg
  Local oOpcao
  Local cTituloDlg    := 'Pesquisa de pedido venda'

  //Variaveis de entrada
  Local cResList      := '01'
  Local aUF           := BuscarEstado()

  //variaveis para exibir o resultado
  Private cDescricao  := ''
  Private cValor      := ''


  FwAlertInfo(cTITULO,"Bem vindo!")

  DEFINE MSDIALOG oDlg TITLE cTituloDlg FROM 000, 000 to 190, 180 PIXEL
  
  //Componentes de entrada 
  @ 14, 10 SAY "Selecione um Estado: " SIZE 70, 07 OF oDlg PIXEL
  oOpcao  := TComboBox():New(022, 010, {|u| Iif(PCount() > 0 , cResList := u, cResList)}, aUF, 70, 11, oDlg, , /*bChange*/, /*bValid*/, /*nClrText*/, /*nClrBack*/, .T.,)
  @ 45,010 BUTTON "Pesquisar" SIZE 30, 15 ACTION (BuscaCli(alltrim(cResList))) PIXEL OF oDlg 
  @ 45,050 BUTTON "Sair" SIZE 30, 15 ACTION (oDlg:End()) PIXEL OF oDlg 

  ACTIVATE MSDIALOG  oDlg CENTERED
Return 

//Função para buscar os clientes
Static Function BuscaCli(cUF)

  //Variavei de manipulação do banco de dados
  Local aArea       := GetArea()
  Local cAlias      := GetNextAlias()
  local cQuery      := ''

  //variaveis para exibir o resultado
  Local cMensagem   := '' 
  Local cCliente
  Local cCodigo

  //Conexão com o banco de dados
  PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SA2' MODULO 'COM'

  cQuery := "Select A2_NOME, A2_COD From "+RetSqlName('SA2')+" where A2_EST='"+cUF+"'"

  //Armazenar o retorno da execução da query no banco de dados
  TCQUERY cQuery ALIAS &(cAlias) NEW

  //Ler o retorno da query
  while &(cAlias)->(!EOF())
    cCliente:= &(cAlias)->(A2_NOME)
    cCodigo:= &(cAlias)->(A2_COD)
    cMensagem += A2_COD+cCliente+CRLF
    &(cAlias)->(DbSkip())
  enddo

  //Exibir o resultado
  if(cMensagem=='')
    fwAlertError("Nao Existe clientes cadastrados nesse estado",'Retorno')
  else
    fwAlertSuccess(cMensagem,'Retorno')
  endif

  &(cAlias)->(DbCloseArea())
  RestArea(aArea)
return

//Função para buscar todos os estados
Static Function BuscarEstado()
  //Variaveis para manipular o banco de dados
  Local aArea       := GetArea()
  Local cAlias      := GetNextAlias()
  local cQuery      := ''
  
  //Variaveis para armazenare o retorno do banco de dados
  local aUF   := {}

  //Conexão com o banco de dados
  PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'CC2' MODULO 'COM'

  cQuery := "select CC2_EST from "+RetSqlName('CC2')+" group by CC2_EST

  //Armazenar o retorno da execução da query
  TCQUERY cQuery ALIAS &(cAlias) NEW

  //ler o retorno da query
  while &(cAlias)->(!EOF())
    aadd(aUF,&(cAlias)->(CC2_EST))
    &(cAlias)->(DbSkip())
  enddo

  &(cAlias)->(DbCloseArea())
  RestArea(aArea)
Return aUF

