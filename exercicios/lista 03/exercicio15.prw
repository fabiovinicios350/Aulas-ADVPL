//Bibliotecas
#INCLUDE "TOTVS.CH"

//Constantes5
#DEFINE cTITULO 'Algoritimos para informar a temperatura media dos meses '

/*/
  @author Fabio
  @since 12/02/2023
/*/

User Function ExibeMediaMes()
  Local aMes      := {}
  Local lTentar   := .T.
  Local nMedia    :=0
  Local cMensagem := ''
  Local cNumero
  Local nI
  
  FwAlertInfo(cTITULO,"Bem vindo!")
  
  while(lTentar)
    nMedia := 0
    aMes := {}

    for nI:=1 to 12
      cNumero := ''
      U_FwInputBoxVal(@cNumero,'N','Digite a temperatura do mes '+MesExtenso(nI)+' em graus celsius: ')
      aadd(aMes,{MesExtenso(nI),cNumero})
      nMedia += cNumero
    next 

    nMedia := nMedia/12
    cMensagem := "Media anual: "+cValToChar(nMedia)+CRLF+CRLF
    cMensagem += "-------------------------------------------------------------"+CRLF
    cMensagem += "<b>Meses com acima da media:</b>"+CRLF

    for nI:=1 to len(aMes)
      if(aMes[nI][2]>nMedia)
        cMensagem += aMes[nI][1]+': '+cValToChar(aMes[nI][2])+CRLF
      endif
    next 

    cMensagem += "-------------------------------------------------------------"

    FwAlertSuccess(cMensagem,'Resultado!')
    lTentar := MsgyesNo("Deseja tentar novamente? ","Tentar Novamente")
  enddo

  FwAlertInfo('Fim do algoritimo','Resultado!')
Return
