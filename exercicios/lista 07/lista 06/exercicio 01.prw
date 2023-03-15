//Biblioteca
#INCLUDE 'TOTVS.CH'

//Fun��o aplicar uma rotina no processo de altera��o de um produto
User Function MT010ALT()
  //Variavies para manipula��o no banco de dados
  Local aArea     := GetArea()
  Local aAreaSB1  := SB1->(GetArea())

  if ExistBlock("AltDescr")
    ExecBlock("AltDescr")//Altera descri��o
  else
    FwAlertError("Erro ao chamar uma fun��o de usuaruo","Falha na fun��o")	
  endif

  RestArea(aArea)
  RestArea(aAreaSB1) 
Return .T.

//Fun��o aplicar uma rotina no processo de cria��o de um novo cadastro de produto
User Function MT010INC()
  //Variavies para manipula��o no banco de dados
  Local aArea     := GetArea()
  Local aAreaSB1  := SB1->(GetArea())

  if ExistBlock("AltDescr")
    ExecBlock("AltDescr")//Altera descri��o
  else
    FwAlertError("Erro ao chamar uma fun��o de usuaruo","Falha na fun��o")	
  endif

  if ExistBlock("BlqCadastro")
    ExecBlock("BlqCadastro")//Bloquear cadastro 
  else
    FwAlertError("Erro ao chamar uma fun��o de usuaruo","Falha na fun��o")	
  endif
  
  RestArea(aArea)
  RestArea(aAreaSB1)
Return .T.

//Fun��o para alterar a descri��o do produto 
user Function AltDescr()
  Local cTexto := SUBSTR( M->B1_DESC, 1, 14)

  if(cTexto<>"CAD. Manual - ")
    SB1->B1_DESC := ALLTRIM("CAD. Manual - "+ M->B1_DESC)
  endif
Return 
