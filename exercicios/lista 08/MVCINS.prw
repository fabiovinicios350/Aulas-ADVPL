//Biblioteca
#INCLUDE 'TOTVS.CH'
#INCLUDE 'FWMVCDEF.CH'

/*/{Protheus.doc} User Function MVCINS
  Função MVC para cadastro os Instrutores
  @type Function
  @author Fabio
  @since 27/03/2023
  @version 1.0
/*/

User Function MVCINS()
  Local cAlias    :=  'ZZI'
  Local cTitle    :=  'Cadastro de Instrutor'
  Local oMark := FwMarkBrowse():New()

  oMark:SetAlias(cAlias)
  oMark:SetDescription(cTitle)

  oMark:SetFieldMark('ZZI_MARC')

  oMark:AddButton('Exc. Marcados','U_ExcMarcados',5, 1)

  oMark:DisableDetails() 
  oMark:DisableReport()
  oMark:Activate()
Return

/*/{Protheus.doc} MenuDef
  Função para adicionar o menu
  @type  Static_Function
  @author Fabio 
  @since 27/03/2023
  @version 1.0
/*/
Static Function MenuDef()
  Local aRotina := {}

  ADD OPTION aRotina TITLE 'Incluir'        ACTION 'VIEWDEF.MVCINS' OPERATION 3 AcCESS 0
  ADD OPTION aRotina TITLE 'Alterar'        ACTION 'VIEWDEF.MVCINS' OPERATION 4 ACCESS 0
  ADD OPTION aRotina TITLE 'Excluir'        ACTION 'VIEWDEF.MVCINS' OPERATION 5 ACCESS 0
Return aRotina

/*/{Protheus.doc} ModelDef
  Função para definir o modelo de dados
  @type  Static_Function
  @author Fabio 
  @since 27/03/2023
  @version 1.0
/*/
Static Function ModelDef()
  Local bModelPos := {|oModel| ValidModelPos()}

  Local oModel    := MPFormModel():New('MVCINSM')
  Local oStruZZI  := FWFormStruct(1,'ZZI')  

  oModel:ADDFields('ZZIMASTER',/*/PAI/*/,oStruZZI)
  oModel:SetDescription('Modelo de dados do Instrutor')
  oModel:GetModel('ZZIMASTER'):SetDescription('Formulario de instrutor')
  oModel:SetPrimaryKey({'ZZI_COD'})
Return oModel


/*/{Protheus.doc} ViewDef
  Função para criar a view
  @type  Static_Function
  @author Fabio 
  @since 27/03/2023
  @version 1.0
/*/

Static Function ViewDef()
  Local oModel    := FwLoadModel('MVCINS')
  Local oStruZZI  := FwFormStruct(2, 'ZZI')
  Local oView     := FwFormView():New()

  oView:SetModel(oModel)
  oView:AddField('VIEW_ZZI', oStruZZI, 'ZZIMASTER')
  oView:CreateHorizontalBox('TELA',100)
  oView:SetOwnerView('VIEW_ZZI','TELA')
Return oView

User Function ExcMarcados()

Return

Static Function ValidModelPos(oModel)
  
Return 
