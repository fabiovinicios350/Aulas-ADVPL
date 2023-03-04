#INCLUDE 'TOTVS.CH'

/*/
  @author Fabio
  @since 03/03/2023
/*/

//Função para a criação dos componentes da Home
User Function HomePdv()

  //Constantes
  #DEFINE cTITULO 'Algoritimo para simular um PDV'
  #DEFINE cTITULODLG 'TOTVS PDV' 
  //Cor
  #DEFINE COR_FUNDO_PADRAO RGB(216,216,216)
  #DEFINE CLR_TEXTO RGB(136,136,136)

  //CSS
  Local cCssDlg :=;
  "TGroup {"+;
    "background: #fff;"+;
    "border: none;"+;
    "border-radius: 8px;"+; 
    "box-shadow: 10px 10px;"+;
  "}"+;
  "QLineEdit {"+;
    "background: #fff;"+;
    "border: none;"+;
    "color: #A5A5A5;"+;
    "font: normal 20px Arial;"+;
  "}"


  //Variaveis
  Local cCodProduto   := space(16)
  Local oDlg

  oDlg := TDialog():New(0,0,644,1274,cTITULODLG,,,,,CLR_TEXTO,COR_FUNDO_PADRAO,,,.T.)
  oDlg:SetCss( cCssDlg )
  
  //Logo
  oLogoTotvs := TBitmap():New(12,12, 152, 065, NIL, "C:\Users\User\Desktop\ADVPL\teste-git\Up\PDV\img\logo-totvs.jpeg", .T., oDlg,;
        , NIL, .F., .F., NIL, NIL, .F., NIL, .T., NIL, .F.)
  oLogo:= TGroup():New(07,07,82,169,,oDlg,,,.T.)

  //Pesquisa
  oGetPesquisa := TGet():New( 92,37,{||cCodProduto},oDlg,125,15,"@!",,0,,,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,cCodProduto)
  oGetPesquisa:cPlaceHold := 'Pesquisa Produto...'

  oPesquisa:= TGroup():New(90,07,110,169,,oDlg,,,.T.)

  oProduto:= TGroup():New(117,7,314,169,,oDlg,,,.T.)

  oListaProduto:= TGroup():New(7,177,229,632,,oDlg,,,.T.)

  oResumo:= TGroup():New(265,418,317,633,,oDlg,,,.T.)


  oDlg:Activate(,,,,,,)
Return 
