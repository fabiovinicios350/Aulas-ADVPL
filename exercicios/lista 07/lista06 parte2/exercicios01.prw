//Biblioteca
#INCLUDE 'TOTVS.CH'

//Fun��o para verificar se o tipo de entrada do item foi preenchido
User Function MT120PCOL()
  //Variaveis globais
  Local nOper       := PARAMIXB[1]//Pegando o parametro do fun��o
  Local lRet    := .T.
  Local nLinha

  //Verificando opera��o
  if(nOper==1 .and. (INCLUI .or. ALTERA))
    //Verificando todos os item da entrada
    for nLinha:=1 to len(ACOLS)//ACOLS e o array que armazena as informa��es dos produtos
      if empty(ACOLS[nLinha][33])
        lRet    := .F.
        FwAlertError("Voce |n�o informou o tipo de entrada ","Tipo de entrada vazio!")
      endif
    next nLinha
  endif
Return lRet
