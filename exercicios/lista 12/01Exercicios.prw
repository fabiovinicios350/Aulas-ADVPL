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
  Função para montar uma planilha de fornecedore com Excel
  @type  Function
  @author Fabio
  @since 20/04/2023
  
  /*/
User Function PlanFor()
  Local aArea   := GetArea()
  Local cAlias  := GetNextAlias()
  Local cPath           := 'C:\Users\User\Desktop\'
  Local cArq            := 'Fornecedor.xls'
  Local cWorkSheet      := 'Fornecedores'
  Local cTable          := 'Dados dos fornecedores'
  Local oExcel          := FwMsExcelEx():New()
  Local oExc
  Local cQuery

  PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SA2' MODULO 'COM'
  cQuery  := GeraQuery()
  
  TCQUERY cQuery ALIAS (cAlias) NEW
  //Adicionado Aba
  oExcel:AddWorkSheet(cWorkSheet)

  //Adicionado tabela
  oExcel:AddTable(cWorkSheet, cTable)

  //Adicionar colunas
  oExcel:AddColumn(cWorkSheet, cTable, 'Codigo',        CENTER,      GERAL)
  oExcel:AddColumn(cWorkSheet, cTable, 'Nome',          LEFT,        GERAL)
  oExcel:AddColumn(cWorkSheet, cTable, 'Loja',          CENTER,      NUMERICO)
  oExcel:AddColumn(cWorkSheet, cTable, 'CNPJ',          CENTER,      GERAL)
  oExcel:AddColumn(cWorkSheet, cTable, 'Endereço',      LEFT,        GERAL)
  oExcel:AddColumn(cWorkSheet, cTable, 'Bairro',        LEFT,        GERAL)
  oExcel:AddColumn(cWorkSheet, cTable, 'Cidade',        LEFT,        GERAL)
  oExcel:AddColumn(cWorkSheet, cTable, 'UF',            CENTER,      GERAL)

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

  //Adiciondo as linhas
  while (cAlias)->(!EOF())
    oExcel:AddRow(cWorkSheet, cTable, {(cAlias)->(A2_COD),(cAlias)->(A2_NOME),(cAlias)->(A2_LOJA),(cAlias)->(A2_CGC),(cAlias)->(A2_END),(cAlias)->(A2_BAIRRO),(cAlias)->(A2_MUN), (cAlias)->(A2_EST)})
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
  Local cQuery

  cQuery := "SELECT A2_COD, A2_NOME, A2_LOJA, A2_CGC,A2_END, A2_BAIRRO, A2_MUN, A2_EST FROM " + RetSqlName('SA2') + " WHERE D_E_L_E_T_ = ''"
Return cQuery
