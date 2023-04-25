#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function LerArq
  Função para ler um arquivo
  @type  Function
  @author Fabio
  @since 25/04/2023
/*/
User Function LerArq()
  Local cCaminho      := 'C:\Users\User\AppData\Local\Temp\Lista 13 - Ex1\'
  Local cNomeArq      := 'arquivo_ex2.txt'
  Local oArq          := FwFileReader():New(cCaminho + cNomeArq)//Class
  Local aConteudo     := {}
  Local aLinha        := {}
  Local cTextoLinha   := ''
  Local nCont

  if oArq:Open()
    if !oArq:EOF()
      aConteudo := oArq:GetAllLines()
    endif

    for nCont := 1 to len(aConteudo)
      aLinha := strTokArr(aConteudo[nCont], ';')
      cTextoLinha += aLinha[1]+CRLF
    next nCont
    FwAlertSuccess(cTextoLinha,"Conteudo")
  endif  
Return 
