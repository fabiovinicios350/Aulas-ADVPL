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


User Function Ex12List04()
  Local dDataInicio   := CTOD("DD/MM/AAAA")
  Local dDataFim      := CTOD("DD/MM/AAAA")
  Local oDlg
  Local cTituloDlg    := 'Pesquisa de pedido de compra'


  FwAlertInfo(cTITULO,"Bem vindo!")

  DEFINE MSDIALOG oDlg TITLE cTituloDlg FROM 000, 000 to 210, 180 PIXEL

  @ 14, 10 SAY "Digite a data inicio: " SIZE 70, 07 OF oDlg PIXEL
  @ 22, 10 MSGET dDataInicio SIZE 70, 11 OF oDlg PIXEL PICTURE '@D 99/99/9999'

  @ 45, 10 SAY "Digite a data fim: " SIZE 70, 07 OF oDlg PIXEL
  @ 53, 10 MSGET dDataFim SIZE 70, 11 OF oDlg PIXEL PICTURE '@D 99/99/9999'

  @ 075,010 BUTTON "Cadastrar" SIZE 30, 11 ACTION (Resultado(dDataInicio,dDataFim)) PIXEL OF oDlg 
  @ 075,050 BUTTON "Sair" SIZE 30, 11 ACTION (oDlg:End()) PIXEL OF oDlg 

  ACTIVATE MSDIALOG  oDlg CENTERED

Return 

Static Function Resultado(dDataInicio,dDataFim)
  Local aArea       := GetArea()
  Local cAlias      := GetNextAlias()
  local cQuery      := ''
  Local cPedidoDB
  Local cMensagem   := ''


  cResultado := 'RESULTADO'

  dDataInicio := DTOS(alltrim(dDataInicio))
  dDataFim := DTOS(alltrim(dDataFim))

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SC5' MODULO 'COM'

    cQuery := "Select C5_NUM"+CRLF+; 
              "from "+RetSqlName('SC5')+CRLF+; 
              "where C5_EMISSAO between '"+dDataInicio+"' and '"+dDataFim+"'"

    TCQUERY cQuery ALIAS &(cAlias) NEW

    while &(cAlias)->(!EOF())
      cPedidoDB:= &(cAlias)->(C5_NUM)
      cMensagem += 'Pedido: '+cPedidoDB+CRLF
      &(cAlias)->(DbSkip())
    enddo

    if(cMensagem=='')
      fwAlertError("Nao existe pedido criado nessas data",'Nenhum pedido criado')
    else
      fwAlertSuccess(cMensagem,'Pedido por data')
    endif

  &(cAlias)->(DbCloseArea())
  RestArea(aArea)
return


