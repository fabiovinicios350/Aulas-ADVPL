//Biblioteca
#INCLUDE 'TOTVS.CH'
#INCLUDE 'FWMVCDEF.CH'

/*/{Protheus.doc} User Function MYMVC_3
  Exemplo MVC
  @type Function
  @author Fabio
  @since 22/03/2023
  @version 1.0
/*/
User Function MYMVC_3()
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

  ADD OPTION aRotina TITLE 'Visualização' ACTION 'VIEWDEF.MYMVC_3' OPERATION 2 ACCESS 0
  ADD OPTION aRotina TITLE 'Cadastrar'    ACTION 'VIEWDEF.MYMVC_3' OPERATION 3 ACCESS 0
  ADD OPTION aRotina TITLE 'Mudar'        ACTION 'VIEWDEF.MYMVC_3' OPERATION 4 ACCESS 0
  ADD OPTION aRotina TITLE 'Deletar'      ACTION 'VIEWDEF.MYMVC_3' OPERATION 5 ACCESS 0
Return aRotina

Static Function ModelDef()
  //Validações do modelo
  Local bModelPre       := {|oModel| ValidPre(oModel)}
  Local bModelPos       := {|oModel| ValidPos(oModel)}
  Local bModelCancel    := {|oModel| ValidCancel(oModel)}
  
  //Validações do formulario
  Local bFieldPos       := {|oFields| ValidFields(oFields)}
  // Local bLoadFields     := {|oFields,lCopy| LoadFields()}

  //Validações do Grid
  Local bLinePre        := {|oGrid, nLine, cAction, cFieldId, xValue, xCurValue| validPreGrid(oGrid, nLine, cAction, cFieldId, xValue, xCurValue)}
  Local bLinePos        := {|oGrid, nLine| validPosGrid(oGrid)}
  Local bLoadGrid        := {|oGrid| LoadGrid(oGrid)}

  Local oModel    := MPFormModel():New('MYMVC_3M',bModelPre,bModelPos,,bModelCancel)
  Local oStruZZC  := FWFormStruct(1,'ZZC')
  Local oStruZZB  := FWFormStruct(1, 'ZZB')
  Local aGatilho  := FwStruTrigger('ZZB_COD','ZZB_NOME', 'ZZ1->ZZ1_NOME', .T., 'ZZ1', 1, 'xFilial("ZZ1")+Alltrim(M->ZZB_COD)') 

  oStruZZB:AddTrigger(aGatilho[1],aGatilho[2],aGatilho[3],aGatilho[4])
  
  oModel:AddFields('ZZCMASTER',/*/ PAI /*/,oStruZZC,,bFieldPos)
  oModel:AddGrid('ZZBDETAIL','ZZCMASTER',oStruZZB,bLinePre,bLinePos,,,bLoadGrid)

  oModel:SetDescription('Cursos')
  oModel:GetModel('ZZCMASTER'):SetDescription('Cursos')
  oModel:GetModel('ZZBDETAIL'):SetDescription('Alunos')

  oModel:SetRelation('ZZBDETAIL',{{'ZZB_FILIAL','xFilial("ZZB")'},{'ZZB_CURSO','ZZC_CODIGO'}}, ZZB->(IndexKey(1)))

  oModel:SetPrimaryKey({'ZZC_CODIGO','ZZB_COD'})

  oModel:GetModel('ZZBDETAIL'):SetUniqueLine({'ZZB_COD'})

Return oModel

Static Function ViewDef()
  Local oModel    := FWLoadModel('MYMVC_3') 
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
  Local oModel  := oView:GetModel('ZZCMASTER')
  
  oModel:SetValue('ZZC_NOME', '')
  oView:Refresh()
Return

Static Function Clique(oPanel)
  TButton():New(005, 001, 'Clique aqui!', oPanel, {|| FwAlertInfo('Voce clicou', 'parabens')}, 050, 020)
Return 

Static Function ValidPre(oObjeto)
  Local nOperation  := oObjeto:Getoperation()

  if nOperation ==4
    oObjeto:GetModel('ZZCMASTER'):GetStruct():SetProperty('ZZC_CODIGO', MODEL_FIELD_WHEN, FwBuildFeature(STRUCT_FEATURE_WHEN,  '.F.'))
  endif
Return .T.

Static Function ValidPos(oObjeto)
  Local nOperation  := oObjeto:Getoperation()
  Local cConteudo   := oObjeto:GetValue('ZZCMASTER','ZZC_NOME')

  Local lTudoOK     := .T.
  
  if(nOperation==5)
    lTudoOK := .F.
    Help(,,'Nao autorizado!',,'Voce nao tem autorização para fazer exclusões', 1, 0,,,,,,{'Contate o administrador'})
  elseif Alltrim(cConteudo)=='TESTE'
    lTudoOK := .F.
    Help(,,'Não e possivel gravar o curso!',,'O <b>Nome do curso</b> não foi preenchido', 1, 0,,,,,,{'Preencha o nome do curso'})
  endif
Return lTudoOK

Static Function ValidCancel(oObjeto)
  Local lCancel   := .F.
  Local cMsg      := 'Deseja Cancelar a operação'

  FwFormCancel(oObjeto)
  lCancel := MsgyesNo(cMsg,"Confirmação")	
Return lCancel

Static Function ValidFields(oFields)
  Local lTudoOK   := .T.
  Local cCod      := oFields:GetValue('ZZC_CODIGO')

  if cCod == '000000'
    lTudoOK := .F.
    Help(,,'Operação não permitida!',,'o Codigo do curso não pode ser <b>000000</b>', 1, 0,,,,,,{'Coloque um codigo valido'})
  endif
Return lTudoOK

Static Function LoadFields()
  Local aDados    := {}
  Local nRecNo    := LASTREC()

  Aadd(aDados, {xFilial('ZZC'), '111111', 'COBOL'})
  Aadd(aDados, nRecNo)
Return aDados

Static Function validPreGrid(oGrid, nLine, cAction, cFieldId, xValue, xCurValue)
  Local lValido   := .T.

  if(cAction=='SETVALUE' .and. cFieldId=='ZZB_COD' .and. xValue == xCurValue)
    lValido := .F.
    Help(,,'Não tem porque fazer isso!',,'Você digitou o mesmo codigo!',1,0,,,,,,{'Selecione outro aluno'}) 
  endif
Return lValido

Static Function validPosGrid(oGrid)
  Local lValido   := .T.
  Local cAluno    := alltrim(UPPER(oGrid:GetValue('ZZB_NOME')))

  if(cAluno=='FABIUO')
    lValido := .F.
    Help(,,'Aluno Banido!',,'Aluno <b>'+cAluno+'</b> esta proibido de estudar aqui!', 1, 0,,,,,,{'Selecione outro aluno'})
  endif
Return lValido

Static Function LoadGrid(oGrid)
  Local aRetorno    := {}
  Local aFields     := oGrid:GetStruct():GetFields()
  Local aAux        := Array(Len(aFields))
  Local nI          := 0

  for nI:=1 to len(aFields)
    if Alltrim(aFields[nI][3]) == 'ZZB_DTINIC'
      aAux[nI] := Date()
    endif
  next

  Aadd(aRetorno,{1,aAux})
Return aRetorno
