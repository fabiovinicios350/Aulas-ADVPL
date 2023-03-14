//Biblioteca
#INCLUDE 'TOTVS.CH'

//Fun��o para para criar uma valida��o dentro dos processo da tela e cadastro de fornecedores
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


    if cIdPonto=="MODELPOS" //Verificar se o processo e o MODELPOS (Fun��o apos a confirma��o)
      nOper:= oObj:nOperation
      if nOper==5 //Verificando se a rotina e uma exclus�o
        if(ExistBlock('ConfirmaExclusao'))
            xRet:=ExecBlock('ConfirmaExclusao', .F., .F.)//Pedindo a confirma��o para a exclus�o
        else
          FwAlertError("Fun��o nao encontrada","Erro!")
        endif
      else
        if(empty(M->A2_PAIS))//Verificando se o campo esta em branco
          xRet:= .F.
          Help(,, "Campo em Branco",, "O campo pais n�o pode ficar em branco", 1, 0, , , , , , {"Por favor informe o pais"})
        elseif (M->A2_PAIS=="105" .and. empty(M->A2_CGC))//Verificando se o Pais e o Brasil e se o CNPJ\CPF esta em branco 
          xRet:= .F.
          Help(,, "Campo em Branco",, "Como o Fornecedores e do Brasil e preciso de um CNPJ", 1, 0, , , , , , {"Por favor informe o CNPJ"})
        endif
      endif
    elseif cIdPonto=="BUTTONBAR"//Verificar se o processo e o BUTTONBAR (Fun��o para criar os butoes dentro da tela de incluir)
      if INCLUI
        xRet:={}
        aAdd(xRet,{"cad. produto","",{|| Axcadastro(cAlias, cTitulo,'.T.','.T.')}, "cad. produto"})//adicionando um bot�o na dela de inclus�o do cadastro
        if(ExistBlock('InsereFilial'))
          ExecBlock('InsereFilial', .F., .F.)//Inserindo a filial automaticamente no processo de inclus�o
        else
          FwAlertError("Fun��o nao encontrada","Erro!")
        endif
      endif
    elseif cIdPonto=="MODELVLDACTIVE"//Verificar se o processo e o MODELVLDACTIVE (primeira fun��o a ser executada nas rotinas)
      nOper:= oObj:nOperation
      if(ExistBlock('VerificaOper'))
          ExecBlock('VerificaOper', .F., .F.)//Fun��o para apresentar uma mensagem da opera��o que o usuario esta
      else
        FwAlertError("Fun��o nao encontrada","Erro!")
      endif
    endif
  endif
  DbCloseArea()
Return xRet


