#INCLUDE 'TOTVS.CH'

User Function Item()
  Local aParam    := PARAMIXB
  Local lRet      := .T.
  Local cIdModel  := ''
  Local cIdPonto  := ''
  Local oObjeto   

  if aParam <> nil
    oObjeto := aParam[1]
    cIdPonto := aParam[2]
    cIdModel := aParam[3]

    if INCLUI .and. cIdPonto=="MODELCOMMITTTS"
      if alltrim(SB1->B1_CODBAR)==""
        SB1->B1_CODBAR:=cValToChar(RANDOMIZE(1,100000))
      endif
    endif
  endif
Return lRet

