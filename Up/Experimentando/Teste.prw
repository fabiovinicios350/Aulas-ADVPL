#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

User Function Testefabio()

 //Constantes
  #DEFINE cTITULO 'Algoritimo para simular um PDV'
  #DEFINE cTITULODLG 'TOTVS PDV' 

  Local cCssDlg:=;
  "QTableView {"+;
    "border: none;"+;
    "background: #fff;"+;
  "}"
  
  //Cor
  #DEFINE COR_FUNDO_PADRAO RGB(216,216,216)
  #DEFINE CLR_TEXTO RGB(136,136,136)
  Private oDlg
  Private aArray := {{"0001", "Produto 1","5" ,"10,50"}}
  Private nCount := 0

  oDlg := TDialog():New(0,0,644,1274,cTITULODLG,,,,,CLR_TEXTO,COR_FUNDO_PADRAO,,,.T.)
  // oDlg := TWindow():New(0, 0, 644, 1274, "Exemplo TWindow",,,,,,,,CLR_TEXTO, COR_FUNDO_PADRAO,,,,,,, .T. )

  oTable  := TGrid():New( oDlg, 10, 10, 300, 300)
  oTable:SetCss( cCssDlg )
  oTable:lShowGrid:=.F.
  oTable:ScrollLines(50)

  oTable:AddColumn( 1, "Código", 50, 0 )
  oTable:AddColumn( 1, "Descr", 50, 0 )
  oTable:AddColumn( 1, "quant", 50, 0 )
  oTable:AddColumn( 1, "Valor", 50, 0 )
  
  oFinalizar := TButton():New( 235, 177, "Finalizar",oDlg,{||Test0312()}, 85,25,,,.F.,.T.,.F.,,.F.,,,.F. )

  oDlg:Activate()
Return  

static Function Test0312()
  oTable:setRowData( nCount, {|o| {cValToChar(nCount), "Produto "+cValToChar(nCount),"5" ,"10,50"} } )
  oTable:setRowColor( nCount, RGB(0,0,0), RGB(255,255,255))
  
return
