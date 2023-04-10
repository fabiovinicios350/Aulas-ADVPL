#INCLUDE 'TOTVS.CH'
#INCLUDE 'REPORT.CH'

/*/{Protheus.doc} User Function Treport
  Exemplo de Relatorio utilizando TReport
  @type  Function
  @author Fabio
  @since 05/04/2023
/*/
User Function Treport()
  Local oReport := GeraReport()

  oReport:PrintDialog()
Return 

Static Function GeraReport()
  Local cAlias    := GetNextAlias()
  Local oRel      := TReport():New('TREPORT', 'Relatório de Clientes',, {|oRel| Imprime(oRel,cAlias)}, 'Esse Relatório imprimira todos os cadastros de clientes.', .F.)
  Local oSection  := TRSection():New(oRel, 'Cadastro de Clientes')
  
  TRCell():New(oSection, 'A1_COD', 'SA1', 'Codigo',, 8,,, 'CENTER', .F., 'CENTER',,, .T.,,, .T.)
  TRCell():New(oSection, 'A1_NOME', 'SA1', 'Nome',, 30,,, 'LEFT', .T., 'LEF',,, .T.,,, .T.)
  TRCell():New(oSection, 'A1_END', 'SA1', 'Endereço',, 30,,, 'LEFT', .T., 'LEFT',,, .T.,,, .T.)
  TRCell():New(oSection, 'A1_BAIRRO', 'SA1', 'Bairro',, 20,,, 'LEFT', .T., 'LEFT',,, .T.,,, .T.)
  TRCell():New(oSection, 'A1_MUN', 'SA1', 'Cidade',, 20,,, 'LEFT', .T., 'LEFT',,, .T.,,, .T.)
  TRCell():New(oSection, 'A1_EST', 'SA1', 'UF',, 4,,, 'CENTER', .F., 'CENTER',,, .T.,,, .T.)
  TRCell():New(oSection, 'A1_CEP', 'SA1', 'CEP','@E 99.999-999', 11,,, 'CENTER', .F., 'CENTER',,, .T.,,, .T.)

Return oRel

Static Function  Imprime(oRel,cAlias)
  Local oSection   := oRel:Section(1)
  Local nTotReg    := 0
  Local cQuery     := GeraQuery()

  DbUseArea(.T., 'TOPCONN', TcGenQry(,,cQuery), cAlias, .T., .T.)

  Count To nTotReg

  oRel:SetMeter(nTotReg)
  oRel:SetTitle('Relatorio de Clientes')
  oRel:StartPage()
  oSection:Init()

  (cAlias)->(DbGoTop())

  While (cAlias)->(!EOF())
    if oRel:Cancel()
      Exit
    endif

    oSection:Cell('A1_COD'):SetValue((cAlias)->(A1_COD))
    oSection:Cell('A1_NOME'):SetValue((cAlias)->(A1_NOME))
    oSection:Cell('A1_END'):SetValue((cAlias)->(A1_END))
    oSection:Cell('A1_BAIRRO'):SetValue((cAlias)->(A1_BAIRRO))
    oSection:Cell('A1_MUN'):SetValue((cAlias)->(A1_MUN))
    oSection:Cell('A1_EST'):SetValue((cAlias)->(A1_EST))
    oSection:Cell('A1_CEP'):SetValue((cAlias)->(A1_CEP))

    oSection:PrintLine()
    oRel:IncMeter()

    (cAlias)->(DbSkip())
  enddo

  (cAlias)->(DbCloseArea())
  oSection:Finish()
  oRel:EndPage()
Return 

Static Function GeraQuery()
  Local cQuery    := ''
  
  cQuery := "SELECT A1_COD, A1_NOME, A1_END, A1_BAIRRO, A1_EST, A1_CEP,A1_MUN "+CRLF+; 
  "FROM "+ RetSqlName('SA1') + " SA1 "+CRLF+;
  "WHERE D_E_L_E_T_=''"
Return cQuery
