#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function CopArq
  Função para copiar os arquivos de log e relatorio
  @type  Function
  @author Fabio
  @since 25/04/2023
/*/
User Function CopArq()
  Local cPastaOrigem    := 'C:\TOTVS12\Protheus\protheus_data\pedido de venda\'
  Local cPastaDest      := 'C:\pedido de venda\'
  Local aArquivo        := Directory(cPastaOrigem + '*.*', 'D',,,1)
  Local nI

  if len(aArquivo)>0
    if !ExistDir(cPastaDest)
      if !MakeDir(cPastaDest) == 0 
        FwAlertError("Houve um erro na criação da pasta","Erro")
      endif
    endif

    for nI := 3 to len(aArquivo)
      if !__CopyFile(cPastaOrigem + aArquivo[nI][1], cPastaDest+aArquivo[nI][1])
        FwAlertError("Houve um erro ao copiar o Arquivo "+aArquivo[nI][1] ,"Erro")
      endif
    next nI
    FwAlertSuccess('Arquivo(s) copiado(s) com sucesso!', 'Concluido')
  else
    FwAlertInfo('Arquivo não encontrado'+CRLF+'Pasta Origem: '+cPastaOrigem, 'Alerta!')
  endif 
Return
