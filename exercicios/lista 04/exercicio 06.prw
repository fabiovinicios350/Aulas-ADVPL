//Biblioteca
#INCLUDE 'TOTVS.CH'

//Constantes
#DEFINE cTITULO 'Algoritimos para simular a Tela de login.'
#DEFINE cLOGIN 'fabio.vinicios'
#DEFINE cPASSWORD 'fabio1998'

/*/
  @author Fabio
  @since 24/02/2023
/*/


User Function Ex06List04()
  Local cUserName     :=space(20)
  Local cSenhaUser    :=space(20)
  Local cTituloDlg    := 'Login' 
  Private oDlg
  Private cRes
  Private cResultado


  FwAlertInfo(cTITULO,"Bem vindo!")

  DEFINE MSDIALOG oDlg TITLE cTituloDlg FROM 000, 000 to 260, 180 PIXEL


  @ 14, 10 SAY "Digite o User Name: " SIZE 70, 07 OF oDlg PIXEL
  @ 22, 10 MSGET cUserName SIZE 70, 11 OF oDlg PIXEL

  @ 45, 10 SAY "Digite a Senha: " SIZE 70, 07 OF oDlg PIXEL
  @ 53, 10 MSGET cSenhaUser SIZE 70, 11 OF oDlg PIXEL PASSWORD

  @ 075,010 BUTTON "Entrar" SIZE 70, 15 ACTION (Resultado(cUserName,cSenhaUser)) PIXEL OF oDlg 
  @ 100,010 BUTTON "Sair" SIZE 70, 15 ACTION (ReoDlg:End()) PIXEL OF oDlg 


  ACTIVATE MSDIALOG  oDlg CENTERED

Return 

Static Function Resultado(cUserName,cSenhaUser)

  if(ALLTRIM(cUserName)==cLOGIN .and. ALLTRIM(cSenhaUser)==cPASSWORD)
    FwAlertSuccess("Usuario Logado ","Login correto!")
    oDlg:End()
  else
    FwAlertError("Senha/UserName Invalida!","Falha no login")
  endif

  

return
