//Biblioteca
#INCLUDE 'TOTVS.CH'

//Função para alterar a descrição do produto
User Function Item()
  //Variaveis MVC
  Local aParam   := PARAMIXB
  Local cIdPonto := ''

  //Variaveis de retorno da função
  Local lRet     := .T.

  if aParam <> NIL
    cIdPonto := aParam[2]
      
    if cIdPonto == 'MODELCOMMITTTS'//Verificar o processo que o usuario esta 
      SB1->B1_DESC := ALLTRIM('PRDMANUAL - ' + M->B1_DESC)//Efetuar a alteração na descrição 
    endif
  endif
Return lRet
