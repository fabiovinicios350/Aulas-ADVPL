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

//Função para simular a  tela de cadasro de login
User Function Ex07List04()

  //Variaveis de entrada
  Local cUserName     :=space(20)
  Local cSenhaUser    :=space(20)
  Local cConfirmaSenha:=space(20)

  //Variaveis globais
  Local cTituloDlg    := 'Cadastro login' 
  Private oDlg

  //Variaveis para apresentar o resultado
  Private cRes
  Private cResultado


  FwAlertInfo(cTITULO,"Bem vindo!")

  DEFINE MSDIALOG oDlg TITLE cTituloDlg FROM 000, 000 to 300, 180 PIXEL

  //Componentes de entrada
  @ 14, 10 SAY "Digite o User Name: " SIZE 70, 07 OF oDlg PIXEL
  @ 22, 10 MSGET cUserName SIZE 70, 11 OF oDlg PIXEL

  @ 45, 10 SAY "Digite a Senha: " SIZE 70, 07 OF oDlg PIXEL
  @ 53, 10 MSGET cSenhaUser SIZE 70, 11 OF oDlg PIXEL PASSWORD

  @ 075, 10 SAY "Digite a novamente Senha: " SIZE 70, 07 OF oDlg PIXEL
  @ 083, 10 MSGET cConfirmaSenha SIZE 70, 11 OF oDlg PIXEL PASSWORD

  @ 105,010 BUTTON "Cadastrar" SIZE 70, 15 ACTION (ValCad(cUserName,cSenhaUser,cConfirmaSenha)) PIXEL OF oDlg 
  @ 130,010 BUTTON "Sair" SIZE 70, 15 ACTION (oDlg:End()) PIXEL OF oDlg 

  ACTIVATE MSDIALOG  oDlg CENTERED
Return 

//Função para validar se o usuario e senha e valido.
Static Function ValCad(cUserName,cSenhaUser,cConfirmaSenha)
  if len(alltrim(cUserName))<=5
    FwAlertError("O UserName precisa contar mais de 5 caracteres","Valor Invalido!")
  elseif (len(alltrim(cSenhaUser))<=5 .or. !ValidaSenha(alltrim(cSenhaUser)))
    cSenhaUser := ""
    FwAlertError("A senha precisa conter:"+CRLF+;
                "Mais de 5 caracter"+CRLF+;
                "Pelo menos uma letra maiuscula"+CRLF+;
                "Um digito numerico e um simbolo"+CRLF,"Senha Invalido!")
  elseif (alltrim(cConfirmaSenha)<>alltrim(cSenhaUser))
      FwAlertError("Senhas diferente, digite a senha correta conforme informado no campo Senha","Valor Invalido!")
  else
    oDlg:End()
    FwAlertSuccess('Usuario Cadastrado','Resultado!')
  endif
return

//Função para verificar se a senha e valida
Static Function ValidaSenha(texto)

    // Variaveis globais
    LOCAL nResultado := .F.
    LOCAL ctexto
    LOCAL nLinha

    //Variaveis para armazenar os caracteres obrigatorios encontrado 
    LOCAL nCEspecial := 0
    LOCAL nNumerico := 0
    LOCAL nMaiusculo := 0
    
    for nLinha:=0 to len(texto)
        ctexto:= SubStr(texto,nLinha+1,1) //Pegar o caracater
        if(ISDIGIT(ctexto)) //Verificar se numerico
          nNumerico++
        elseif((Asc(ctexto)>=35 .and. Asc(ctexto)<=38) .or. (Asc(ctexto)==64) .or. (Asc(ctexto)==169).or. (Asc(ctexto)==184) .or. (Asc(ctexto)>=244 .and. Asc(ctexto)<=245)) //Verificar se e caracter especial
          nCEspecial++
        elseif (ISUPPER(ctexto)) //verificar se e uma letra maiuscula
          nMaiusculo++
        endif
    next nLinha

    if(nNumerico>0 .and. nCEspecial>0 .and. nMaiusculo>0) //validar se esta dentro do esperado
      nResultado := .T.
    endif
Return nResultado

