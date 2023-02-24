//Bibliotecas
#INCLUDE 'TOTVS.CH'

/*/
  author Fabio
  data 22/02/2023

  Descrção: Função para remover os acentos de uma palavra
/*/

user function RemoveAcento(cPalavra)
  Local cAcentos    := "ÁÃÂÀáàâãÓÕÔóôõÇçÉÊéê"
  Local cCorreto    := "AAAAaaaaOOOoooCcEEee"
  Local cRetorno    := ''
  Local cCaracter
  Local nI
  Local nJ

  For nI:= 1 to len(cPalavra)
    cCaracter := SubStr(cPalavra,nI,1)
    nJ:= at(cCaracter,cAcentos)
    if(nJ>0)
      nI++
      if(cCaracter=="Ç")
        cCaracter := "C"
      else
        cCaracter := SubStr(cCorreto,nJ,1)
      endif
    endif
    cRetorno+=cCaracter
  next nI
return cRetorno
