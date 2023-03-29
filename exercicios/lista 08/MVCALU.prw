//Biblioteca
#INCLUDE 'TOTVS.CH'
#INCLUDE 'FWMVCDEF.CH'

/*/{Protheus.doc} User Function MVCALU
  Função MVC para cadastro de alunos
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

//Função para colocar as opções da tela
Static Function MenuDef()
  Local aRotina := {}

  ADD OPTION aRotina TITLE 'Incluir'        ACTION 'VIEWDEF.MVCALU' OPERATION 3 AcCESS 0
  ADD OPTION aRotina TITLE 'Alterar'        ACTION 'VIEWDEF.MVCALU' OPERATION 4 ACCESS 0
  ADD OPTION aRotina TITLE 'Excluir'        ACTION 'VIEWDEF.MVCALU' OPERATION 5 ACCESS 0
Return aRotina

//Função para montar o modelo de dados
Static Function ModelDef()
  //Variaveis de bloco de codigo para validação
  Local bModelPos := {|oModel| ValidModelPos(oModel)}
  
  //Variaveis para criação do modelo
  Local oModel    := MPFormModel():New('MVCALUM',,bModelPos)
  Local oStruZZ3  := FWFormStruct(1,'ZZ3') 
  Local aGatilho  := FWStruTrigger('ZZ3_CODINS', 'ZZ3_NOMEIN', 'ZZI->ZZI_NOME', .T., 'ZZI', 1, 'xFilial("ZZI")+Alltrim(M->ZZ3_CODINS)')

  //Aplicando gatilho na estrutura
  oStruZZ3:AddTrigger(aGatilho[1], aGatilho[2], aGatilho[3], aGatilho[4]) 

  //Aplicando um valor sequencial para o Codigo do aluno
  oStruZZ3:SetProperty('ZZ3_COD', MODEL_FIELD_INIT, FwBuildFeature(STRUCT_FEATURE_INIPAD,  'GetSXENum("ZZ3", "ZZ3_COD")'))

  oModel:ADDFields('ZZ3MASTER',/*/PAI/*/,oStruZZ3)
  oModel:SetDescription('Modelo de dados do Alunos')
  oModel:GetModel('ZZ3MASTER'):SetDescription('Formulario de Alunos')
  oModel:SetPrimaryKey({'ZZ3_COD'})
Return oModel

//Função para monstar a view 
Static Function ViewDef()
  Local oModel    := FwLoadModel('MVCALU')
  Local oStruZZ3  := FwFormStruct(2, 'ZZ3')
  Local oView     := FwFormView():New()

  oView:SetModel(oModel)
  oView:AddField('VIEW_ZZ3', oStruZZ3, 'ZZ3MASTER')
  oView:CreateHorizontalBox('TELA',100)
  oView:SetOwnerView('VIEW_ZZ3','TELA')

  //Validação dos campos
  oView:SetFieldAction('ZZ3_RAULAS',{|oView| ValidAulas(oView)})
  oView:SetFieldAction('ZZ3_CODINS',{|oView| ValidAulas(oView)})
Return oView

//Função para excluit os alunos marcados
User Function ExcAlunosMarc()
  if(MsgyesNo("Deseja Excluir os Alunos marcados ","Excluir")) //Confirmação da exclusão
    DbSelectArea('ZZ3')
    ZZ3->(DbGoTop())
    While ZZ3->(!EOF())
      if oMark:IsMark() //Verificar se o registro esta marcado
        DbSelectArea('ZZI')
        DbSetOrder(1)
        if DbSeek(XFilial('ZZI') +ZZ3->ZZ3_CODINS)
          if(alltrim(ZZ3->ZZ3_RAULAS)=='N')
            if(ZZI->ZZI_QTDALU<>0)
              RecLock('ZZI', .F.)
                ZZI->ZZI_QTDALU-=1 //decrementar mais um aluno para o instrutor
              ZZI->(MsUnlock())
            endif 
            RecLock('ZZ3', .F.)
              ZZ3->(DbDelete())
            ZZ3->(MsUnlock())
          else
            Help(,,'Exclusão do aluno invalida',,'Esse aluno esta realizando aulas, por conta disso não pode ser excluido!', 1, 0,,,,,,{'Alterar o campo "Realizando aulas" no cadastro do aluno'})
          endif
        else  
          FwAlertError("Aluno invalido","Erro no exclusão")
        endif
      endif
      ZZ3->(DBSKIP())
    enddo
    oMark:Refresh(.T.)
    DbCloseArea()
  endif
Return

//Validação apos a confirmação da operação
Static Function ValidModelPos(oModel)
  //Variaveis para pegar os valores dos campos
  Local nOper         := oModel:Getoperation()
  Local cCodIns       := oModel:GetValue('ZZ3MASTER','ZZ3_CODINS')
  Local cAulas        := oModel:GetValue('ZZ3MASTER','ZZ3_RAULAS')
  Local cCodAluno     := oModel:GetValue('ZZ3MASTER','ZZ3_COD')

  //Variaveis de manipulação
  Local lRetorno      := .T.
  Local cCodInsAntigo
  
  DbSelectArea('ZZI')
  DbSetOrder(1)
  if DbSeek(XFilial('ZZI') + cCodIns)
    if(nOper==3) //Processo de inclusão
      if( ZZI->ZZI_QTDALU>4)
        Help(,,'Instrutor invalido!',,'O Instrutor informado ja atingiu o limite de 5 alunos vinculados', 1, 0,,,,,,{'Por favor informe outro Instrutor'})
        lRetorno := .F.
      else
        RecLock('ZZI', .F.)
          ZZI->ZZI_QTDALU+=1 //Incrementar a quantidade de alunos 
        ZZI->(MsUnlock())
      endif 
    elseif(nOper==4) //Processo de alteração
      cCodInsAntigo := BuscaInstAtual(cCodAluno) //Buscando o codigo do Instrutor atual
      if cCodAluno<>cCodInsAntigo
        if ZZI->(DbSeek(XFilial('ZZI') + cCodIns))
          if( ZZI->ZZI_QTDALU>4)
            Help(,,'Instrutor invalido!',,'O Instrutor informado ja atingiu o limite de 5 alunos vinculados', 1, 0,,,,,,{'Por favor informe outro Instrutor'})
            lRetorno := .F.
          else
            RecLock('ZZI', .F.)
              ZZI->ZZI_QTDALU+=1 //Incrementar a quantidade de alunos 
            ZZI->(MsUnlock())
            if ZZI->(DbSeek(XFilial('ZZI') + cCodInsAntigo))
              if(ZZI->ZZI_QTDALU<>0)
                RecLock('ZZI', .F.)
                  ZZI->ZZI_QTDALU-=1 //Decrementar a quantidade de alunos 
                ZZI->(MsUnlock())
              endif
            endif
            lRetorno := .T.
          endif 
        endif
      endif

    elseif nOper==5 //processo de Exclução
      if(ZZI->ZZI_QTDALU<>0)
        if(alltrim(cAulas)=='N')
          RecLock('ZZI', .F.)
            ZZI->ZZI_QTDALU-=1 //Decrementar a quantidade de alunos         
          ZZI->(MsUnlock())
        else
          Help(,,'Exclusão do aluno invalida',,'Esse aluno esta realizando aulas, por conta disso não pode ser excluido!', 1, 0,,,,,,{'Alterar o campo "Realizando aulas" no cadastro do aluno'})
          lRetorno := .F.
        endif
      endif
    endif
  else
    Help(,,'Instrutor invalido!',,'Codigo Instrutor Invalido', 1, 0,,,,,,{'Por favor informe Instrutor valido'})
    lRetorno := .F.
  endif
  DbCloseArea()
Return lRetorno

//Função para validar o campos de realizando aulas
Static Function ValidAulas(oView)
  Local oModel  := oView:GetModel('ZZ3MASTER')
  Local cAulas  := alltrim(oView:GetValue('ZZ3MASTER','ZZ3_RAULAS'))
  Local cCODINS := alltrim(oView:GetValue('ZZ3MASTER','ZZ3_CODINS'))   

  if(cAulas=='S' .and. cCODINS=='') //Validar se não doi informado o instrutor
    Help(,,'Opção de "Realizando Aulas" invalido!',,'A opção de "Realizando aulas!" não pode estar como SIM se o instrutor não foi informado', 1, 0,,,,,,{'Por favor informar uma instrutor'})
    oModel:SetValue('ZZ3_RAULAS', 'N')
  elseif !ValidIsntrutor(cCodIns) //Validar se o instrutor e valido
    oModel:SetValue('ZZ3_RAULAS', 'N')
  endif

  oView:Refresh()
Return

//Função para validar se o instrutor e valido
Static Function ValidIsntrutor(cCodIns)
  Local lRetorno  := .T.

  DbSelectArea('ZZI')
  DbSetOrder(1)
  if DbSeek(XFilial('ZZI') + cCodIns)
    if( ZZI->ZZI_QTDALU>4)
      Help(,,'Instrutor invalido!',,'O Instrutor informado ja atingiu o limite de 5 alunos vinculados', 1, 0,,,,,,{'Por favor informe outro Instrutor'})
      lRetorno := .F.
    else
    endif
  else
    Help(,,'Instrutor invalido!',,'Codigo do Instrutor e invalido', 1, 0,,,,,,{'Por favor informe outro Instrutor'})
    lRetorno := .F.
  endif
  DbCloseArea()
Return lRetorno

//Função para buscar o codigo do instrutor de um aluno
Static Function BuscaInstAtual(cCod)
  Local cCodIns

  DbSelectArea('ZZ3')
  DbSetOrder(1)
  if ZZ3->(DbSeek(XFilial('ZZ3') + cCod))
    cCodIns := ZZ3->ZZ3_CODINS
  else
    FwAlertError("Codigo do Isntrutor invalido","Erro ")
  endif
  DbCloseArea()
Return cCodIns
