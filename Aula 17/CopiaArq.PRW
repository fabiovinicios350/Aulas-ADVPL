#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function CopiaArq
  Função para copiar um arquivo
  @type  Function
  @author Fabio
  @since 24/04/2023
/*/
User Function CopiaArq()
  Local cPastaOrigem  := 'C:\Users\User\Desktop\PastaTeste\'
  Local cPastaDestino := '\PastaFabio\'
  Local aArquivo      := Directory(cPastaOrigem + '*.*', 'D',,,1)
  Local nI            := 0

  if len(aArquivo) >0
    for nI := 3 to len(aArquivo)
      if !CpyT2S(cPastaOrigem + aArquivo[nI][1], cPastaDestino)
        FwAlertError("Houve um erro ao copiar o Arquivo "+aArquivo[nI][1] ,"Erro")
      endif
    next nI 
    FwAlertSuccess('Arquivo(s) copiado(s) com sucesso!', 'Concluido')
  else
    FwAlertInfo('Pasta de origem vazia', 'Alerta!')
  endif
Return 
