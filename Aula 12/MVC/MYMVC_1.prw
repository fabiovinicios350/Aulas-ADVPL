//Biblioteca
#INCLUDE 'TOTVS.CH'
#INCLUDE 'FWMVCDEF.CH'

/*/{Protheus.doc} User Function MYMVC_1
  Fun��o para montar a tela de cadastro de 
  @type Function
  @author Fabio
  @since 17/03/2023
  @version 1.0
/*/
User Function MYMVC_1()
  Local cAlias    :=  'ZZC'
  Local cTitle    :=  'Cadastro de cursos'
  Local oBrowse := FWMBrowse():New()
  

  oBrowse:SetAlias(cAlias)
  oBrowse:SetDescription(cTitle)
  oBrowse:DisableDetails() 
  oBrowse:Activate()
Return

Static Function MenuDef()
  Local aRotina := {}

  ADD OPTION aRotina TITLE 'Incluir' ACTION 'VIEWDEF.MYMVC_1' OPERATION 3 AcCESS 0
  ADD OPTION aRotina TITLE 'Alterar' ACTION 'VIEWDEF.MYMVC_1' OPERATION 4 ACCESS 0
  ADD OPTION aRotina TITLE 'Excluir' ACTION 'VIEWDEF.MYMVC_1' OPERATION 4 ACCESS 0
Return aRotina

Static Function ModelDef()
  Local oModel    := MPFormModel():New('MYMVCM')
  Local oStruZZC  := FWFormStruct(1,'ZZC')  
  
  oModel:ADDFields('ZZCMASTER',/*/PAI/*/,oStruZZC)
  oModel:SetDescription('Modelo de dados de Cursos')
  oModel:GetModel('ZZCMASTER'):SetDescription('Formulario de cursos')
  oModel:SetPrimaryKey({'ZZC_COD'})
Return oModel

Static Function ViewDef()
  Local oModel    := FwLoadModel('MYMVC_1')
  Local oStruZZC  := FwFormStruct(2, 'ZZC')
  Local oView     := FwFormView():New()

  oView:SetModel(oModel)
  oView:AddField('VIEW_ZZC', oStruZZC, 'ZZCMASTER')
  oView:CreateHorizontalBox('TELA',100)
  oView:SetOwnerView('VIEW_ZZC','TELA')
Return oView
