#INCLUDE 'TOTVS.CH'

User Function Item()
  Local aParam   := PARAMIXB
  Local lRet     := .T.
  Local cIdPonto := ''

  if aParam <> NIL
    cIdPonto := aParam[2]
      
    if cIdPonto == 'MODELCOMMITTTS'
      SB1->B1_DESC := ALLTRIM('PRDMANUAL - ' + M->B1_DESC)
    endif
  endif
Return lRet
