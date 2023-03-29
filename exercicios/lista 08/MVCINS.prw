//Biblioteca
#INCLUDE 'TOTVS.CH'
#INCLUDE 'FWMVCDEF.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

/*/{Protheus.doc} User Function MVCINS
  Função MVC para cadastro os Instrutores
  @type Function
  @author Fabio
  @since 27/03/2023
  @version 1.0
/*/
User Function MVCINS()
  Local cAlias    :=  'ZZI'
  Local cTitle    :=  'Cadastro de Instrutor'
  Local oMark     := FwMarkBrowse():New()

  oMark:SetAlias(cAlias)
  oMark:SetDescription(cTitle)

  oMark:SetFieldMark('ZZI_MARC')

  oMark:AddButton('Exc. Marcados','U_ExcMarcados',5, 1)

  oMark:DisableDetails() 
  oMark:DisableReport()
  oMark:Activate()
Return

//Função para colocar as opções da tela
Static Function MenuDef()
  Local aRotina := {}

  ADD OPTION aRotina TITLE 'Incluir'        ACTION 'VIEWDEF.MVCINS' OPERATION 3 AcCESS 0
  ADD OPTION aRotina TITLE 'Alterar'        ACTION 'VIEWDEF.MVCINS' OPERATION 4 ACCESS 0
  ADD OPTION aRotina TITLE 'Excluir'        ACTION 'VIEWDEF.MVCINS' OPERATION 5 ACCESS 0
Return aRotina

//Função para montar o modelo de dados
Static Function ModelDef()
  //Variaveis de bloco de codigo para validação
  Local bModelPos := {|oModel| ValidModelPos(oModel)}

  //Variaveis para  mostar a estrutura
  Local oModel    := MPFormModel():New('MVCINSM',,bModelPos)
  Local oStruZZI  := FWFormStruct(1,'ZZI')  

  oModel:ADDFields('ZZIMASTER',/*/PAI/*/,oStruZZI)
  oModel:SetDescription('Modelo de dados do Instrutor')
  oModel:GetModel('ZZIMASTER'):SetDescription('Formulario de instrutor')
  oModel:SetPrimaryKey({'ZZI_COD'})
Return oModel

//Função para monstar a view 
Static Function ViewDef()
  Local oModel    := FwLoadModel('MVCINS')
  Local oStruZZI  := FwFormStruct(2, 'ZZI')
  Local oView     := FwFormView():New()

  oView:SetModel(oModel)
  oView:AddField('VIEW_ZZI', oStruZZI, 'ZZIMASTER')
  oView:CreateHorizontalBox('TELA',100)
  oView:SetOwnerView('VIEW_ZZI','TELA')
Return oView

//Função para excluir os itens marcados
User Function ExcMarcados()
  if(MsgyesNo("Deseja Excluir os Instrutores marcados ","Excluir")) //Confimação de exclusão
    DbSelectArea('ZZI')
    ZZI->(DbGoTop())
    While ZZI->(!EOF())
      if oMark:IsMark() //Verificar se o registro esta marcado
        if(ZZI->ZZI_QTDALU>0)
          FwAlertError("O Instrutor "+ZZI->ZZI_NOME+" não pode ser excluido, pois existe alunos vinculado","Erro na exclusão")	
        else
          RecLock('ZZI', .F.)
            ZZI->(DbDelete())//Deletando o revistro selecionado
          ZZI->(MsUnlock())
        endif
      endif
      ZZI->(DBSKIP())
    enddo
    oMark:Refresh(.T.)
  endif
Return

//Função para validação dos campos apos clicar na confirmação
Static Function ValidModelPos(oModel)

  //Variaveis para pegar os valores dos campos
  Local nOper           := oModel:Getoperation()
  Local dNascimento     := oModel:GetValue('ZZIMASTER','ZZI_DTNAS')
  Local dHabilitado     := oModel:GetValue('ZZIMASTER','ZZI_DTHAB')
  Local nQTDAluno       := oModel:GetValue('ZZIMASTER','ZZI_QTDALU')
  Local cCodCnh         := alltrim(oModel:GetValue('ZZIMASTER','ZZI_CATEG'))
  Local cEscolaridade   := Alltrim(oModel:GetValue('ZZIMASTER','ZZI_ESCOLA'))

  //Variaveis de manipulação
  Local lTudoOK         := .T.
  Local nIdade          := DateDiffYear(dNascimento,Date())
  Local nHabilitado     := DateDiffYear(dHabilitado,Date())
  
  if nOper = 3 .or. nOper = 4 // Validação na operação de incluir e alterar
    if nIdade<21
      Help(,,'Idade de Instrutor inválida',,'Um Instrutor não pode ter a idade menor que 21 anos', 1, 0,,,,,,{'Cadastrar um instrutor com a idade maior que 21 anos'})
      lTudoOK := .F.
    elseif nHabilitado<2
      Help(,,'o Instrutor esta habilitado menos de 2 anos',,'Um instrutor precisa der no minimo 2 anos de habilitação', 1, 0,,,,,,{'Cadastrar um instrutor com no minimo 2 anos de habilitação'})
      lTudoOK := .F.
    elseif cEscolaridade=="F"
      Help(,,'Escolaridade invalida',,'Um instrutor precisa ter concluido o Ensino Medio', 1, 0,,,,,,{'Cadastro um Instrutor com o ensino medio completo'})
      lTudoOK := .F.
    elseif !ValidCNH(cCodCnh)//Validando o codigo da CNH
      Help(,,'Codigo Invalido',,'Codigo da CNH Invalido', 1, 0,,,,,,{'Informar um codigo de CNH valido'})
      lTudoOK := .F.
    else
      lTudoOK := .T.
    endif
  elseif nOper = 5 // Validação na operação de Exclusão
    if(nQTDAluno>0)
      FwAlertError("Instrutor não pode ser excluido, pois existe alunos vinculado","Erro na exclusão")	
      lTudoOK := .F.
    else
      lTudoOK := .T.
    endif
  endif
Return lTudoOK

//Função para validar a CNH
Static Function ValidCNH(cCodigo)
  Local aArea   := GetArea()
  Local cAlias  := GetNextAlias()
  Local lRetorno  := .F.

  cQuery := "SELECT 1 Retorno FROM "+RetSqlName("ZZ2")+" WHERE ZZ2_COD='"+cCodigo+"'"

  TCQUERY cQuery ALIAS &(cAlias) NEW
  
  if(&(cAlias)->(Retorno)==1)
    lRetorno:= .T.
  endif
  &(cAlias)->(DbCloseArea())
  RestArea(aArea)
Return lRetorno
