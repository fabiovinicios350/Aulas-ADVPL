#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function PSYA
  Exemplo de utilização de Psay
  @type  Function
  @author Fabio
  @since 03/04/2023
/*/
User Function PSAY()
  Local cTitulo       := 'Cadastro de Clientes'
  Private cAlias      := 'SA1'
  Private cProgram    := 'PSAY'
  Private cDesc1      := 'Esse é um exemplo'
  Private cDesc2      := 'de relatorio'
  Private cDesc3      := 'utilizando PSAY'
  Private cSize       := 'M'
  Private aReturn     := {'Zebrado', 1, 'Administração', 1, 2, '', '', 1}
  Private cNomeRel    := SetPrint(cAlias,cProgram, '', @cTitulo, cDesc1, cDesc2, cDesc3, .F.,, .T., cSize, .F.)

  SetDefault(aReturn, cAlias)

  RptStatus({|| Imprime()}, cTitulo, 'Gerando Relatorio...')
Return 

Static Function Imprime()
  Local nLinha   := 2

  DbSelectArea('SA1')
  SA1->(DbSetOrder(1))

  While SA1->(!EOF())
    @ nLinha, 00 PSAY PADR('Código:',10) + Alltrim(SA1->A1_COD)
    nLinha++
    
    @ nLinha, 00 PSAY PADR('Nome:',10)+Alltrim(SA1->A1_NOME)
    nLinha++

    @ nLinha, 00 PSAY PADR('Endereço:',10)+Alltrim(SA1->A1_END)
    nLinha++

    @ nLinha, 00 PSAY PADR('Bairro:',10)+Alltrim(SA1->A1_BAIRRO)
    nLinha++

    @ nLinha, 00 PSAY PADR('Cidade:',10)+Alltrim(SA1->A1_MUN)
    nLinha++

    @ nLinha, 00 PSAY PADR('UF:',10)+Alltrim(SA1->A1_EST)
    nLinha++
    
    @ nLinha, 00 PSAY 'CEP: '+Alltrim(SA1->A1_CEP)
    nLinha++

    @ nLinha, 00 PSAY Replicate('-',50)
    nLinha++
    SA1->(DbSkip())
  ENDDO

  SET DEVICE TO SCREEN

  if aReturn[5] == 1
    SET PRINTER TO DbCommitAll()
    OurSpool(cNomeRel)
  endif

  MS_FLUSH()
Return 
