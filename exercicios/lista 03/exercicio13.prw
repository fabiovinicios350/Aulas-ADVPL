//Bibliotecas
#INCLUDE "TOTVS.CH"

//Constantes5
#DEFINE cTITULO 'Algoritimos para mostar o Dia da semana'

/*/
  @author Fabio
  @since 12/02/2023
/*/

User Function ExibirSemana()
  Local aSemana      := {"Domingo", "Segunda", "Terça", "Quarta", "Quinta", "Sexta", "Sabado"}
  Local lTentar   := .T.
  Local cNumero
  
  FwAlertInfo(cTITULO,"Bem vindo!")

  while(lTentar)
    cNumero := ''
    cNumero := FwInputBox('Digite um numero correspondente a o dia da semana: ',cNumero)
    while(val(cNumero)<1 .OR. val(cNumero)>7)
      cNumero := ''
      FwAlertError("O valor informado nao corresponde a um dia da semana","Valor Invalido!")
      cNumero := FwInputBox('Digite um numero correspondente a o dia da semana: ',cNumero)
    enddo
    cNumero := val(cNumero)

    FwAlertSuccess('O Numero '+cValToChar(cNumero)+' corresponde a '+aSemana[cNumero],"Retorno")
    lTentar := MsgyesNo("Deseja tentar novamente? ","Tentar Novamente")
  enddo

  FwAlertInfo('Fim do algoritimo','Resultado!')
Return
