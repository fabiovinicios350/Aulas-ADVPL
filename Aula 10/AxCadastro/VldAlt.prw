#INCLUDE 'PROTHEUS.CH'

User Function VldAlt()
  Local lRet := .F.

  if INCLUI
    lRet := MSGYESNO( 'Confirma a inclusao', "Inclusao" )
  else
    lRet := MSGYESNO( 'Confirma a Alteracao', "Alteracao" )
  endif

Return lRet
