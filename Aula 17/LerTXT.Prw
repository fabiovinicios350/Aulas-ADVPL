#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function EscreveTXT
  Função para Ler um arquivo TXT
  @type  Function
  @author Fabio
  @since 24/04/2023
/*/
User Function LerTXT()
  Local cPasta := 'C:\Users\User\Desktop\'
  Local cArquivo := 'Arquivo_Teste.txt'
  Local cTextoLinha := ''
  Local aConteudo := {}
  Local aLinha := {}
  Local oArq := FwFileReader():new(cPasta+cArquivo) //Class para leitura de um arquivo
  Local nCont

  if oArq:Open()
    if !oArq:EOF()
      aConteudo := oArq:GetAllLines()
    endif

    for nCont := 1 to len(aConteudo)
      aLinha := strTokArr(aConteudo[nCont], ';')
      cTextoLinha += aLinha[1]+' - '+aLinha[2]+CRLF
    next nCont

    FwAlertSuccess(cTextoLinha,"Conteudo")
  endif
Return 
