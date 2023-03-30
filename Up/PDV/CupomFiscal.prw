//Biblioteca
#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

//Constantes
#DEFINE cTITULO 'Algoritimo para Emitir o cupom'
#DEFINE cTITULOCUPOMDLG 'Cupom Fiscal' 

//Cor
#DEFINE COR_FUNDO_PADRAO_CUPOM RGB(175,175,175)
#DEFINE CLR_TEXTO_CUPOM RGB(129,129,129)

/*/
  @author Fabio
  @since 03/03/2023
/*/

//Função que Mostrar o resumo da venda
User Function CupomPDV()

  //CSS
  Local cCssDlgCupom :=;
  "TGroup {"+;
    "background: #F0F0F0;"+;
    "border: none;"+;
    "border-radius: 8px;"+; 
    "box-shadow: 10px 10px;"+;
  "}"+;
  "QLabel {"+;
    "background: #F0F0F0;"+;
    "border: none;"+;
    "font: normal 16px Arial;"+;
    "color: #626262;"+;
  "}"+;
  "QLineEdit {"+;
    "background: #fff;"+;
    "font: normal 16px Arial;"+;
    "border: none;"+;
    "border-radius: 8px;"+; 
    "color: #A5A5A5;"+;
  "}"+;
  "QPushButton {"+;
    "background: #fff;"+;
    "color: #818181;"+;
    "border: none;"+;
    "border-radius: 8px;"+; 
    "font: normal 18px Arial;"+;
  "}"+;
  "QTableView {"+;
    "background: #fff;"+;
    "color: #888888;"+;
    "border: none;"+;
    "font: normal 13px Arial;"+;
  "}"
  //Variaveis Globais


  //Conexão com o banco de dados
  PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SB1' MODULO 'COM'

  //Janela de finalizar
  oJanelaFimDlg := TDialog():New(0,0,644,1274,cTITULOCUPOMDLG,,,,,CLR_TEXTO_CUPOM,COR_FUNDO_PADRAO_CUPOM,,,.T.)
  oJanelaFimDlg:SetCss( cCssDlgCupom )
  
  oTituloApagar := TSay():New(35,235,{||""},oJanelaFimDlg,,,,,,.T.,,,160,10,,,,,,.T.,2,2)
  
  oGrupo := TGroup():New(25,227,300,402,,oJanelaFimDlg,,,.T.)

  oJanelaFimDlg:Activate(,,,,,,)
Return 
