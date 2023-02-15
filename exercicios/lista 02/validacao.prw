#INCLUDE "TOTVS.CH"

User Function FwInputBoxVal(cValor,cTipo,cTextoInput,cPositivo)

    cValor := FwInputBox(cTextoInput,cValor)

    while(!ValidarCaracter(cValor,cTipo))
        cValor := ""
        FwAlertError("O Valor informado nao é valor"+cTipo+", clicar em fechar para digitar o valor novamente","Valor Invalido!")
        cValor := FwInputBox(cTextoInput,cValor)
    enddo

    if(cTipo=="N")
        cValor := val(cValor)
    endif
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
            if((IsDigit(ctexto)=.T. .And. tipo="N") .or. (Asc(ctexto)==45 .And. tipo="N" .and. i=0 .and. len(texto)>1) .or. (Asc(ctexto)==46 .and. tipo="N" .and. nPonto==0 .and. i <> 0 .and. i <> len(texto)-1))
                if(Asc(ctexto)==46)
                    nPonto++
                endif
                nResultado := .T.
            elseif((IsAlpha(ctexto)=.T. .And. tipo="C") .or. (ctexto==" " .and. tipo="C"))
                nResultado := .T.
            else
                nResultado := .F.
                exit
            endif
        endif
    next i
Return nResultado

Static Function ValPositivo(cValor,cTipo,cPositivo)
    Local lPositivo := .T.

    if(cTipo=='N' .and. cPositivo=='S')
        lPositivo := Positivo(val(cValor))
    endif
    
Return lPositivo
