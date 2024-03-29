//Biblioteca
#INCLUDE 'TOTVS.CH'
#INCLUDE 'FWMVCDEF.CH'

/*/{Protheus.doc} User Function MVCVEI
  Fun��o MVC para cadastro de veiculos
  @type Function
  @author Fabio
  @since 27/03/2023
  @version 1.0
/*/
User Function MVCVEI()
  Local cAlias    :=  'ZZV'
  Local cTitle    :=  'Cadastro de Veiculos'
  Local oBrowse := FWMBrowse():New()

  oBrowse:SetAlias(cAlias)
  oBrowse:SetDescription(cTitle)
  oBrowse:DisableDetails() 
  oBrowse:DisableReport()
  oBrowse:Activate()
Return

//Fun��o para colocar as op��es da tela
Static Function MenuDef()
  Local aRotina := {}

  ADD OPTION aRotina TITLE 'Incluir' ACTION 'VIEWDEF.MVCVEI' OPERATION 3 AcCESS 0
  ADD OPTION aRotina TITLE 'Alterar' ACTION 'VIEWDEF.MVCVEI' OPERATION 4 ACCESS 0
  ADD OPTION aRotina TITLE 'Excluir' ACTION 'VIEWDEF.MVCVEI' OPERATION 5 ACCESS 0
Return aRotina

//Fun��o para montar o modelo de dados
Static Function ModelDef()
  Local oModel    := MPFormModel():New('MVCVEIM')
  Local oStruZZV  := FWFormStruct(1,'ZZV')  

  oModel:ADDFields('ZZVMASTER',/*/PAI/*/,oStruZZV)
  oModel:SetDescription('Modelo de dados do veiculo')
  oModel:GetModel('ZZVMASTER'):SetDescription('Formulario de Veiculo')
  oModel:SetPrimaryKey({'ZZV_COD'})
Return oModel

//Fun��o para monstar a view 
Static Function ViewDef()
  Local oModel    := FwLoadModel('MVCVEI')
  Local oStruZZV  := FwFormStruct(2, 'ZZV')
  Local oView     := FwFormView():New()

  oView:SetModel(oModel)
  oView:AddField('VIEW_ZZV', oStruZZV, 'ZZVMASTER')
  oView:CreateHorizontalBox('TELA',100)
  oView:SetOwnerView('VIEW_ZZV','TELA')
Return oView
