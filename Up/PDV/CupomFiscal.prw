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
    "font: normal 11px Arial;"+;
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
  Local cCupom    := ''+;
  '<table border="1">'+;
    '<tr>'+;
      '<td width="80" colspan="2" style="text-align: center;">Logo</td>'+;
      '<td width="100" colspan="5">Camel Case LTDA<br>Rua da Fortuna 289<br>JD Aricanduva São Paulo</td>'+;
    '</tr>'+;
    '<tr>'+;
      '<td height="10" colspan="7"></td>'+;
    '</tr>'+;
    '<tr>'+;
      '<td colspan="3">CNPJ: 43.324.756/0002-65</td>'+;  
      '<td colspan="4" style="text-align: right;">IE: 388.108.598.269</td>'+;
    '</tr>'+;
    '<tr>'+;
      '<td colspan="7">---------------------------------------------------------------------------------------</td>'+;
    '</tr>'+;
    '<tr>'+;
      '<td colspan="7" style="text-align: center;"><b>Extrato No 876578<br>CUPOM FISCAL ELETRONICO-SAT</b></td>'+;
    '</tr>'+;
    '<tr>'+;
      '<td colspan="7">---------------------------------------------------------------------------------------</td>'+;
    '</tr>'+;
    '<tr>'+;
      '<td colspan="7" style="text-align: left;">Nome do Consumidor: Valdecir Farias<br>CPF/CNPJ do consumidor: 153.756.534-34</td>'+;
    '</tr>'+;
    '<tr>'+;
      '<td colspan="7">---------------------------------------------------------------------------------------</td>'+;
    '</tr>'+;
    '<tr>'+;
      '<td style="text-align: center;">COD |</td>'+;
      '<td style="text-align: center;">DESC |</td>'+;
      '<td style="text-align: center;">QTD |</td>'+;
      '<td style="text-align: center;">UN |</td>'+;
      '<td style="text-align: center;">VL UNIT </td>'+;
      '<td style="text-align: center;">| ALIQ |</td>'+;
      '<td style="text-align: center;">VL ITEM</td>'+;
    '</tr>'+;
    '<tr>'+;
      '<td colspan="7">---------------------------------------------------------------------------------------</td>'+;
    '</tr>'+;
    '<tr>'+;
      '<td width="50" style="text-align: left;" colspan="6">C00001 - Coca Cola 350 ML - 2 LT X 10,00 - 18% teste teste teste teste teste</td>'+;
      '<td style="text-align: Right;">20,00</td>'+;
    '</tr>'+;
    '<tr>'+;
      '<td width="50" style="text-align: left;" colspan="6">C00002 - Agua Mineral 510 ML - LT X 2,50 - 18% teste teste teste teste teste</td>'+;
      '<td style="text-align: Right;">20,00</td>'+;
    '</tr>'+;
    '<tr>'+;
      '<td width="50" style="text-align: left;" colspan="6">C00002 - Agua Mineral 510 ML - LT X 2,50 - 18% teste teste teste teste teste</td>'+;
      '<td style="text-align: Right;">20,00</td>'+;
    '</tr>'+;
    '<tr>'+;
      '<td width="50" style="text-align: left;" colspan="6">C00002 - Agua Mineral 510 ML - LT X 2,50 - 18% teste teste teste teste teste</td>'+;
      '<td style="text-align: Right;">20,00</td>'+;
    '</tr>'+;
    '<tr>'+;
      '<td width="50" style="text-align: left;" colspan="6">C00002 - Agua Mineral 510 ML - LT X 2,50 - 18% teste teste teste teste teste</td>'+;
      '<td style="text-align: Right;">20,00</td>'+;
    '</tr>'+;
    '<tr>'+;
      '<td width="50" style="text-align: left;" colspan="6">C00002 - Agua Mineral 510 ML - LT X 2,50 - 18% teste teste teste teste teste</td>'+;
      '<td style="text-align: Right;">20,00</td>'+;
    '</tr>'+;
    '<tr>'+;
      '<td width="50" style="text-align: left;" colspan="6">C00002 - Agua Mineral 510 ML - LT X 2,50 - 18% teste teste teste teste teste</td>'+;
      '<td style="text-align: Right;">20,00</td>'+;
    '</tr>'+;
    '<tr>'+;
      '<td height="30" colspan="7"></td>'+;
    '</tr>'+;
    '<tr>'+;
      '<td colspan="2">SubTotal</td>'+;    
      '<td colspan="5" style="text-align: Right;">22,50</td>'+;
    '</tr>'+;
    '<tr>'+;
      '<td colspan="2"><b>Desconto</b></td>'+;    
      '<td colspan="5" style="text-align: Right;"><b>00,00</b></td>'+;
    '</tr>'+;
    '<tr>'+;
      '<td colspan="2"><b>TOTAL R$</b></td>'+;    
      '<td colspan="5" style="text-align: Right;"><b>22,50</b></td>'+;
    '</tr>'+;
    '<tr>'+;
      '<td height="30" colspan="7"></td>'+;
    '</tr>'+;
    '<tr>'+;
      '<td colspan="2">Dinheiro R$</td>'+;    
      '<td colspan="5" style="text-align: Right;">25,00</td>'+;
    '</tr>'+;
    '<tr>'+;
      '<td colspan="2"><b>Troco R$</b></td>'+;    
      '<td colspan="5" style="text-align: Right;"><b>2,50</b></td>'+;
    '</tr>'+;
    '<tr>'+;
      '<td height="30" colspan="7"></td>'+;
    '</tr>'+;
    '<tr>'+;
      '<td colspan="7">---------------------------------------------------------------------------------------------</td>'+;
    '</tr>'+;
    '<tr>'+;
      '<td colspan="7" style="text-align: center;"><b>SAT No. 000.000.027</b><br>03/03/2023 - 14:57</td>
    '</tr>'+;
    '<tr>'+;
      '<td colspan="7">---------------------------------------------------------------------------------------------</td>'+;
    '</tr>'+;
    '<tr>'+;
      '<td height="30" colspan="7"></td>'+;
    '</tr>'+;
    '<tr>'+;
      '<td style="text-align: center;" colspan="7">CODIGO DE BARRA</td>'+;
    '</tr>'+;
    '<tr>'+;
      '<td height="30" colspan="7"></td>'+;
    '</tr>'+;
    '<tr>'+;
      '<td style="text-align: center;" colspan="7">QRCODE</td>'+;
    '</tr>'+;
  '</table>'

  //Conexão com o banco de dados
  PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SB1' MODULO 'COM'

  //Janela de finalizar
  oJanelaFimDlg := TDialog():New(0,0,644,1274,cTITULOCUPOMDLG,,,,,CLR_TEXTO_CUPOM,COR_FUNDO_PADRAO_CUPOM,,,.T.)
  oJanelaFimDlg:SetCss( cCssDlgCupom )

  oScroll := TScrollArea():New(oJanelaFimDlg,30,230,270,190)
  
  oCupom := TSay():New(01,01,{|| cCupom},oJanelaFimDlg,,,,,,.T.,,,165,280,,,,,,.T.,2,2)
  
  oScroll:SetFrame( oCupom )
  oGrupo := TGroup():New(25,227,300,422,,oJanelaFimDlg,,,.T.)

  oJanelaFimDlg:Activate(,,,,,,)
Return 
