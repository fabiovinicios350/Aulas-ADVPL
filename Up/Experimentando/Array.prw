#INCLUDE 'TOTVS.CH'

#DEFINE cTITULO 'Algoritimos para pesquisar o dia da semana'

/*/
  @author Fabio
  @since 28/02/2023
/*/

User Function lista05Ex01()
  Local cTituloDlg    := 'Dia da semana'
  Local oDlg
  Local nValor        := 0
  Private aMes        := {'Domingo','Segunda','Terça','Quarta','Quinta','Sexta','Sabado'}
  Private cResultado
  Private cRes

  FwAlertInfo(cTITULO,"Bem vindo!")

  DEFINE MSDIALOG oDlg TITLE cTituloDlg FROM 000, 000 to 210, 180 PIXEL

  @ 14, 10 SAY "Numero que representa um dia semana: " SIZE 70, 07 OF oDlg PIXEL
  @ 22, 10 MSGET nValor SIZE 70, 11 OF oDlg PIXEL PICTURE "@E 9"

  @ 45,010 BUTTON "Pesquisar" SIZE 30, 15 ACTION (Resultado(nValor)) PIXEL OF oDlg 
  @ 45,050 BUTTON "Sair" SIZE 30, 15 ACTION (oDlg:End()) PIXEL OF oDlg 

  @ 075, 30 SAY cResultado SIZE 90, 07 OF oDlg PIXEL
  @ 095, 10 SAY cRes SIZE 90, 07 OF oDlg PIXEL

  ACTIVATE MSDIALOG  oDlg CENTERED
  
Return 


Static Function Resultado(nValor)
  cResultado := 'RESULTADO'

  if(nValor>=1 .and. nValor<=7)
    cRes := 'Dia da semana: '+aMes[nValor]
  else
    cRes := 'Dia da semana invalido!'
  endif

return


