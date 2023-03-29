//Biblioteca
#INCLUDE 'TOTVS.CH'
#INCLUDE 'FWMVCDEF.CH'

/*/{Protheus.doc} User Function MVCVIU
  Função para mostra a tela de visualização da CNH
  @type Function
  @author Fabio
  @since 17/03/2023
  @version 1.0
/*/
User Function MVCVIU()
  Local cAlias    :=  'ZZ2'
  Local cTitle    :=  'Cadastro de CNH'
  Local oBrowse := FWMBrowse():New()

  oBrowse:SetAlias(cAlias)
  oBrowse:SetDescription(cTitle)
  oBrowse:DisableDetails() 
  oBrowse:DisableReport()
  oBrowse:Activate()
Return

//Função para colocar as opções da tela
Static Function MenuDef()
  Local aRotina := {}

  ADD OPTION aRotina TITLE 'Visualizar' ACTION 'VIEWDEF.MVCVIU' OPERATION 2 AcCESS 0
Return aRotina

//Função para montar o modelo de dados
Static Function ModelDef()
  
  //Variaveis de criação do modelo
  Local oModel    := MPFormModel():New('MVCVIUM')
  Local oStruZZ2  := FWFormStruct(1,'ZZ2')  
  Local oStruZZI  := FWFormStruct(1,'ZZI')  
  Local oStruZZ3  := FWFormStruct(1,'ZZ3')  

   //Criando os conteiner
  oModel:ADDFields('ZZ2MASTER',/*/PAI/*/,oStruZZ2)
  oModel:ADDGrid('ZZIDETAIL','ZZ2MASTER',oStruZZI)
  oModel:ADDGrid('ZZ3DETAIL','ZZIDETAIL',oStruZZ3)

   //Definidno um titulo para os conteiner
  oModel:SetDescription('Modelo de dados de CNH')
  oModel:GetModel('ZZ2MASTER'):SetDescription('Formulario de CNH')
  oModel:GetModel('ZZIDETAIL'):SetDescription('Formulario de Instrutores')
  oModel:GetModel('ZZ3DETAIL'):SetDescription('Formulario de ')

   //Colocando um relacionamento entre os conteiner
  oModel:SetRelation('ZZIDETAIL',{{'ZZI_FILIAL','xFilial("ZZI")'},{'ZZI_CATEG','ZZ2_COD'}}, ZZI->(IndexKey(1)))
  oModel:SetRelation('ZZ3DETAIL',{{'ZZ3_FILIAL','xFilial("ZZ3")'},{'ZZ3_CODINS','ZZI_COD'}}, ZZ3->(IndexKey(1)))

  oModel:SetPrimaryKey({'ZZ2_COD','ZZI_COD','ZZ3_COD'})
Return oModel

//Função para monstar a view 
Static Function ViewDef()
  Local oModel    := FwLoadModel('MVCVIU')
  Local oStruZZ2  := FWFormStruct(2,'ZZ2')  
  Local oStruZZI  := FWFormStruct(2,'ZZI')  
  Local oStruZZ3  := FWFormStruct(2,'ZZ3') 
  Local oView     := FwFormView():New()
  
  oView:SetModel(oModel)

  //Criação dos conteiner
  oView:AddField('VIEW_ZZ2', oStruZZ2, 'ZZ2MASTER')
  oView:ADDGrid('VIEW_ZZI', oStruZZI, 'ZZIDETAIL')
  oView:ADDGrid('VIEW_ZZ3', oStruZZ3, 'ZZ3DETAIL')

   //Definindo tamanho do conteiner
  oView:CreateHorizontalBox('CNH',40)
  oView:CreateHorizontalBox('INSTRUTOR',30)
  oView:CreateHorizontalBox('Aula',30)

   //Aplicando os tamanhos aos conteiner
  oView:SetOwnerView('VIEW_ZZ2','CNH')
  oView:SetOwnerView('VIEW_ZZI','INSTRUTOR')
  oView:SetOwnerView('VIEW_ZZ3','Aula')
Return oView
