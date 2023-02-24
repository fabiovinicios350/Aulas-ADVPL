#INCLUDE 'PROTHEUS.CH'

User Function VldExc()
  Local cMsg := 'Confirma a exclusao'
  Local lRet

  lRet := MSGYESNO( cMsg, "Exclusao" )

Return lRet
