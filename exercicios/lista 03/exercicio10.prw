//Bibliotecas
#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

//Constantes
#DEFINE cTITULO 'Algoritimo para Mostrar a media de vendas de um produto'


/*/
  @author Fabio
  @since ../../2023
/*/

User Function MediaDeVendaProduto()
  Local aArea       := GetArea()
  Local cAlias      := GetNextAlias()
  local cQuery      := ''
  Local lTentar     := .T.
  Local cCodigo
  Local nMedia

  while(lTentar)
    cCodigo := ''
    FwAlertInfo(cTITULO,"Bem vindo!")

    cCodigo := FwInputBox('Digite o codigo de um produto:',cCodigo)

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SB1' MODULO 'COM'

    cQuery := "Select  P.B1_COD,"+CRLF+;
              "CASE"+CRLF+;
              "WHEN (Select sum(C6_QTDVEN)/count(*) from "+RetSqlName('SC6')+" where C6_PRODUTO = P.B1_COD ) is null THEN 0"+CRLF+;
              "ELSE (Select sum(C6_QTDVEN)/count(*) from "+RetSqlName('SC6')+" where C6_PRODUTO = P.B1_COD )"+CRLF+;
              "END as media"+CRLF+;
              "from  "+RetSqlName('SB1')+" P"+CRLF+;
              "Where P.B1_COD='"+cCodigo+"'"

    TCQUERY cQuery ALIAS &(cAlias) NEW

    while &(cAlias)->(!EOF())
      cCodigo :=  &(cAlias)->(B1_COD)
      nMedia :=  &(cAlias)->(media)
      &(cAlias)->(DbSkip())
    enddo

    if(nMedia==nil)
      FwAlertError('Codigo nao existe','Codigo: '+cCodigo)
    elseif(nMedia==0)
      FwAlertInfo('Nenhuma venda vinculada a esse produto','Codigo: '+cCodigo)
    else
      FwAlertSucess('Media de venda: '+cValToChar(round(nMedia,2)),'Codigo: '+cCodigo)
    endif

    &(cAlias)->(DbCloseArea())
    RestArea(aArea)
    lTentar := MsgyesNo("Deseja tentar novamente? ","Tentar Novamente")
  enddo
  FwAlertInfo('Fim! <b>All Right!<b>','Resultado!')
Return 
