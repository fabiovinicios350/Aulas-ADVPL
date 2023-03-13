#INCLUDE 'TOTVS.CH'

User Function MT120PCOL()
  Local nOper       := PARAMIXB[1]
  Local lRetorno    := .T.
  Local nI

  if(nOper==1 .and. (INCLUI .or. ALTERA))
    for nI:=1 to len(ACOLS)
      if empty(ACOLS[nI][33])
        lRetorno    := .F.
        FwAlertError("Voce |não informou o tipo de entrada ","Tipo de entrada vazio!")
      endif
    next nI
  endif

Return lRetorno
