//Biblioteca
#INCLUDE 'TOTVS.CH'

//Função aplicar uma rotina no processo de alteração de um produto
User Function MT010ALT()
  //Variavies para manipulação no banco de dados
  Local aArea     := GetArea()
  Local aAreaSB1  := SB1->(GetArea())

  if ExistBlock("AltDescr")
    ExecBlock("AltDescr")//Altera descrição
  else
    FwAlertError("Erro ao chamar uma função de usuaruo","Falha na função")	
  endif

  RestArea(aArea)
  RestArea(aAreaSB1) 
Return .T.

//Função aplicar uma rotina no processo de criação de um novo cadastro de produto
User Function MT010INC()
  //Variavies para manipulação no banco de dados
  Local aArea     := GetArea()
  Local aAreaSB1  := SB1->(GetArea())

  if ExistBlock("AltDescr")
    ExecBlock("AltDescr")//Altera descrição
  else
    FwAlertError("Erro ao chamar uma função de usuaruo","Falha na função")	
  endif

  if ExistBlock("BlqCadastro")
    ExecBlock("BlqCadastro")//Bloquear cadastro 
  else
    FwAlertError("Erro ao chamar uma função de usuaruo","Falha na função")	
  endif
  
  RestArea(aArea)
  RestArea(aAreaSB1)
Return .T.

//Função para alterar a descrição do produto 
user Function AltDescr()
  Local cTexto := SUBSTR( M->B1_DESC, 1, 14)

  if(cTexto<>"CAD. Manual - ")
    SB1->B1_DESC := ALLTRIM("CAD. Manual - "+ M->B1_DESC)
  endif
Return 
