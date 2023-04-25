#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function CriarPasta
  Função para criar uma pasta
  @type  Function
  @author Fabio
  @since 24/04/2023
/*/
User Function CriarPasta()
  Local cCaminho  := 'C:\Users\User\Desktop\'
  Local cPasta    := 'PastaTeste\'

  if !ExistDir(cCaminho + cPasta)
    if !MakeDir(cCaminho + cPasta) == 0 
      FwAlertError("Houve um erro na criação da pasta","Erro")
    endif
  endif

  if ExistBlock('EscreveTXT')
    ExecBlock('EscreveTXT', .F., .F., cCaminho + cPasta)
  endif
Return 
