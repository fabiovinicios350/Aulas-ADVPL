//Bibliotecas
#INCLUDE "TOTVS.CH"

/*/
  @author Fabio
  @since 12/02/2023
/*/

User Function CalMediaAluno1()
  Local cValor := "S"

  CalMediaAluno02()
 
  while (cValor=="S" .OR. cValor=="s")
    
    cValor := ""
    U_RecebeInput(@cValor,'caracter','Novo Calculo (S/N): ')

    while (cValor=="S" .AND. cValor=="s" .AND. cValor=="n" .AND. cValor=="N")
      cValor := ""
      FwAlertError("Valor invalido, por favor tente novamente","Valor Invalido!")
      U_RecebeInput(@cValor,'caracter','Novo Calculo (S/N): ')
    enddo

    if(cValor=="S" .OR. cValor=="s")
      CalMediaAluno01()
    endif
  enddo

   FwAlertSuccess('Fim Algoritimo','Resultado!')
Return





Static Function CalMediaAluno02()
  Local nNota01
  Local nNota02
  Local nMedia

  FwAlertInfo("Algoritimos para calcular a media de um aluno","Bem vindo!")

  ObterNota(@nNota01)
  ObterNota(@nNota02)

  nMedia := (val(nNota01)+val(nNota02))/2

  FwAlertSuccess('A sua media foi: '+cValToChar(nMedia),'Resultado!')
Return 


Static Function ObterNota(nValor)
  U_RecebeInput(@nValor,'numerico','Digite a nota: ')

  while (val(nValor)<0 .OR. val(nValor)>10)

    nValor := ""
    FwAlertError("Nota invalida, por favor tente novamente","Valor Invalido!")
    U_RecebeInput(@nValor,'numerico','Digite a nota: ')
  enddo
Return
