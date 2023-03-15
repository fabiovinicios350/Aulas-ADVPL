//Biblioteca
#INCLUDE 'TOTVS.CH'

//Constantes
#DEFINE BR_FUNDO RGB(255,255,0)
#DEFINE BR_TEXTO RGB(0,0,0)

//Função para mudar a cor de todos os cadastros bloqueados.
User Function MBLKCOLOR()
  Local aCoresBlq  := {(BR_FUNDO),(BR_TEXTO)}
Return aCoresBlq
