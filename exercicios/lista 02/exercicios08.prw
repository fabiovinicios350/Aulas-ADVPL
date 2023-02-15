//Bibliotecas
#INCLUDE "TOTVS.CH"

//Constantes5
#DEFINE cTITULO 'Algoritimos '
#DEFINE cUSERNAME 'fabio.vinicios'
#DEFINE CPASSWORD 'fabio1998'

/*/
  @author Fabio
  @since 12/02/2023
/*/

User Function Divisivel23()
  Local lTentar := .T.
  Local cLogin
  Local cSenhaUser

  FwAlertInfo(cTITULO,"Bem vindo!")

  while(lTentar)
    cLogin := FwInputBox('Digite o seu usuario: ',cLogin)
    cSenhaUser := FwInputBox('Digite o seu usuario: ',cSenhaUser)

    if(cLogin==cUSERNAME .and. cSenhaUser==CPASSWORD)
      FwAlertSuccess('Usuario logado','Resultado!')
      lTentar := .F.
    else
      FwAlertError('Usuario ou senha invalido','Resultado!')
      lTentar := MsgyesNo("Deseja tentar novamente? ","Tentar Novamente")
    endif
  enddo

  FwAlertInfo('Fim do algoritimo','Resultado!')
Return
