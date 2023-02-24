//Bibliotecas
#INCLUDE "TOTVS.CH"

//Constantes
#DEFINE cTITULO 'Algoritimo para contar caracteres'

/*/
  @author Fabio
  @since 12/02/2023
/*/

User Function ContarCaracter()
  Local lTentar   := .T.
  Local nA
  Local nE
  Local nI
  Local nO
  Local nU
  Local nSpace
  Local ctexto
  Local cCaracter
  Local nJ
  
  FwAlertInfo(cTITULO,"Bem vindo!")
  
  while(lTentar)
    ctexto := ''
    nA        := 0
    nE        := 0
    nI        := 0
    nO        := 0
    nU        := 0
    nSpace    := 0
    U_FwInputBoxVal(@ctexto,'C','Digite uma palavra: ')

    ctexto := UPPER(ctexto)

    for nJ:=1 to len(ctexto)
      cCaracter := SubStr(ctexto,nJ,1)
      do case
        case ASC(cCaracter) == 65
          nA++
        case ASC(cCaracter) == 69
          nE++
        case ASC(cCaracter) == 73
          nI++
        case ASC(cCaracter) == 79
          nO++
        case ASC(cCaracter) == 85
          nU++
        case ASC(cCaracter) == 32
          nSpace++
        otherwise
      endcase
    next nJ

    FwAlertSuccess("A palavra tem:"+CRLF+cValToChar(nA)+" Volgal 'A'"+CRLF+cValToChar(nE)+" Volgal 'E'"+CRLF+cValToChar(nI)+" Volgal 'I'"+CRLF+cValToChar(nO)+" Volgal 'O'"+CRLF+cValToChar(nU)+" Volgal 'U'"+CRLF+cValToChar(nSpace)+" Espaços em branco.",ctexto)
    lTentar := MsgyesNo("Deseja tentar novamente? ","Tentar Novamente")
  enddo

  FwAlertInfo('Fim do algoritimo','Resultado!')
Return
