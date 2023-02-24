#INCLUDE 'PROTHEUS.CH'

User Function IntVisual()
  Local cTitulo   := 'Essa e uma janela bacana'
  Local cTexto    := 'CNPJ:'
  Local cCNPJ     := Space(18)
  Local nOpcao    := 0
  Local oDlg

  DEFINE MSDIALOG oDlg TITLE cTitulo FROM 000,000 TO 080,300 PIXEL
  @ 014, 010 SAY cTexto SIZE 55,07 OF oDlg PIXEL
  @ 010, 030 MSGET cCNPJ SIZE 55, 11 OF oDlg PIXEL PICTURE '@R 99.999.999/9999-99'
  DEFINE SBUTTON FROM 010, 120 TYPE 1 ACTION(nOpcao := 1, oDlg:End()) ENABLE OF oDLG
  DEFINE SBUTTON FROM 025, 120 TYPE 2 ACTION(nOpcao := 2, oDlg:End()) ENABLE OF oDLG

  ACTIVATE MSDIALOG oDlg CENTERED

Return 
