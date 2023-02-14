//Bibliotecas
#INCLUDE "TOTVS.CH"

/*/
  @author Fabio
  @since 12/02/2023
/*/

User Function CalculaMediaAluno()
  Local nNota01
  Local nNota02
  Local nMedia

  FwAlertInfo("Algoritimos para calcular a media de um aluno","Bem vindo!")

  CalculaMedia(@nNota01)
  CalculaMedia(@nNota02)

  nMedia := (val(nNota01)+val(nNota02))/2

  FwAlertSuccess('A sua media foi: '+cValToChar(nMedia),'Resultado!')
Return 


Static Function CalculaMedia(nValor)
  U_RecebeInput(@nValor,'numerico','Digite a nota: ')

  while (val(nValor)<0 .OR. val(nValor)>10)

    nValor := ""
    FwAlertError("Nota invalida, por favor tente novamente","Valor Invalido!")
    U_RecebeInput(@nValor,'numerico','Digite a nota: ')
  enddo
Return
