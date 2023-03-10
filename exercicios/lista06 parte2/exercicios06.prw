#INCLUDE 'TOTVS.CH'

User Function CUSTOMERVENDOR()
  Local aParam    := PARAMIXB
  Local xRet
  Local cIdPonto
  Local cAlias  := 'SB1'
  Local cTitulo := 'Cadastro de Produto'
  Private oObj
  Private nOper

  DbSelectArea(cAlias)
  DbSetOrder(1)
  
  xRet := .T.
  
  if aParam <>NIL
    oObj      := aParam[1]
    cIdPonto  := aParam[2]


    if cIdPonto=="MODELPOS"
      nOper:= oObj:nOperation
      if nOper==5//Exercicio 09
        if(ExistBlock('ValidaExclusao'))
            xRet:=ExecBlock('ValidaExclusao', .F., .F.)
        else
          FwAlertError("Função nao encontrada","Erro!")
        endif
      else//Exercicio 06
        if(empty(M->A2_PAIS))
          xRet:= .F.
          Help(,, "Campo em Branco",, "O campo pais não pode ficar em branco", 1, 0, , , , , , {"Por favor informe o pais"})
        elseif (M->A2_PAIS=="105" .and. empty(M->A2_CGC))
          xRet:= .F.
          Help(,, "Campo em Branco",, "Como o Fornecedores e do Brasil e preciso de um CNPJ", 1, 0, , , , , , {"Por favor informe o CNPJ"})
        endif
      endif
    elseif cIdPonto=="BUTTONBAR"//Exercicio 07 - 10
      if INCLUI
        xRet:={}
        aAdd(xRet,{"cad. produto","",{|| Axcadastro(cAlias, cTitulo,'.T.','.T.')}, "cad. produto"})
        if(ExistBlock('InsereFilial'))
          ExecBlock('InsereFilial', .F., .F.)
        else
          FwAlertError("Função nao encontrada","Erro!")
        endif
      endif
    elseif cIdPonto=="MODELVLDACTIVE"//Exercicio 08
      nOper:= oObj:nOperation
      if(ExistBlock('VerificaOper'))
          ExecBlock('VerificaOper', .F., .F.)
      else
        FwAlertError("Função nao encontrada","Erro!")
      endif
    endif
  endif
  DbCloseArea()
Return xRet


