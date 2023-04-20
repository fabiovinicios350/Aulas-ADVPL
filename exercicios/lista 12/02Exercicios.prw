#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

// Alinhamento
#DEFINE LEFT    1
#DEFINE CENTER  2
#DEFINE RIGHT   3

// Formatação
#DEFINE GERAL     1
#DEFINE NUMERICO  2
#DEFINE MONETARIO 3
#DEFINE DATETIME  4

/*/{Protheus.doc} User Function PlanFor
  Função para montar uma planilha de cadastro de produtos
  @type  Function
  @author Fabio
  @since 20/04/2023
/*/
User Function PlanProd()
  Local aArea   := GetArea()
  Local cAlias  := GeraQuery()
  Local cPath           := 'C:\Users\User\Desktop\'
  Local cArq            := 'Produtos.xls'
  Local cWorkSheet      := 'Produtos'
  Local cTable          := 'Dados dos Produtos'
  Local oExc
  Private oExcel          := FwMsExcelEx():New()

  

  //Adicionado Aba
  oExcel:AddWorkSheet(cWorkSheet)

  //Adicionado tabela
  oExcel:AddTable(cWorkSheet, cTable)

  //Adicionar colunas
  oExcel:AddColumn(cWorkSheet, cTable, 'Codigo',        CENTER,      GERAL)
  oExcel:AddColumn(cWorkSheet, cTable, 'Descrição',     LEFT,        GERAL)
  oExcel:AddColumn(cWorkSheet, cTable, 'Tipo',          CENTER,      GERAL)
  oExcel:AddColumn(cWorkSheet, cTable, 'UM',            CENTER,      GERAL)
  oExcel:AddColumn(cWorkSheet, cTable, 'Preço venda',   CENTER,      MONETARIO)

  //Aplicar estilização 
  EstPla()

  //Adiciondo as linhas
  while (cAlias)->(!EOF())
    if((cAlias)->(Deletado)=='*')
      oExcel:AddRow(cWorkSheet, cTable, {(cAlias)->(B1_COD),(cAlias)->(B1_DESC),(cAlias)->(B1_TIPO),(cAlias)->(B1_UM),(cAlias)->(B1_PRV1)},{1,2,3,4,5,})
    else
      oExcel:AddRow(cWorkSheet, cTable, {(cAlias)->(B1_COD),(cAlias)->(B1_DESC),(cAlias)->(B1_TIPO),(cAlias)->(B1_UM),(cAlias)->(B1_PRV1)})
    endif
    (cAlias)->(DbSkip())
  enddo

   //Ativando o Excel
  oExcel:Activate()

  //Gerando o arquivo Excel
  oExcel:GetXMLFile(cPath+cArq)

  //Abrindo o arquivo
  if ApOleClient('MsExcel')
    oExc := MsExcel():New()
    oExc:WorkBooks:Open(cPath+cArq)
    oExc:SetVisible(.T.)
    oExc:Destroy()
  else
    FwAlertError("Excel não enontrado no Windoes","Excel não encontrado")
  endif

  FwAlertSuccess("Arquivo gerado com sucesso","Conluido")

  //Fecha o uso da Excel
  oExcel:DeActivate()

  (cAlias)->(DbCloseArea())
  RestArea(aArea)
Return 

//Função para gera a query
Static Function GeraQuery()
  Local cAlias    := GetNextAlias()
  Local cQuery

  PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SB1' MODULO 'COM'
  
  cQuery := "SELECT B1_COD, B1_DESC, B1_TIPO, B1_UM, B1_PRV1, D_E_L_E_T_ as Deletado FROM " + RetSqlName('SB1')
  
  TCQUERY cQuery ALIAS (cAlias) NEW
Return cAlias

Static Function EstPla()
  //Colocando estilização no titulo
  oExcel:SetTitleFont('Arial')
  oExcel:SetTitleSizeFont(14)
  oExcel:SetTitleBold(.T.)
  oExcel:SetTitleBgColor('#004ba1')
  oExcel:SetTitleFrColor('#fff')

  //CColocando Estilização no Header
  oExcel:SetHeaderFont('Arial')
  oExcel:SetHeaderSizefont(14)
  oExcel:SetHeaderBold(.T.)
  oExcel:SetBgColorHeader('#012d5f')
  oExcel:SetFrColorHeader('#fff')

  //Colocando estilização na linha 1
  oExcel:SetLineFont('Arial')
  oExcel:SetLineSizeFont(12)
  oExcel:SetLineBgColor('#b0cdee')
  oExcel:SetLineFrColor('#012d5f')

  //Colocando estilização na linha 2
  oExcel:Set2LineFont('Arial')
  oExcel:Set2LineSizeFont(12)
  oExcel:Set2LineBgColor('#b0cdee')
  oExcel:Set2LineFrColor('#012d5f')

  //Colocando estilização especifica
  oExcel:SetCelFont('Arial')
  oExcel:SetCelSizeFont(12)
  oExcel:SetCelBgColor('#b0cdee')
  oExcel:SetCelFrColor('#ff0000')
Return 
