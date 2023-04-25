#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function EscreveTXT
  Função para criar um arquivo TXT
  @type  Function
  @author Fabio
  @since 24/04/2023
/*/
User Function EscreveTXT()
  Local cPasta := PARAMIXB
  Local cArquivo := 'Arquivo_Teste.txt'
  Local oWriter := FwFileWriter():new(cPasta+cArquivo, .T.)//Class
  Local cConteudo := ''

  if File(cPasta+cArquivo) //Função para verificar se ja existe o arquivo
    FwAlertInfo('O arquivo ja existe','Atenção')
  else
    if oWriter:Create() //Função para verificar se e possivel criar o arquivo
      
      cConteudo+='Fabio; 18 '+CRLF
      cConteudo+='Lucas; 22 '+CRLF
      cConteudo+='Gabi; 20 '+CRLF
      cConteudo+='Natan; 25 '+CRLF
      oWriter:Write(cConteudo) //Função para adicionar as informações
      oWriter:Close() //Função para encerrar o arquivo
      if MsgyesNo("Deseja abirr o arquivo ?","Alerta!")	
        ShellExecute("OPEN", cArquivo, '', cPasta, 1) //Função para Abrir o arquivo
      endif
    else
      FwAlertIError('houve um erro ao gerar o arquivo!' +CRLF+'Erro: '+oWriter:Error():Message,'Erro')
    endif

  endif

  
Return 
