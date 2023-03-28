//Biblioteca
#INCLUDE 'TOTVS.CH'
#INCLUDE 'FWMVCDEF.CH'

/*/{Protheus.doc} User Function MVCALU
  Função MVC para cadastro os Instrutores
  @type Function
  @author Fabio
  @since 27/03/2023
  @version 1.0
/*/

User Function MVCALU()
  Local cAlias    :=  'ZZ3'
  Local cTitle    :=  'Cadastro de Alunos'
  Local oMark := FwMarkBrowse():New()

  oMark:SetAlias(cAlias)
  oMark:SetDescription(cTitle)

  oMark:SetFieldMark('ZZ3_MARC')

  oMark:AddButton('Exc. Marcados','U_ExcAlunosMarc',5, 1)

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

  ADD OPTION aRotina TITLE 'Incluir'        ACTION 'VIEWDEF.MVCALU' OPERATION 3 AcCESS 0
  ADD OPTION aRotina TITLE 'Alterar'        ACTION 'VIEWDEF.MVCALU' OPERATION 4 ACCESS 0
  ADD OPTION aRotina TITLE 'Excluir'        ACTION 'VIEWDEF.MVCALU' OPERATION 5 ACCESS 0
Return aRotina

/*/{Protheus.doc} ModelDef
  Função para definir o modelo de dados
  @type  Static_Function
  @author Fabio 
  @since 27/03/2023
  @version 1.0
/*/
Static Function ModelDef()
  Local oModel    := MPFormModel():New('MVCALUM')
  Local oStruZZ3  := FWFormStruct(1,'ZZ3')  

  oStruZZ3:SetProperty('ZZ3_COD', MODEL_FIELD_INIT, FwBuildFeature(STRUCT_FEATURE_INIPAD,  'GetSXENum("ZZ3", "ZZ3_COD")'))

  oModel:ADDFields('ZZ3MASTER',/*/PAI/*/,oStruZZ3)
  oModel:SetDescription('Modelo de dados do Alunos')
  oModel:GetModel('ZZ3MASTER'):SetDescription('Formulario de Alunos')
  oModel:SetPrimaryKey({'ZZ3_COD'})
Return oModel


/*/{Protheus.doc} ViewDef
  Função para criar a view
  @type  Static_Function
  @author Fabio 
  @since 27/03/2023
  @version 1.0
/*/
Static Function ViewDef()
  Local oModel    := FwLoadModel('MVCALU')
  Local oStruZZ3  := FwFormStruct(2, 'ZZ3')
  Local oView     := FwFormView():New()

  oView:SetModel(oModel)
  oView:AddField('VIEW_ZZ3', oStruZZ3, 'ZZ3MASTER')
  oView:CreateHorizontalBox('TELA',100)
  oView:SetOwnerView('VIEW_ZZ3','TELA')
Return oView

User Function ExcAlunosMarc()

Return
