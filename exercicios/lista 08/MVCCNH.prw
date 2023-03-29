//Biblioteca
#INCLUDE 'TOTVS.CH'
#INCLUDE 'FWMVCDEF.CH'

/*/{Protheus.doc} User Function MVCCNH
  Exemplo de uso da clase FWMBrowse
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

/*/{Protheus.doc} MenuDef
  Função para adicionar o menu
  @type  Static_Function
  @author Fabio 
  @since 17/03/2023
  @version 1.0
/*/
Static Function MenuDef()
  Local aRotina := {}

  ADD OPTION aRotina TITLE 'Incluir' ACTION 'VIEWDEF.MVCCNH' OPERATION 3 AcCESS 0
  ADD OPTION aRotina TITLE 'Alterar' ACTION 'VIEWDEF.MVCCNH' OPERATION 4 ACCESS 0
  ADD OPTION aRotina TITLE 'Excluir' ACTION 'VIEWDEF.MVCCNH' OPERATION 5 ACCESS 0
Return aRotina



/*/{Protheus.doc} ModelDef
  Função para definir o modelo de dados
  @type  Static_Function
  @author Fabio 
  @since 17/03/2023
  @version 1.0
/*/
Static Function ModelDef()
  
  //Variavel de validação
  Local bModelPos      := {|oModel| ValidModelPos(oModel)}

  //Variaveis de criação do modelo
  Local oModel    := MPFormModel():New('MVCCNHM',,bModelPos)
  Local oStruZZ2  := FWFormStruct(1,'ZZ2')  
  Local aGatilho  := FWStruTrigger('ZZ2_CODVEI', 'ZZ2_NOMEVE', 'ZZV->ZZV_NOME', .T., 'ZZV', 1, 'xFilial("ZZV")+Alltrim(M->ZZ2_CODVEI)')

  //Aplicando gatilho na estrutura
  oStruZZ2:AddTrigger(aGatilho[1], aGatilho[2], aGatilho[3], aGatilho[4])
  oStruZZ2:SetProperty('ZZ2_COD', MODEL_FIELD_INIT, FwBuildFeature(STRUCT_FEATURE_INIPAD,  'GetSXENum("ZZ2", "ZZ2_COD")'))
  
  oModel:ADDFields('ZZ2MASTER',/*/PAI/*/,oStruZZ2)
  oModel:SetDescription('Modelo de dados de CNH')
  oModel:GetModel('ZZ2MASTER'):SetDescription('Formulario de CNH')
  oModel:SetPrimaryKey({'ZZ2_COD'})
Return oModel


/*/{Protheus.doc} ViewDef
  Função para criar a view
  @type  Static_Function
  @author Fabio 
  @since 17/03/2023
  @version 1.0
/*/
Static Function ViewDef()
  Local oModel    := FwLoadModel('MVCCNH')
  Local oStruZZ2  := FwFormStruct(2, 'ZZ2')
  Local oView     := FwFormView():New()
  
  oView:SetModel(oModel)
  oView:AddField('VIEW_ZZ2', oStruZZ2, 'ZZ2MASTER')
  oView:CreateHorizontalBox('TELA',100)
  oView:SetOwnerView('VIEW_ZZ2','TELA')
Return oView

Static function ValidModelPos(oModel)
  Local nOper       := oModel:Getoperation()
  Local cConteudo   := oModel:GetValue('ZZ2MASTER','ZZ2_SIGLA')
  Local lTudoOK     := .T.
  
  if nOper = 3 .or. nOper = 4
    if(len(alltrim(cConteudo))==2)
      Help(,,'Sigla Incoreta!',,'Sigla precisa conter 1 ou 3 caracteres', 1, 0,,,,,,{'Por favor colocar uma sigla valida'})
      lTudoOK := .F.
    else
      lTudoOK := .T.
    endif
  endif
Return lTudoOK
