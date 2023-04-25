#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function MT410INC
  Ponto de entrada ao gravar um novo pedido
  @type  Function
  @author Fabio
  @since 25/04/2023
/*/
User Function MT410INC()
  Local cNomeArq        := 'LogPed'+M->C5_NUM+'.txt'
  Local oWriter
  Private cCaminho      := 'C:\TOTVS12\Protheus\protheus_data\'
  Private cPasta        := 'Pedido de venda\'
  Private cConteudoLog  := ''
  
  oWriter := FwFileWriter():New(cCaminho+cPasta+cNomeArq, .T.)//Class

  //Verificando a pasta
  if !ExistDir(cCaminho + cPasta)
    if !MakeDir(cCaminho + cPasta)==0
      FwAlertError("Houve um erro na criação da pasta","Erro")
    endif
  endif

  //Imprimindo o PDF
  if ExistBlock('MSVeCha')
    U_MSVeCha()
  else
    FwAlertError("Função U_MSVeCha() não existe ","Erro")
  endif

  //Função para criar o arquivo de log
  if File(cCaminho+cPasta+cNomeArq) //Função para verificar se ja existe o arquivo
    FwAlertInfo('O Arquivo ja existe!','Alerta')
  else
    if oWriter:Create() //Função para verificar se e possivel criar o arquivo
      oWriter:Write(cConteudoLog) //Função para adicionar as informações
      oWriter:Close() //Função para encerrar o arquivo
    else
      FwAlertIError('houve um erro ao gerar o arquivo!' +CRLF+'Erro: '+oWriter:Error():Message,'Erro')
    endif
  endif
Return
