//Biblioteca
#INCLUDE 'TOTVS.CH'

//Função para para criar uma validação dentro dos processo da tela e cadastro de fornecedores
User Function CUSTOMERVENDOR()  

  //Variaveis de MVC
  Local aParam    := PARAMIXB
  Local cIdPonto

  //Variavel de retorno
  Local xRet

  //variaveis globais
  Local cAlias  := 'SB1'
  Local cTitulo := 'Cadastro de Produto'
  Private oObj
  Private nOper

  DbSelectArea(cAlias)
  DbSetOrder(1)
  
  xRet := .T.
  
  if aParam <>NIL //Verificar se o parametro nao veio vazio 
    oObj      := aParam[1]
    cIdPonto  := aParam[2]


    if cIdPonto=="MODELPOS" //Verificar se o processo e o MODELPOS (Função apos a confirmação)
      nOper:= oObj:nOperation
      if nOper==5 //Verificando se a rotina e uma exclusão
        if(ExistBlock('ConfirmaExclusao'))
            xRet:=ExecBlock('ConfirmaExclusao', .F., .F.)//Pedindo a confirmação para a exclusão
        else
          FwAlertError("Função nao encontrada","Erro!")
        endif
      else
        if(empty(M->A2_PAIS))//Verificando se o campo esta em branco
          xRet:= .F.
          Help(,, "Campo em Branco",, "O campo pais não pode ficar em branco", 1, 0, , , , , , {"Por favor informe o pais"})
        elseif (M->A2_PAIS=="105" .and. empty(M->A2_CGC))//Verificando se o Pais e o Brasil e se o CNPJ\CPF esta em branco 
          xRet:= .F.
          Help(,, "Campo em Branco",, "Como o Fornecedores e do Brasil e preciso de um CNPJ", 1, 0, , , , , , {"Por favor informe o CNPJ"})
        endif
      endif
    elseif cIdPonto=="BUTTONBAR"//Verificar se o processo e o BUTTONBAR (Função para criar os butoes dentro da tela de incluir)
      if INCLUI
        xRet:={}
        aAdd(xRet,{"cad. produto","",{|| Axcadastro(cAlias, cTitulo,'.T.','.T.')}, "cad. produto"})//adicionando um botão na dela de inclusão do cadastro
        if(ExistBlock('InsereFilial'))
          ExecBlock('InsereFilial', .F., .F.)//Inserindo a filial automaticamente no processo de inclusão
        else
          FwAlertError("Função nao encontrada","Erro!")
        endif
      endif
    elseif cIdPonto=="MODELVLDACTIVE"//Verificar se o processo e o MODELVLDACTIVE (primeira função a ser executada nas rotinas)
      nOper:= oObj:nOperation
      if(ExistBlock('VerificaOper'))
          ExecBlock('VerificaOper', .F., .F.)//Função para apresentar uma mensagem da operação que o usuario esta
      else
        FwAlertError("Função nao encontrada","Erro!")
      endif
    endif
  endif
  DbCloseArea()
Return xRet


