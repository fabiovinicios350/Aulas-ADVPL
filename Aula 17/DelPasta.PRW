#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function DelPasta
  Função para deleatr uma pasta
  @type  Function
  @author Fabio
  @since 24/04/2023
/*/
User Function DelPasta()
  Local cPasta  := 'C:\Users\User\Desktop\PastaTeste\'
  Local aArquivo  := Directory(cPasta + '*.*', 'D',,,1)
  Local nI

  if Existdir(cPasta)
    if MsgyesNo("Confirma a exclusão da pasta","Alerta!")
      if len(aArquivo)>0
        for nI := 3 to len(aArquivo)
          if FErase(cPasta + aArquivo[nI][1])==-1
            FwAlertError("Houve um erro ao deletar o Arquivo "+aArquivo[nI][1] ,"Erro")
          endif
        next nI
      endif

      if DirRemove(cPasta)
        FwAlertSuccess("Pasta Excluida com sucesso","Sucesso")	
      else
        FwAlertError("Houve algum erro na exclusão da pasta","Erro")	
      endif
    endif
  endif
Return 
