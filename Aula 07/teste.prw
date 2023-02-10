#INCLUDE 'TOTVS.CH'
#INCLUDE 'PROTHEUS.CH'

User Function Calculadora()

    LOCAL nNumero1
    LOCAL nNumero2
    LOCAL nSoma
    
    //Atribuindo valores para as variaveis
    nNumero1 := val(FwInputBox("Digite um numero",nNumero1))
    nNumero2 := val(FwInputBox("Digite um numero",nNumero2))

    nSoma := Calculcar(nNumero1,nNumero2)

    MSGALERT("A soma dos valores e:"+CVALTOCHAR( nSoma ))

Return 

Static Function Calculcar(nValor1,nValor2)

return nValor1+nValor2

    





