//Biblioteca
#INCLUDE 'TOTVS.CH'
#INCLUDE 'FWMVCDEF.CH'

/*/{Protheus.doc} User Function MVCCNH
  Função para montar a tela de cadastro de CNH
  @type Function
  @author Fabio
  @since 17/03/2023
  @version 1.0
/*/
User Function MVCCNH()
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

  ADD OPTION aRotina TITLE 'Incluir' ACTION 'VIEWDEF.MVCCNH' OPERATION 3 AcCESS 0
  ADD OPTION aRotina TITLE 'Alterar' ACTION 'VIEWDEF.MVCCNH' OPERATION 4 ACCESS 0
  ADD OPTION aRotina TITLE 'Excluir' ACTION 'VIEWDEF.MVCCNH' OPERATION 5 ACCESS 0
Return aRotina

//Função para montar o modelo de dados
Static Function ModelDef()
  
  //Variavel de validação
  Local bModelPos      := {|oModel| ValidModelPos(oModel)}

  //Variaveis de criação do modelo
  Local oModel    := MPFormModel():New('MVCCNHM',,bModelPos)
  Local oStruZZ2  := FWFormStruct(1,'ZZ2')  
  Local aGatilho  := FWStruTrigger('ZZ2_CODVEI', 'ZZ2_NOMEVE', 'ZZV->ZZV_NOME', .T., 'ZZV', 1, 'xFilial("ZZV")+Alltrim(M->ZZ2_CODVEI)')

  //Aplicando gatilho na estrutura
  oStruZZ2:AddTrigger(aGatilho[1], aGatilho[2], aGatilho[3], aGatilho[4])

  //Aplicando um valor sequencial para o Codigo da CNH
  oStruZZ2:SetProperty('ZZ2_COD', MODEL_FIELD_INIT, FwBuildFeature(STRUCT_FEATURE_INIPAD,  'GetSXENum("ZZ2", "ZZ2_COD")'))
  
  oModel:ADDFields('ZZ2MASTER',/*/PAI/*/,oStruZZ2)
  oModel:SetDescription('Modelo de dados de CNH')
  oModel:GetModel('ZZ2MASTER'):SetDescription('Formulario de CNH')
  oModel:SetPrimaryKey({'ZZ2_COD'})
Return oModel

//Função para monstar a view 
Static Function ViewDef()
  Local oModel    := FwLoadModel('MVCCNH')
  Local oStruZZ2  := FwFormStruct(2, 'ZZ2')
  Local oView     := FwFormView():New()
  
  oView:SetModel(oModel)
  oView:AddField('VIEW_ZZ2', oStruZZ2, 'ZZ2MASTER')
  oView:CreateHorizontalBox('TELA',100)
  oView:SetOwnerView('VIEW_ZZ2','TELA')
Return oView

//Função para fazer a validação apos clicar na opoção de confirmação
Static function ValidModelPos(oModel)
  Local nOper       := oModel:Getoperation()
  Local cConteudo   := oModel:GetValue('ZZ2MASTER','ZZ2_SIGLA')
  Local lTudoOK     := .T.
  
  if nOper = 3 .or. nOper = 4 //Operação de inclusão e alteração
    if(len(alltrim(cConteudo))==2)
      Help(,,'Sigla Incoreta!',,'Sigla precisa conter 1 ou 3 caracteres', 1, 0,,,,,,{'Por favor colocar uma sigla valida'})
      lTudoOK := .F.
    else
      lTudoOK := .T.
    endif
  endif
Return lTudoOK
