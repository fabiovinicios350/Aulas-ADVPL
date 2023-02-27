//Biblioteca
#INCLUDE 'TOTVS.CH'

//Constantes
#DEFINE cTITULO 'Algoritimos para simular a tela de cadastro.'
#DEFINE cLOGIN 'fabio.vinicios'
#DEFINE cPASSWORD 'fabio1998'

/*/
  @author Fabio
  @since 24/02/2023
/*/


User Function Ex07List04()
  Local cUserName     :=space(20)
  Local cSenhaUser    :=space(20)
  Local cConfirma   :=space(20)
  Local cTituloDlg    := 'Cadastro login' 
  Private oDlg
  Private cRes
  Private cResultado


  FwAlertInfo(cTITULO,"Bem vindo!")

  DEFINE MSDIALOG oDlg TITLE cTituloDlg FROM 000, 000 to 300, 180 PIXEL


  @ 14, 10 SAY "Digite o User Name: " SIZE 70, 07 OF oDlg PIXEL
  @ 22, 10 MSGET cUserName SIZE 70, 11 OF oDlg PIXEL

  @ 45, 10 SAY "Digite a Senha: " SIZE 70, 07 OF oDlg PIXEL
  @ 53, 10 MSGET cSenhaUser SIZE 70, 11 OF oDlg PIXEL PASSWORD

  @ 075, 10 SAY "Digite a novamente Senha: " SIZE 70, 07 OF oDlg PIXEL
  @ 083, 10 MSGET cConfirma SIZE 70, 11 OF oDlg PIXEL PASSWORD

  @ 105,010 BUTTON "Cadastrar" SIZE 70, 15 ACTION (Resultado(cUserName,cSenhaUser,cConfirma)) PIXEL OF oDlg 
  @ 130,010 BUTTON "Sair" SIZE 70, 15 ACTION (oDlg:End()) PIXEL OF oDlg 


  ACTIVATE MSDIALOG  oDlg CENTERED

Return 

Static Function Resultado(cUserName,cSenhaUser,cConfirma)
  if len(alltrim(cUserName))<=5
    FwAlertError("O UserName precisa contar mais de 5 caracteres","Valor Invalido!")
  elseif (len(alltrim(cSenhaUser))<=5 .or. !ValidaSenha(alltrim(cSenhaUser)))
    cSenhaUser := ""
    FwAlertError("A senha precisa conter:"+CRLF+;
                "Mais de 5 caracter"+CRLF+;
                "Pelo menos uma letra maiuscula"+CRLF+;
                "Um digito numerico e um simbolo"+CRLF,"Senha Invalido!")
  elseif (alltrim(cConfirma)<>alltrim(cSenhaUser))
      FwAlertError("Senhas diferente, digite a senha correta conforme informado no campo Senha","Valor Invalido!")
  else
    oDlg:End()
    FwAlertSuccess('Usuario Cadastrado','Resultado!')
  endif
return



Static Function ValidaSenha(texto)
    LOCAL nResultado := .F.
    LOCAL ctexto
    LOCAL i
    LOCAL nCEspecial := 0
    LOCAL nNumerico := 0
    LOCAL nMaiusculo := 0
    
    for i:=0 to len(texto)
        ctexto:= SubStr(texto,i+1,1)
        if(ISDIGIT(ctexto))
          nNumerico++
        elseif((Asc(ctexto)>=35 .and. Asc(ctexto)<=38) .or. (Asc(ctexto)==64) .or. (Asc(ctexto)==169).or. (Asc(ctexto)==184) .or. (Asc(ctexto)>=244 .and. Asc(ctexto)<=245))
          nCEspecial++
        elseif (ISUPPER(ctexto))
          nMaiusculo++
        endif
    next i

    if(nNumerico>0 .and. nCEspecial>0 .and. nMaiusculo>0)
      nResultado := .T.
    endif
Return nResultado

