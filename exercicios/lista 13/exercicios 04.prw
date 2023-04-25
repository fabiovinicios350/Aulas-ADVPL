#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function CopiaArq
  Função para copiar um arquivo
  @type  Function
  @author Fabio
  @since 25/04/2023
/*/
User Function CopiaArq()
  Local cPastaOrigem    := 'C:\Users\User\AppData\Local\Temp\Lista 13 - Ex1\'
  Local cPastaDest      := '\Lista 13\'
  Local cNomeArq        := 'arquivo_ex2.txt'
  Local aArquivo        := Directory(cPastaOrigem + cNomeArq, 'D',,,1)

  if len(aArquivo)>0
    if !ExistDir(cPastaDest)
      if !MakeDir(cPastaDest) == 0 
        FwAlertError("Houve um erro na criação da pasta","Erro")
      endif
    endif

    if !CpyT2S(cPastaOrigem + aArquivo[1][1], cPastaDest)
      FwAlertError("Houve um erro ao copiar o Arquivo "+aArquivo[1][1] ,"Erro")
    else
      FwAlertSuccess('Arquivo copiado com sucesso!', 'Concluido')
    endif
  else
    FwAlertInfo('Arquivo não encontrado'+CRLF+'Pasta Origem: '+cPastaOrigem, 'Alerta!')
  endif 
Return 
