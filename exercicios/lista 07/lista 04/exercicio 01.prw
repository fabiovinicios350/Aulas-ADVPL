//Biblioteca
#INCLUDE 'TOTVS.CH'

//Constantes
#DEFINE cTITULO 'Algoritimos para definir a Soma, Diferença, produto e quociente entre dois numeros'

/*/
  @author Fabio
  @since 24/02/2023
/*/

//Função para montar a interface
User Function Ex01List04()

  //Variaveis globais
  Local cNumero1    := Space(333)
  Local cNumero2    := Space(333)
  Local cTituloDlg  := 'Soma, Diferença, produto e quociente' 
  Local oDlg

  //Resultado
  Private cTituloRes
  Private cResSoma
  Private cResDiferente
  Private cResProduto
  Private cResQuociente

  FwAlertInfo(cTITULO,"Bem vindo!")

  DEFINE MSDIALOG oDlg TITLE cTituloDlg FROM 000, 000 to 300, 180 PIXEL

  //Receber valores
  @ 14, 10 SAY "Digite o primeiro numero" SIZE 70, 07 OF oDlg PIXEL
  @ 22, 10 MSGET cNumero1 SIZE 70, 11 OF oDlg PIXEL PICTURE'@E 999'
  @ 45, 10 SAY "Digite o segudo numero" SIZE 70, 07 OF oDlg PIXEL
  @ 53, 10 MSGET cNumero2 SIZE 70, 11 OF oDlg PIXEL PICTURE'@E 999'
  @ 075,010 BUTTON "Calcular" SIZE 30, 15 ACTION (Calcular(cNumero1,cNumero2)) PIXEL OF oDlg 
  @ 075,050 BUTTON "Sair" SIZE 30, 15 ACTION (oDlg:End()) PIXEL OF oDlg 

  //Resultado
  @ 100, 30 SAY cTituloResult SIZE 30, 07 OF oDlg PIXEL
  @ 110, 010 SAY cResSoma SIZE 30, 07 OF oDlg PIXEL
  @ 120, 010 SAY cResDiferente SIZE 30, 07 OF oDlg PIXEL
  @ 130, 010 SAY cResProduto SIZE 30, 07 OF oDlg PIXEL
  @ 140, 010 SAY cResQuociente SIZE 90, 07 OF oDlg PIXEL

  ACTIVATE MSDIALOG  oDlg CENTERED
Return 

//Função para fazer os calculos das operações
Static Function Calcular(cValor1,cValor2)
  cTituloResult := 'Resultado'

  if(val(cValor1)>=val(cValor2))
    cResDiferente := "Diferente: "+cValToChar(val(cValor1)-val(cValor2))
    cResQuociente := "Quociente: "+cValToChar(ROUND((val(cValor1)/val(cValor2)),0))
  else
    cResDiferente := "Diferente: "+cValToChar(val(cValor2)-val(cValor1))
    cResQuociente := "Quociente: "+cValToChar(ROUND((val(cValor2)/val(cValor1)),0))
  endif

  cResSoma := "Soma: "+cValToChar(val(cValor1)+val(cValor2))
  cResProduto := "Produto: "+cValToChar(val(cValor1)*val(cValor2))
return
