//Biblioteca
#INCLUDE 'TOTVS.CH'
#INCLUDE 'FWMVCDEF.CH'

/*/{Protheus.doc} User Function MVCTAR
  Função para mostra a tela de visualização da CNH
  @type Function
  @author Fabio
  @since 17/03/2023
  @version 1.0
/*/
User Function MVCTAR()
  Local cAlias    :=  'ZZT'
  Local cTitle    :=  'Cadastro de tarefa'
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

  ADD OPTION aRotina TITLE 'Incluir'    ACTION 'VIEWDEF.MVCTAR' OPERATION 3 AcCESS 0
  ADD OPTION aRotina TITLE 'Alterar'    ACTION 'VIEWDEF.MVCTAR' OPERATION 4 AcCESS 0
  ADD OPTION aRotina TITLE 'Deletar'    ACTION 'VIEWDEF.MVCTAR' OPERATION 5 AcCESS 0
Return aRotina

//Função para montar o modelo de dados
Static Function ModelDef()

  //Variaveis de criação do modelo
  Local oModel    := MPFormModel():New('MVCTARM')
  Local oStruZZT  := FWFormStruct(1,'ZZT')  
  Local oStruZZ6  := FWFormStruct(1,'ZZ6')  

  //Bloco de codigo para validação
  Local bAfazerPre     := {|oGrid, nLine, cAction, cFieldId| ValidGridPre(oGrid, nLine, cAction, cFieldId,oModel,1)}
  Local bAndamentoPre  := {|oGrid, nLine, cAction, cFieldId| ValidGridPre(oGrid, nLine, cAction, cFieldId,oModel,2)}
  Local bConcluidoPre  := {|oGrid, nLine, cAction, cFieldId| ValidGridPre(oGrid, nLine, cAction, cFieldId,oModel,3)}
  
  //Criando os conteiner
  oModel:ADDFields('ZZTMASTER',/*/PAI/*/,oStruZZT)
  oModel:ADDGrid('ZZ6AFAZER','ZZTMASTER',oStruZZ6,/*/bAfazerPre/*/)
  oModel:ADDGrid('ZZ6EMANDAMENTO','ZZTMASTER',oStruZZ6,/*/bAndamentoPre/*/)
  oModel:ADDGrid('ZZ6CONCLUIDO','ZZTMASTER',oStruZZ6,/*/bConcluidoPre/*/)

  //Definidno um titulo para os conteiner
  oModel:SetDescription('Modelo de dados da tarefa')
  oModel:GetModel('ZZTMASTER'):SetDescription('Formulario do Tarefa')
  oModel:GetModel('ZZ6AFAZER'):SetDescription('Grid de A FAZER')
  oModel:GetModel('ZZ6EMANDAMENTO'):SetDescription('Grid de EM ANDAMENTO')
  oModel:GetModel('ZZ6CONCLUIDO'):SetDescription('Grid de CONCLUIDO')

  //Colocando o filtro no conteiner
  oModel:GetModel('ZZ6AFAZER'):SetLoadFilter({{'ZZ6_EMAND', '"F"'},{ 'ZZ6_CONCLU', '"F"' }})
  oModel:GetModel('ZZ6EMANDAMENTO'):SetLoadFilter({{'ZZ6_EMAND', '"T"'},{ 'ZZ6_CONCLU', '"F"' }})
  oModel:GetModel('ZZ6CONCLUIDO'):SetLoadFilter({{'ZZ6_EMAND', '"F"'},{ 'ZZ6_CONCLU', '"T"' }})

  //Tirando a obrigatoriedade do grid
  oModel:GetModel('ZZ6AFAZER'):SetOptional(.T.)
  oModel:GetModel('ZZ6EMANDAMENTO'):SetOptional(.T.)
  oModel:GetModel('ZZ6CONCLUIDO'):SetOptional(.T.)

  //Colocando um relacionamento entre os conteiner
  oModel:SetRelation('ZZ6AFAZER',{{'ZZ6_FILIAL','xFilial("ZZ6")'},{'ZZ6_CODT','ZZT_COD'}}, ZZ6->(IndexKey(1)))
  oModel:SetRelation('ZZ6EMANDAMENTO',{{'ZZ6_FILIAL','xFilial("ZZ6")'},{'ZZ6_CODT','ZZT_COD'}}, ZZ6->(IndexKey(1)))
  oModel:SetRelation('ZZ6CONCLUIDO',{{'ZZ6_FILIAL','xFilial("ZZ6")'},{'ZZ6_CODT','ZZT_COD'}}, ZZ6->(IndexKey(1)))

  oModel:SetPrimaryKey({'ZZT_COD'})
Return oModel

//Função para monstar a view 
Static Function ViewDef()
  Local oModel    := FwLoadModel('MVCTAR')
  Local oStruZZT  := FWFormStruct(2,'ZZT')  
  Local oStruZZ6  := FWFormStruct(2,'ZZ6')  
  Local oView     := FwFormView():New()
  
  oView:SetModel(oModel)

  //Criação dos conteiner
  oView:AddField('VIEW_ZZT', oStruZZT, 'ZZTMASTER')
  oView:ADDGrid('VIEW_AFAZER', oStruZZ6, 'ZZ6AFAZER')
  oView:ADDGrid('VIEW_EMANDAMENTO', oStruZZ6, 'ZZ6EMANDAMENTO')
  oView:ADDGrid('VIEW_CONCLUIDO', oStruZZ6, 'ZZ6CONCLUIDO')

  //Colocando titulos nos conteiner
  oView:EnableTitleView('VIEW_AFAZER','A fazer')
  oView:EnableTitleView('VIEW_EMANDAMENTO','Em andamento')
  oView:EnableTitleView('VIEW_CONCLUIDO','Concluido')

  //Definindo tamanho do conteiner
  oView:CreateHorizontalBox('TAREFAS',30)
  oView:CreateHorizontalBox('ATIVIDADE',70)
  oView:CreateVerticalBox('AFAZER',33,'ATIVIDADE')
  oView:CreateVerticalBox('EMANDAMENTO',33,'ATIVIDADE')
  oView:CreateVerticalBox('CONCLUIDO',33,'ATIVIDADE')

  //Aplicando os tamanhos aos conteiner
  oView:SetOwnerView('VIEW_ZZT','TAREFAS')
  oView:SetOwnerView('VIEW_AFAZER','AFAZER')
  oView:SetOwnerView('VIEW_EMANDAMENTO','EMANDAMENTO')
  oView:SetOwnerView('VIEW_CONCLUIDO','CONCLUIDO')

Return oView

Static Function ValidGridPre(oGrid, nLine, cAction, cFieldId,oModel,nOper)
  Local oModelPad         := FWModelActivate()
  Local oView             := FWViewActive()
  Local cDescr            := alltrim(oGrid:GetValue('ZZ6_DESCR'))
  Local lAndamento        := oGrid:GetValue('ZZ6_EMAND')
  Local lConcluido        := oGrid:GetValue('ZZ6_CONCLU')
  Local oGridAfazer       := oModel:GetModel("ZZ6AFAZER")
  Local oGridAndamento    := oModel:GetModel("ZZ6EMANDAMENTO")
  Local oGridConclui      := oModel:GetModel("ZZ6CONCLUIDO")
  Local nQuant 
  
  if(cAction=='CANSETVALUE' .and. cFieldId=='ZZ6_EMAND')
    oGrid:SetValue("ZZ6_EMAND", !lAndamento)
    oGrid:DeleteLine()
    if(!lAndamento) 
      oGridAndamento:AddLine()
      nQuant := oGridAndamento:Length()
      FwAlertError(nQuant,'')
      oGridAndamento:GoLine(nQuant)
      FwAlertError(oGridAndamento:GetValue('ZZ6_DESCR'),'')
      FwAlertError(oGridAndamento:GetValue('ZZ6_EMAND'),'')
      FwAlertError(oGridAndamento:GetValue('ZZ6_CONCLU'),'')
      oGridAndamento:SetValue("ZZ6_DESCR", cDescr)
      oGridAndamento:SetValue("ZZ6_EMAND", .T.)
      oGridAndamento:SetValue("ZZ6_CONCLU", .F.)
    else
      oGridAfazer:AddLine()
      nQuant := oGridAfazer:Length()
      FwAlertError(nQuant,'')
      oGridAfazer:GoLine(nQuant)
      oGridAfazer:SetValue("ZZ6_DESCR", cDescr)
      oGridAfazer:SetValue("ZZ6_EMAND", .F.)
      oGridAfazer:SetValue("ZZ6_CONCLU", .F.)
    endif 
  elseif (cAction=='CANSETVALUE' .and. cFieldId=='ZZ6_CONCLU')
    oGrid:SetValue("ZZ6_CONCLU", !lConcluido)
    oGrid:DeleteLine()
    if(!lConcluido)
      oGridConclui:AddLine()
      nQuant := oGridConclui:Length()
      FwAlertError(nQuant,'')
      oGridConclui:GoLine(nQuant)
      oGridConclui:SetValue("ZZ6_DESCR", cDescr)
      oGridConclui:SetValue("ZZ6_EMAND", .F.)
      oGridConclui:SetValue("ZZ6_CONCLU", .T.)
    else
      oGridAfazer:AddLine()
      nQuant := oGridAfazer:Length()
      FwAlertError(nQuant,'')
      oGridAfazer:GoLine(nQuant)
      oGridAfazer:SetValue("ZZ6_DESCR", cDescr)
      oGridAfazer:SetValue("ZZ6_EMAND", .F.)
      oGridAfazer:SetValue("ZZ6_CONCLU", .F.)
    endif
  endif
  oView:Refresh()
Return .T.
