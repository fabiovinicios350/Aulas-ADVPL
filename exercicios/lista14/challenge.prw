#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'

//Posições do Excel
#DEFINE nPosCodigo  1 //Coluna A no Excel (Codigo)
#DEFINE nPosDesc    2 //Coluna B no Excel (Descricao)
#DEFINE nPosTipo    3 //Coluna C no Excel (Tipo)
#DEFINE nPosUn      4 //Coluna D no Excel (Unid. Med.)
#DEFINE nPosPreco   5 //Coluna E no Excel (Preco Venda)
#DEFINE nPosAtivo   6 //Coluna F no Excel (Ativo/Inativo)

/*/
  {Protheus.doc} User Function execProd
  (Função para registrar as informações da planilha em csv no banco de dados)
  @type  Function
  @author Fabio
  @since 22/05/2023
/*/
User Function execProd()
  Local aArea     := GetArea()
  Private cArqOri := ""

  //Mostra o Prompt para selecionar arquivos
  cArqOri := tFileDialog( "CSV files (*.csv) ", 'Seleção de Arquivos', , , .F., )
    
  //Se tiver o arquivo de origem
  If !Empty(cArqOri)
      //Somente se existir o arquivo e for com a extensão CSV
      If File(cArqOri) .And. Upper(SubStr(cArqOri, RAt('.', cArqOri) + 1, 3)) == 'CSV'
          Processa({|| fImporta() }, "Importando...")
      Else
          MsgStop("Arquivo e/ou extensão inválida!", "Atenção")
      EndIf
  EndIf
  RestArea(aArea)
Return 

//Lendo o arquivo
Static Function fImporta()
  Local aArea      := GetArea()
  Local nTotLinhas := 0
  Local cLinAtu    := ""
  Local nLinhaAtu  := 0
  Local aLinha     := {}
  Local oArquivo

  Private cCodProd   := ""
  Private cDescrProd := ""
  Private cTipoProd  := ""
  Private cUnProd    := ""
  Private cPrecoProd := ""
  
  oArquivo := FWFileReader():New(cArqOri)//Definindo o arquivo a ser lido
    
  If (oArquivo:Open())//Se o arquivo pode ser aberto
    If !(oArquivo:EoF())//Se não for fim do arquivo
      nTotLinhas := Len(oArquivo:GetAllLines())//Quantidade de linhas no arquivos
      ProcRegua(nTotLinhas)
        
      //Método GoTop não funciona (dependendo da versão da LIB), deve fechar e abrir novamente o arquivo
      oArquivo:Close()
      oArquivo := FWFileReader():New(cArqOri)
      oArquivo:Open()
      
      While (oArquivo:HasLine())//Enquanto tiver linhas
        nLinhaAtu++
        IncProc("Analisando linha " + cValToChar(nLinhaAtu) + " de " + cValToChar(nTotLinhas) + "...")
          
        //Pegando a linha atual e transformando em array
        cLinAtu := oArquivo:GetLine()
        aLinha  := StrTokArr(cLinAtu, ";")
          
        //Se não for o cabeçalho (encontrar o texto "Código" na linha atual)
        If ("codigo" <> Lower(aLinha[nPosCodigo])) .and. (ASC(aLinha[nPosAtivo])<>65)
          cCodProd   := aLinha[nPosCodigo]
          cDescrProd := aLinha[nPosDesc]
          cTipoProd  := aLinha[nPosTipo]
          cUnProd    := aLinha[nPosUn]
          cPrecoProd := val(aLinha[nPosPreco])

          IncProd()
        EndIf
      EndDo
      Else
          MsgStop("Arquivo não tem conteúdo!", "Atenção")
    EndIf

    //Fecha o arquivo
    oArquivo:Close()
  Else
      MsgStop("Arquivo não pode ser aberto!", "Atenção")
  EndIf
    RestArea(aArea)
Return


//Inclusao de produtos por rotina automatica
static Function IncProd()
  Local aVetor := {}
  Local nOper  := 3
  Private lMsErroAuto := .F.
  
  PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' MODULO 'COM'
  
  //Adicionando dados ao Array
  Aadd(aVetor, {'B1_FILIAL', xFilial('SB1'), NIL})
  Aadd(aVetor, {'B1_COD', cCodProd, NIL})
  Aadd(aVetor, {'B1_DESC' ,cDescrProd, NIL})
  Aadd(aVetor, {'B1_TIPO', cTipoProd, NIL})
  Aadd(aVetor, {'B1_UM', cUnProd, NIL})
  AADD(aVetor, {'B1_LOCPAD' , '01', nil})
  Aadd(aVetor, {'B1_PRV1', cPrecoProd, NIL})
  
  //Executa a rotina automatica  
  MSExecAuto({|x, y| MATA030(x, y)}, aVetor, nOper) //nOper = 3 - operacao de inclusao

  //Se houver algum erro
  if lMsErroAuto
    MostraErro()
  endif
Return


