//Bibliotecas
#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

//Constantes
#DEFINE cTITULO 'Algoritimos para pesquisar um produto'


/*/
  @author Fabio
  @since ../../2023
/*/

User Function List3PesquisaProduto()
  Local aArea       := GetArea()
  Local cAlias      := GetNextAlias()
  local cQuery      := ''
  Local lTentar     := .T.
  local cMensagem   := ''
  Local cCodigo
  Local cDescricao
  Local cPrecoVenda


  while(lTentar)
    cMensagem :=''
    cCodigo := ''
    FwAlertInfo(cTITULO,"Bem vindo!")

    cCodigo := FwInputBox('Digite o codigo de um produto:',cCodigo)

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SB1' MODULO 'COM'

    cQuery := "Select B1_COD, B1_DESC, B1_PRV1"+CRLF+; 
              "from "+RetSqlName('SB1')+CRLF+; 
              "where B1_COD='"+cCodigo+"'"

    TCQUERY cQuery ALIAS &(cAlias) NEW

    while &(cAlias)->(!EOF())
      cCodigo:= &(cAlias)->(B1_COD)
      cDescricao:= &(cAlias)->(B1_DESC)
      cPrecoVenda:= &(cAlias)->(B1_PRV1)
      cMensagem += cCodigo+' - '+cDescricao+' - '+cValToChar(cPrecoVenda)+CRLF
      &(cAlias)->(DbSkip())
    enddo

    if(cMensagem=='')
      fwAlertError("Produto não foi encontrado na nossa base de dados",'Produto nao existe')
    else
      fwAlertSuccess(cMensagem,'Produto Encontrado!')
    endif

    &(cAlias)->(DbCloseArea())
    RestArea(aArea)
    lTentar := MsgyesNo("Deseja tentar novamente? ","Tentar Novamente")
  enddo
  FwAlertInfo('Fim! <b>All Right!<b>','Resultado!')
Return 
