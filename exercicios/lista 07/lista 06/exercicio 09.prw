//Biblioteca
#INCLUDE 'TOTVS.CH'

//Fun��o para alterar a descri��o do produto
User Function Item()
  //Variaveis MVC
  Local aParam   := PARAMIXB
  Local cIdPonto := ''

  //Variaveis de retorno da fun��o
  Local lRet     := .T.

  if aParam <> NIL
    cIdPonto := aParam[2]
      
    if cIdPonto == 'MODELCOMMITTTS'//Verificar o processo que o usuario esta 
      SB1->B1_DESC := ALLTRIM('PRDMANUAL - ' + M->B1_DESC)//Efetuar a altera��o na descri��o 
    endif
  endif
Return lRet
