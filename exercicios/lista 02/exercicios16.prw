//Bibliotecas
#INCLUDE "TOTVS.CH"

//Constantes5
#DEFINE cTITULO 'Algoritimos para efetuar o cadastro de login de um usuario'

/*/
  @author Fabio
  @since 12/02/2023
/*/

User Function CadastroLogin()
  Local lTentar       := .T.
  Local cUserName
  Local cSenhas
  Local cConfirmaSenha

  while(lTentar)
    FwAlertInfo(cTITULO,"Bem vindo!")

    cUserName :=FwInputBox('Digite um UserName: ',cUserName)

    while (len(cUserName)<=5)
      cUserName := ""
      FwAlertError("O UserName precisa contar mais de 5 caracteres","Valor Invalido!")
      cUserName := FwInputBox('Digite um UserName: ',cUserName)
    ENDDO

    cSenhas := FwInputBox('Digite uma senha: ',cSenhas)
    while (len(cSenhas)<=5 .or. !ValidaSenha(cSenhas))
      cSenhas := ""
      FwAlertError("A senha precisa conter:"+CRLF+;
                  "Mais de 5 caracter"+CRLF+;
                  "Pelo menos uma letra maiuscula"+CRLF+;
                  "Um digito numerico e um simbolo"+CRLF,"Senha Invalido!")
      cSenhas :=FwInputBox('Digite um UserName: ',cSenhas)
    ENDDO

    cConfirmaSenha := FwInputBox('Digite a senha novamente: ',cConfirmaSenha)
    while (cConfirmaSenha<>cSenhas)
      cConfirmaSenha := ""
      FwAlertError("Senhas diferente, digite a senha correta conforme informado no campo Senha","Valor Invalido!")
      cConfirmaSenha := FwInputBox('Digite a senha novamente: ',cConfirmaSenha)
    ENDDO

    FwAlertSuccess('Usuario Cadastrado','Resultado!')
    lTentar := MsgyesNo("Deseja tentar novamente? ","Tentar Novamente")
  enddo

  FwAlertInfo('Fim do algoritimo','Resultado!')
Return




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
