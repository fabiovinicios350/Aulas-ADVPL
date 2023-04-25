#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function EscreverArq
  Função para criar um arquivo
  @type  Function
  @author Fabio
  @since 25/04/2023
/*/
User Function EscreverArq()
  Local cCaminho  := 'C:\Users\User\AppData\Local\Temp\Lista 13 - Ex1\'
  Local cNomeArq  := 'arquivo_ex2.txt'
  Local oWriter   := FwFileWriter():New(cCaminho + cNomeArq, .T.)//Class
  Local cConteudo := ''

  if File(cCaminho + cNomeArq) //Função para verificar se ja existe o arquivo
    FwAlertInfo('O Arquivo ja existe!','Alerta')
  else
    if oWriter:Create() //Função para verificar se e possivel criar o arquivo
      cConteudo += 'Esse e um texto qualquer'
      oWriter:Write(cConteudo) //Função para adicionar as informações
      oWriter:Close() //Função para encerrar o arquivo
      if MsgyesNo("Deseja abrir o arquivo ?","Alerta")
        ShellExecute("OPEN", cNomeArq, '', cCaminho, 1) //Função para Abrir o arquivo
      endif
    else
      FwAlertIError('houve um erro ao gerar o arquivo!' +CRLF+'Erro: '+oWriter:Error():Message,'Erro')
    endif
  endif
Return 
