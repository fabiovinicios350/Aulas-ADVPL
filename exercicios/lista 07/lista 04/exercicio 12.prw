//Biblioteca
#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

//Constantes
#DEFINE cTITULO 'Algoritimos para pesquisar os pedidos de compra de um periodo'

/*/
  @author Fabio
  @since 27/02/2023
/*/

//Função para Pesquisar o pedido de compra
User Function Ex12List04()

  //Variaveis de entrada
  Local dDataInicio   := CTOD("")
  Local dDataFim      := CTOD("")

  //Variavies globais
  Local oDlg
  Local cTituloDlg    := 'Pesquisa de pedido de compra'

  //Tratando a data
  Set Date To British
  SET(_SET_EPOCH,1980)


  FwAlertInfo(cTITULO,"Bem vindo!")

  DEFINE MSDIALOG oDlg TITLE cTituloDlg FROM 000, 000 to 210, 180 PIXEL
  
  //Componentes de entrada
  @ 14, 10 SAY "Digite a data inicio: " SIZE 70, 07 OF oDlg PIXEL
  @ 22, 10 MSGET dDataInicio SIZE 70, 11 OF oDlg PIXEL

  @ 45, 10 SAY "Digite a data fim: " SIZE 70, 07 OF oDlg PIXEL
  @ 53, 10 MSGET dDataFim SIZE 70, 11 OF oDlg PIXEL

  @ 075,010 BUTTON "Pesquisar" SIZE 30, 11 ACTION (BuscaPed(dDataInicio,dDataFim)) PIXEL OF oDlg 
  @ 075,050 BUTTON "Sair" SIZE 30, 11 ACTION (oDlg:End()) PIXEL OF oDlg 

  ACTIVATE MSDIALOG  oDlg CENTERED

Return 

//Função para Buscar os pedidos de compra
Static Function BuscaPed(dDataInicio,dDataFim)

  //Variaveil de manibulação do banco de dados
  Local aArea       := GetArea()
  Local cAlias      := GetNextAlias()
  local cQuery      := ''

  //Variaveis para exibir o resultado
  Local cPedidoDB
  Local cMensagem   := ''

  cResultado := 'RESULTADO'

  dDataInicio := DTOS(dDataInicio)
  dDataFim := DTOS(dDataFim)

  //Conexão com o banco de dados
  PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SC5' MODULO 'COM'

  cQuery := "Select C5_NUM"+CRLF+; 
            "from "+RetSqlName('SC5')+CRLF+; 
            "where C5_EMISSAO between '"+dDataInicio+"' and '"+dDataFim+"'"

  //Armazenando o retorno da execução da query no banco de dados
  TCQUERY cQuery ALIAS &(cAlias) NEW

  //lendo o retorno da query
  while &(cAlias)->(!EOF())
    cPedidoDB:= &(cAlias)->(C5_NUM)
    cMensagem += 'Pedido: '+cPedidoDB+CRLF
    &(cAlias)->(DbSkip())
  enddo

  //Apresentando o resultando
  if(cMensagem=='')
    fwAlertError("Nao existe pedido criado nessas data",'Nenhum pedido criado')
  else
    fwAlertSuccess(cMensagem,'Pedido por data')
  endif

  &(cAlias)->(DbCloseArea())
  RestArea(aArea)
return


