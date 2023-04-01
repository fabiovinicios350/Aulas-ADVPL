//Biblioteca
#INCLUDE 'TOTVS.CH'
#INCLUDE 'FWMVCDEF.CH'

/*/{Protheus.doc} User Function MVCBLO
  Função para mostra a tela de visualização da CNH
  @type Function
  @author Fabio
  @since 17/03/2023
  @version 1.0
/*/
User Function MVCBLO()
  Local cAlias    :=  'ZZ4'
  Local cTitle    :=  'Cadastro de Bloco'
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

  ADD OPTION aRotina TITLE 'Incluir'    ACTION 'VIEWDEF.MVCBLO' OPERATION 3 AcCESS 0
  ADD OPTION aRotina TITLE 'Alterar'    ACTION 'VIEWDEF.MVCBLO' OPERATION 4 AcCESS 0
  ADD OPTION aRotina TITLE 'Deletar'    ACTION 'VIEWDEF.MVCBLO' OPERATION 5 AcCESS 0
Return aRotina

//Função para montar o modelo de dados
Static Function ModelDef()
  
  //Variaveis de criação do modelo
  Local oModel    := MPFormModel():New('MVCBLOM')
  Local oStruZZ4  := FWFormStruct(1,'ZZ4')  
  Local oStruZZ5  := FWFormStruct(1,'ZZ5')  

   //Criando os conteiner
  oModel:ADDFields('ZZ4MASTER',/*/PAI/*/,oStruZZ4)
  oModel:ADDGrid('ZZ5DETAIL','ZZ4MASTER',oStruZZ5)

   //Definidno um titulo para os conteiner
  oModel:SetDescription('Modelo de dados de Bloco')
  oModel:GetModel('ZZ4MASTER'):SetDescription('Formulario do Bloco')
  oModel:GetModel('ZZ5DETAIL'):SetDescription('Grid de Apartamentos')

   //Colocando um relacionamento entre os conteiner
  oModel:SetRelation('ZZ5DETAIL',{{'ZZ5_FILIAL','xFilial("ZZ5")'},{'ZZ5_CODBL','ZZ4_COD'}}, ZZ5->(IndexKey(1)))

  oModel:SetPrimaryKey({'ZZ4_COD'})
Return oModel

//Função para monstar a view 
Static Function ViewDef()
  Local oModel    := FwLoadModel('MVCBLO')
  Local oStruZZ4  := FWFormStruct(2,'ZZ4')  
  Local oStruZZ5  := FWFormStruct(2,'ZZ5')  
  Local oView     := FwFormView():New()
  
  oView:SetModel(oModel)

  //Criação dos conteiner
  oView:AddField('VIEW_ZZ4', oStruZZ4, 'ZZ4MASTER')
  oView:ADDGrid('VIEW_ZZ5', oStruZZ5, 'ZZ5DETAIL')

   //Definindo tamanho do conteiner
  oView:CreateHorizontalBox('BLOCO',30)
  oView:CreateHorizontalBox('APARTAMENTO',70)

   //Aplicando os tamanhos aos conteiner
  oView:SetOwnerView('VIEW_ZZ4','BLOCO')
  oView:SetOwnerView('VIEW_ZZ5','APARTAMENTO')
Return oView
