//Bibliotecas
#INCLUDE "TOTVS.CH"

//Constantes5
#DEFINE cTITULO 'Algoritimos para mostar a quantidade de dias do mes informado'

/*/
  @author Fabio
  @since 12/02/2023
/*/

User Function ExibeMes()
  Local aMes      := {{"Janeiro",31},{"Fevereiro",28},{"Março",31},{"Abril",30},{"Maio",31},{"Junho",30},{"Julho",31},{"Agosto",31},{"Setembro",30},{"Outubro",31},{"Novembro",30},{"Dezembro",31}}
  Local lTentar   := .T.
  Local cNumero
  
  FwAlertInfo(cTITULO,"Bem vindo!")

  while(lTentar)
    cNumero := ''
    cNumero := FwInputBox('Digite um numero correspondente a um mes: ',cNumero)
    while(val(cNumero)<1 .OR. val(cNumero)>12)
      cNumero := ''
      FwAlertError("O valor informado nao corresponde a um mes","Valor Invalido!")
      cNumero := FwInputBox('Digite um numero correspondente a um mes: ',cNumero)
    enddo
    cNumero := val(cNumero)

    FwAlertSuccess('O Numero '+cValToChar(cNumero)+' corresponde ao mes de '+aMes[cNumero][1]+' com '+cValToChar(aMes[cNumero][2])+' dias.','Resultado!')
    lTentar := MsgyesNo("Deseja tentar novamente? ","Tentar Novamente")
  enddo

  FwAlertInfo('Fim do algoritimo','Resultado!')
Return
