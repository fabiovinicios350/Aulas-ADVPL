#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function EscreveTXT
  Fun��o para criar um arquivo TXT
  @type  Function
  @author Fabio
  @since 24/04/2023
/*/
User Function EscreveTXT()
  Local cPasta := PARAMIXB
  Local cArquivo := 'Arquivo_Teste.txt'
  Local oWriter := FwFileWriter():new(cPasta+cArquivo, .T.)//Class
  Local cConteudo := ''

  if File(cPasta+cArquivo) //Fun��o para verificar se ja existe o arquivo
    FwAlertInfo('O arquivo ja existe','Aten��o')
  else
    if oWriter:Create() //Fun��o para verificar se e possivel criar o arquivo
      
      cConteudo+='Fabio; 18 '+CRLF
      cConteudo+='Lucas; 22 '+CRLF
      cConteudo+='Gabi; 20 '+CRLF
      cConteudo+='Natan; 25 '+CRLF
      oWriter:Write(cConteudo) //Fun��o para adicionar as informa��es
      oWriter:Close() //Fun��o para encerrar o arquivo
      if MsgyesNo("Deseja abirr o arquivo ?","Alerta!")	
        ShellExecute("OPEN", cArquivo, '', cPasta, 1) //Fun��o para Abrir o arquivo
      endif
    else
      FwAlertIError('houve um erro ao gerar o arquivo!' +CRLF+'Erro: '+oWriter:Error():Message,'Erro')
    endif

  endif

  
Return 
