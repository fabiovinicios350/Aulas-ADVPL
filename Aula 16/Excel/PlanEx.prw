#INCLUDE 'TOTVS.CH'

// Alinhamento
#DEFINE LEFT    1
#DEFINE CENTER  2
#DEFINE RIGHT   3

// Formatação
#DEFINE GERAL     1
#DEFINE NUMERICO  2
#DEFINE MONETARIO 3
#DEFINE DATETIME  4


/*/{Protheus.doc} User Function PlanEx
  (long_description)
  @type  Function
  @author Fabio
  @since 19/04/2023
  /*/
User Function PlanEx()
  Local cPath       := 'C:\Users\User\Desktop\'
  Local cArq        := 'Teste_Excel.xls'
  Local cWorkSheet  := 'Pessoas'
  Local cTable      := 'Dados Pessoais'
  Local oExcel     :=  FwMsExcelEx():New()
  Local oExc

  oExcel:AddWorkSheet(cWorkSheet)

  oExcel:AddTable(cWorkSheet, cTable)

  oExcel:AddColumn(cWorkSheet, cTable, 'Nome',        LEFT,   GERAL)
  oExcel:AddColumn(cWorkSheet, cTable, 'Sobrenome',   LEFT,   GERAL)
  oExcel:AddColumn(cWorkSheet, cTable, 'Data Nasc.',  CENTER, DATETIME)
  oExcel:AddColumn(cWorkSheet, cTable, 'E-mail',      LEFT,   GERAL)
  oExcel:AddColumn(cWorkSheet, cTable, 'WhatsApp',    CENTER, GERAL)
  oExcel:AddColumn(cWorkSheet, cTable, 'Salário',     CENTER, MONETARIO)

  oExcel:SetLineFont('Times New Roman')
  oExcel:SetLineSizeFont(12)
  oExcel:SetLineBgColor('#00FFA4')
  oExcel:SetLineFrColor('#000000')

  oExcel:Set2LineFont('Times New Roman')
  oExcel:Set2LineSizeFont(12)
  oExcel:Set2LineBgColor('#00FFA4')
  oExcel:Set2LineFrColor('#FF0000')

  oExcel:AddRow(cWorkSheet, cTable, {'Fabio','Vinicios',SToD('19981218'),'fabio@gmail.com','(11) 96060-2586',2300.00})
  oExcel:AddRow(cWorkSheet, cTable, {'Natan','Oliveira',SToD('19980801'),'natan@gmail.com','(11) 94343-8283',2500.00})
  oExcel:AddRow(cWorkSheet, cTable, {'Gabi','Oliveira', SToD('20100430'),'fabio@gmail.com','(11) 94342-2824',2000.00})

  oExcel:SetTitleFont('Roboto Cn')
  oExcel:SetTitleSizeFont(14)
  oExcel:SetTitleBold(.T.)
  oExcel:SetTitleBgColor('#FFFF00')
  oExcel:SetTitleFrColor('#0000FF')

  oExcel:SetHeaderFont('Arial')
  oExcel:SetHeaderSizefont(14)
  oExcel:SetHeaderBold(.T.)
  oExcel:SetBgColorHeader('#550099')
  oExcel:SetFrColorHeader('#fff')


  oExcel:Activate()

  oExcel:GetXMLFile(cPath+cArq)

  if ApOleClient('MsExcel')
    oExc := MsExcel():New()
    oExc:WorkBooks:Open(cPath+cArq)
    oExc:SetVisible(.T.)
    oExc:Destroy()
  else
    FwAlertError("Excel não encontrado no Windows","Excel não encontrado!")
  endif
  
  FwAlertSuccess("Arquivo gerado com sucesso","Conluido")

  oExcel:DeActivate()
Return 
