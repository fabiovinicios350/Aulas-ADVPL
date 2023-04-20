//Biblioteca
#INCLUDE 'TOTVS.CH'
#INCLUDE 'FWMVCDEF.CH'

/*/{Protheus.doc} User Function MYMVC_2
  Exemplo MVC
  @type Function
  @author Fabio
  @since 17/03/2023
  @version 1.0
/*/
User Function MYMVC_2()
  Local cTitle  := 'Cursos'
  Local oBrowse := FwMBrowse():New()
  Private cAlias  := 'ZZC'

  oBrowse:setAlias(cAlias)
  oBrowse:SetDescription(cTitle)
  oBrowse:DisableDetails()
  oBrowse:DisableReport()
  oBrowse:Activate()
Return


Static Function MenuDef()
  Local aRotina   := {}

  ADD OPTION aRotina TITLE 'Visualização'                 ACTION 'VIEWDEF.MYMVC_2' OPERATION 2 ACCESS 0
  ADD OPTION aRotina TITLE 'Cadastrar'                    ACTION 'VIEWDEF.MYMVC_2' OPERATION 3 ACCESS 0
  ADD OPTION aRotina TITLE 'Mudar'                        ACTION 'VIEWDEF.MYMVC_2' OPERATION 4 ACCESS 0
  ADD OPTION aRotina TITLE 'Deletar'                      ACTION 'VIEWDEF.MYMVC_2' OPERATION 5 ACCESS 0
  ADD OPTION aRotina TITLE 'Exportação de relatorio'      ACTION 'U_PlanCursos'    OPERATION 6 ACCESS 0
Return aRotina


Static Function ModelDef()
  Local oModel    := MPFormModel():New('MYMVC_2M')
  Local oStruZZC  := FWFormStruct(1,'ZZC')
  Local oStruZZB  := FWFormStruct(1, 'ZZB')
  Local aGatilho  := FwStruTrigger('ZZB_COD','ZZB_NOME', 'ZZ1->ZZ1_NOME', .T., 'ZZ1', 1, 'xFilial("ZZ1")+Alltrim(M->ZZB_COD)') 

  oStruZZB:AddTrigger(aGatilho[1],aGatilho[2],aGatilho[3],aGatilho[4])

  oModel:AddFields('ZZCMASTER',/*/ PAI /*/,oStruZZC)
  oModel:AddGrid('ZZBDETAIL','ZZCMASTER',oStruZZB)

  oModel:SetDescription('Cursos')
  oModel:GetModel('ZZCMASTER'):SetDescription('Cursos')
  oModel:GetModel('ZZBDETAIL'):SetDescription('Alunos')

  oModel:SetRelation('ZZBDETAIL',{{'ZZB_FILIAL','xFilial("ZZB")'},{'ZZB_CURSO','ZZC_CODIGO'}}, ZZB->(IndexKey(1)))
  
  oModel:SetPrimaryKey({'ZZC_CODIGO','ZZB_COD'})
Return oModel

Static Function ViewDef()
  Local oModel    := FWLoadModel('MYMVC_2') 
  Local oStruZZC  := FWFormStruct(2, 'ZZC')
  Local oStruZZB  := FWFormStruct(2, 'ZZB')
  Local oView     := FWFormView():New()

  oView:SetModel(oModel)
  oView:AddField('VIEW_ZZC',oStruZZC, 'ZZCMASTER')
  oView:AddGrid('VIEW_ZZB',oStruZZB,'ZZBDETAIL')

  oView:CreateHorizontalBox('Cursos',30)
  oView:CreateHorizontalBox('Alunos',70)


  oView:SetOwnerView('VIEW_ZZC','Cursos')
  oView:SetOwnerView('VIEW_ZZB','Alunos')
  
  oView:EnableTitleView('VIEW_ZZC','Dados do Curso')
  oView:EnableTitleView('VIEW_ZZB','Alunos Matriculados')

  oView:SetViewAction('BUTTONOK',{|oView| MostrarMsg(oView)})
  oView:SetFieldAction('ZZC_CODIGO',{|oView| CarregaNome(oView)})

  oView:AddUserButton('Um Botão','CLIPS', {|| FwAlertInfo('Pronto!','Essa e a mensagem!')},'Botão de mensagem',/*/ nShortcut /*/,{MODEL_OPERATION_INSERT, MODEL_OPERATION_UPDATE})
  
  oView:AddOtherObjects('BOTAO', {|oPanel| Clique(oPanel)})
  oView:SetOwnerView('BOTAO','Cursos')
Return oView

Static Function MostrarMsg(oView)
  Local nOper   := oView:GetOperation()
  Local cCurso  := oView:GetValue('ZZCMASTER','ZZC_NOME')
  Local cLinhas := cValToChar(oView:GetModel('ZZBDETAIL'):Length())

  if nOper == 3
    FwAlertSuccess('Inclusão do Curso <b>'+cCurso+'</b> realizado com sucesso!', 'SetViewAction')
  elseif nOper == 4
    FwAlertInfo('Alteração do Curso <b>'+cCurso+'</b> realizado com sucesso!', 'SetViewAction')
  elseif nOper == 5
    FwAlertError('Exclusão do Curso <b>'+cCurso+'</b> realizado com sucesso!', 'SetViewAction')
  endif
  FwAlertInfo('Existem'+cLinhas)
Return 

Static Function CarregaNome(oView)
  Local cNome   := 'Curso'
  Local oModel  := oView:GetModel('ZZCMASTER')

  oModel:SetValue('ZZC_NOME', cNome)
  oView:Refresh()
Return 

Static Function Clique(oPanel)
  TButton():New(005, 001, 'Clique aqui!', oPanel, {|| FwAlertInfo('Voce clicou', 'parabens')}, 050, 020)
Return 
