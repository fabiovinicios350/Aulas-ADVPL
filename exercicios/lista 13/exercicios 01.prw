#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function CriaPasta
  Função para criar uma pasta
  @type  Function 
  @author Fabio
  @since 25/04/2023
/*/
User Function CriarPasta()
  Local cCaminho  := 'C:\Users\User\AppData\Local\Temp\'
  Local cPasta    := 'Lista 13 - Ex1\'

  if !ExistDir(cCaminho + cPasta)
    if !MakeDir(cCaminho + cPasta)==0
      FwAlertError("Houve um erro na criação da pasta","Erro")
    endif
    FwAlertSuccess("Pasta criada com sucesso! ","Sucesso")

  else
    FwAlertError("Pasta ja existe! ","Alerta")
  endif
Return 
