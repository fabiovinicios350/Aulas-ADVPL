#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function DelArq
  FunÁ„o para deletar uma pasta
  @type  Function
  @author Fabio
  @since 25/04/2023
/*/
User Function DelArq()
  Local cPasta      := 'C:\Users\User\AppData\Local\Temp\lista 13 - ex1\'
  Local aArquivo    :=  Directory(cPasta + '*.*', 'D',,,1)
  Local nI

  if Existdir(cPasta)
    if MsgyesNo("Confirma a exclusao da pasta","Alerta!")

      //Excluindo os arquivos
      if len(aArquivo)>0
        for nI := 3 to len(aArquivo)
          if FErase(cPasta + aArquivo[nI][1])==-1
            FwAlertError("Houve um erro ao deletar o Arquivo "+aArquivo[nI][1] ,"Erro")
          endif
        next nI
      else
        FwAlertError("A Pasta esta vazia!","Erro")
      endif

      //Excluindo as pastas
      if DirRemove(cPasta)
        FwAlertSuccess("Pasta Excluida com sucesso","Sucesso")	
      else
        FwAlertError("Houve algum erro na exclus√£o da pasta","Erro")	
      endif
    endif
  else
     FwAlertError("Diretorio n„o encontrado:"+CRLF+ cPasta,"Erro")
  endif 
Return 
