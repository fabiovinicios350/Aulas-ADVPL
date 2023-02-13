#INCLUDE "TOTVS.CH"

User Function RecebeInput(cValor,cTipo,cTextoInput)

    cValor := FwInputBox(cTextoInput,cValor)
    Alert("testeteste")
    while(ValidarCaracter(cValor,cTipo)=.F.)
        cValor := ""
        FwAlertError("O Valor informado nao é valor"+cTipo+", clicar em fechar para digitar o valor novamente","Valor Invalido!")
        cValor := FwInputBox(cTextoInput,cValor)
    enddo

Return 

Static Function ValidarCaracter(texto,tipo)
    
    LOCAL nResultado
    LOCAL ctexto
    LOCAL i
    LOCAL nPonto := 0
    
    for i:=0 to len(texto)
        ctexto:= SubStr(texto,i+1,1)

        if len(texto)<1
            nResultado := .F.
            exit
        elseif i==len(texto)
            exit
        else
            if((IsDigit(ctexto)=.T. .And. tipo="numerico") .or. (Asc(ctexto)==45 .And. tipo="numerico" .and. i=0 .and. len(texto)>1) .or. (Asc(ctexto)==46 .and. tipo="numerico" .and. nPonto==0 .and. i <> 0 .and. i <> len(texto)-1))
                if(Asc(ctexto)==46)
                    nPonto++
                endif
                nResultado := .T.
            elseif((IsAlpha(ctexto)=.T. .And. tipo="caracter") .or. (ctexto==" " .and. tipo="caracter"))
                nResultado := .T.
            else
                nResultado := .F.
                exit
            endif
        endif
    next i

Return nResultado
