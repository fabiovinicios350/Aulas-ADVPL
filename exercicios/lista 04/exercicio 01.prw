//Biblioteca
#INCLUDE 'TOTVS.CH'

//Constantes
#DEFINE cTITULO 'Algoritimos para definir a Soma, Diferença, produto e quociente entre dois numeros'

/*/
  @author Fabio
  @since 24/02/2023
/*/


User Function Ex01List04()
  Local cNumero1    := Space(333)
  Local cNumero2    := Space(333)
  Local cTituloDlg  := 'Soma, Diferença, produto e quociente' 
  Local oDlg
  Private cSoma
  Private cDiferente
  Private cproduto
  Private cQuociente
  Private cResultado

  FwAlertInfo(cTITULO,"Bem vindo!")

  DEFINE MSDIALOG oDlg TITLE cTituloDlg FROM 000, 000 to 300, 180 PIXEL

  InputDlg("Digite o primeiro Numero: ",@cNumero1,14,10,70,oDlg)
  InputDlg("Digite o Segundo Numero: ",@cNumero2,45,10,70,oDlg)
  @ 075,010 BUTTON "Calcular" SIZE 30, 15 ACTION (Resultado(cNumero1,cNumero2)) PIXEL OF oDlg 
  @ 075,050 BUTTON "Sair" SIZE 30, 15 ACTION (oDlg:End()) PIXEL OF oDlg 
  @ 100, 30 SAY cResultado SIZE 30, 07 OF oDlg PIXEL
  @ 110, 010 SAY cSoma SIZE 30, 07 OF oDlg PIXEL
  @ 120, 010 SAY cDiferente SIZE 30, 07 OF oDlg PIXEL
  @ 130, 010 SAY cproduto SIZE 30, 07 OF oDlg PIXEL
  @ 140, 010 SAY cQuociente SIZE 90, 07 OF oDlg PIXEL

  ACTIVATE MSDIALOG  oDlg CENTERED

Return 

Static Function Resultado(cValor1,cValor2)

  cResultado := 'Resultado'
  

  if(val(cValor1)>=val(cValor2))
    cDiferente := "Diferente: "+cValToChar(val(cValor1)-val(cValor2))
    cQuociente := "Quociente: "+cValToChar(ROUND((val(cValor1)/val(cValor2)),0))
  else
    cDiferente := "Diferente: "+cValToChar(val(cValor2)-val(cValor1))
    cQuociente := "Quociente: "+cValToChar(ROUND((val(cValor2)/val(cValor1)),0))
  endif


  cSoma := "Soma: "+cValToChar(val(cValor1)+val(cValor2))
  cProduto := "Produto: "+cValToChar(val(cValor1)*val(cValor2))
return


Static Function InputDlg(cTexto,cValor,nPosInicio,nMargem,nLargura,oComponente)
  @ nPosInicio, nMargem SAY cTexto SIZE nLargura, 07 OF oComponente PIXEL
  @ nPosInicio+8, nMargem MSGET cValor SIZE nLargura, 11 OF oComponente PIXEL PICTURE'@E 999'
Return 
