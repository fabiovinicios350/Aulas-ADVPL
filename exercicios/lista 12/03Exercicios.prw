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

/*/{Protheus.doc} User Function PlanCursos
  Função para montar uma planilha de cadastro de produtos
  @type  Function
  @author Fabio
  @since 20/04/2023
/*/
User Function PlanCursos()
  Local aArea   := GetArea()
  Local cAlias  := GeraQuery()
  Local cPath           := 'C:\Users\User\Desktop\'
  Local cArq            := 'Cursos.xls'
  Local cWorkSheet      := 'Cursos'
  Local cTable          := 'Dados dos Alunos'
  Local cCursoAnt       := '0'
  Local oExc
  Private oExcel        := FwMsExcelEx():New()

  //Aplicar estilização 
  EstPla()

  //Ler retorno da query
  while (cAlias)->(!EOF())

    if cCursoAnt<>(cAlias)->(ZZC_CODIGO)

      cWorkSheet := Alltrim((cAlias)->(ZZC_NOME))
      
      //Adicionado Aba
      oExcel:AddWorkSheet(cWorkSheet)

      //Adicionado tabela
      oExcel:AddTable(cWorkSheet, cTable)

      //Adicionar colunas
      oExcel:AddColumn(cWorkSheet, cTable, 'Codigo',        CENTER,      GERAL)
      oExcel:AddColumn(cWorkSheet, cTable, 'Nomes',         LEFT,        GERAL)
      oExcel:AddColumn(cWorkSheet, cTable, 'Idade',         CENTER,      NUMERICO)
      cCursoAnt := Alltrim((cAlias)->(ZZC_CODIGO))
    endif

    oExcel:AddRow(cWorkSheet, cTable, {Alltrim((cAlias)->(ZZB_COD)),Alltrim((cAlias)->(ZZB_NOME)),(cAlias)->(ZZ1_IDADE)})
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
  
  cQuery := ""+;
  "Select ZZB.ZZB_COD, ZZB.ZZB_NOME, ZZ1.ZZ1_IDADE, ZZC.ZZC_CODIGO, ZZC.ZZC_NOME"+CRLF+;
  "from "+RetSqlName('ZZB')+" ZZB"+CRLF+;
  "JOIN "+RetSqlName('ZZ1')+" ZZ1 ON ZZ1.ZZ1_CODIGO=ZZB.ZZB_COD AND ZZ1.D_E_L_E_T_=' '"+CRLF+;
  "JOIN "+RetSqlName('ZZC')+" ZZC ON ZZC.ZZC_CODIGO=ZZB.ZZB_CURSO AND ZZC.D_E_L_E_T_=' '"+CRLF+;
  "WHERE ZZB.D_E_L_E_T_=' '"+CRLF+;
  "ORDER BY ZZC.ZZC_CODIGO"

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
Return 
