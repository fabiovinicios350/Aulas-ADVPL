//Biblioteca
#INCLUDE 'TOTVS.CH'
#INCLUDE 'FWMVCDEF.CH'

/*/{Protheus.doc} User Function MYMVC_4
  Função para criar a tela de cadastro
  @type Function
  @author Fabio
  @since 17/03/2023
  @version 1.0
/*/
User Function MYMVC_4()
  Local cTitle    := 'Atualização de Produto'
  Local cAlias    := 'SB1'
  Local oBrowse   := FwMBrowse():New()

  oBrowse:SetAlias(cAlias)
  oBrowse:SetDescription(cTitle)
  oBrowse:Activate()
Return

Static Function MenuDef()
  Local aRotina   := {}

  ADD OPTION aRotina TITLE 'Incluir'          ACTION 'VIEWDEF.MYMVC_4' OPERATION 3 ACCESS 0
  ADD OPTION aRotina TITLE 'Alterar'          ACTION 'VIEWDEF.MYMVC_4' OPERATION 4 ACCESS 0
  ADD OPTION aRotina TITLE 'Visualizar'       ACTION 'VIEWDEF.MYMVC_4' OPERATION 2 ACCESS 0
  ADD OPTION aRotina TITLE 'Pesquisar'        ACTION 'VIEWDEF.MYMVC_4' OPERATION 1 ACCESS 0
  ADD OPTION aRotina TITLE 'Excluir'          ACTION 'VIEWDEF.MYMVC_4' OPERATION 5 ACCESS 0
  ADD OPTION aRotina TITLE 'Copiar'           ACTION 'VIEWDEF.MYMVC_4' OPERATION 7 ACCESS 0
  ADD OPTION aRotina TITLE 'Imprimir Browse'  ACTION 'VIEWDEF.MYMVC_4' OPERATION 6 ACCESS 0
Return aRotina

Static Function ModelDef()
  Local oModel    := MPFormModel():New('MYMVC_4M')
  Local oStruSB1  := FWFormStruct(1,'SB1')
  Local oStruSB5  := FWFormStruct(1,'SB5')
  Local oStruSBZ  := FWFormStruct(1,'SBZ')
  Local oStruSGI  := FWFormStruct(1,'SGI')

  oModel:AddFields('SB1MASTER',/*/ PAI /*/, oStruSB1)
  oModel:AddFields('SB5DETAIL','SB1MASTER', oStruSB5)
  oModel:AddGrid('SBZDETAIL','SB1MASTER', oStruSBZ)
  oModel:AddGrid('SGIDETAIL','SB1MASTER', oStruSGI)

  oModel:SetDescription('Atualizar Produtos')

  oModel:SetPrimaryKey({'B1_COD','B5_COD','BZ_COD','GI_COD'})
Return oModel

Static Function ViewDef()
  Local oModel      := FWLoadModel('MYMVC_4')
  Local oStruSB1    := FWFormStruct(2, 'SB1') 
  Local oStruSB5    := FWFormStruct(2, 'SB5') 
  Local oStruSBZ    := FWFormStruct(2, 'SBZ') 
  Local oStruSGI    := FWFormStruct(2, 'SGI') 
  Local oView       := FWFormView():New()

  oView:SetModel(oModel)
  oView:AddField('VIEW_SB1',oStruSB1, 'SB1MASTER')
  oView:AddField('VIEW_SB5',oStruSB5, 'SB5DETAIL')
  oView:AddGrid('VIEW_SBZ',oStruSBZ, 'SBZDETAIL')
  oView:AddGrid('VIEW_SGI',oStruSGI, 'SGIDETAIL')

  oView:CreateHorizontalBox('Geral',100)
  oView:CreateHorizontalBox('Produto',800,,.T.)
  oView:CreateHorizontalBox('Dados',300,,.T.)
  oView:CreateHorizontalBox('Indicadores',300,,.T.)
  oView:CreateHorizontalBox('Alternativo',300,,.T.)

  oView:SetOwnerView('SB1MASTER','Geral')
  oView:SetOwnerView('VIEW_SB1','Produto')
  oView:SetOwnerView('VIEW_SB5','Dados')
  oView:SetOwnerView('VIEW_SBZ','Indicadores')
  oView:SetOwnerView('VIEW_SGI','Alternativo')

  oView:EnableTitleView('VIEW_SB1','Descrição Generica do produto')
  oView:EnableTitleView('VIEW_SB5','Dados adicionais do produto')
  oView:EnableTitleView('VIEW_SBZ','Indicadores de Produtos')
  oView:EnableTitleView('VIEW_SGI','Produtos Alternativos')

Return oView
