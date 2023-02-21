#include "protheus.ch"
 
user function exemploJsonFabio()
  local oJson
  local cTextJson
  local ret
  local lRet
 
  oJson := JsonObject():New()
  cTextJson := '{"itens":[{"joao":"maria","josé":"joana","joaquim":"joaquina","juscelino":"joice"},{"limao":"verde","banana":"amarelo","maça":"vermelho","amora":"roxo"}]}'
 
  ret := oJson:FromJson(cTextJson)
 
  if ValType(ret) == "C"
    conout("Falha ao transformar texto em objeto json. Erro: " + ret)
    return
  endif
 
  lRet := oJson:GetJsonValue("itens")
  
 
  FreeObj(oJson)
return
 
/*
Resultado Impresso no console.log:
Label - itens
Vetor[
Indice 1
Label - joaquim
joaquim = joaquina
Label - juscelino
juscelino = joice
Label - josé
josé = joana
Label - joao
joao = maria
Indice 2
Label - banana
banana = amarelo
Label - amora
amora = roxo
Label - maça
maça = vermelho
Label - limao
limao = verde
]Vetor
*/
