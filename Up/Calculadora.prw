//Biblioteca
#INCLUDE 'TOTVS.CH'

/*/
  @author Fabio
  @since 24/02/2023
/*/

//Função para exibir a calculadora
User Function FabioCalculadora()

  //Constantes
  #DEFINE cTITULO 'Algoritimo para simular uma calculadora'
  #DEFINE cTITULODLG 'Calculadora' 
  #DEFINE COLOR_BLACK RGB(0,0,0)

  //variaveis de estilização
  Local cInputCSS := ""+;
  "QLineEdit {"+;
    "background: rgb(0, 0, 0);"+;
    "border: none;"+; 
    "font: normal 23px Arial;"+;
    "color: #ffffff;"+;
  "}"+;
  "QPushButton {"+;
    "border: none;"+; 
    "border-radius: 22%;"+; 
    "font: normal 18px Arial;"+;
    "color: #ffffff;"+;
  "}"

  Local cOpcoesCSS := ""+;
  "QPushButton {"+;
    "background: rgb(236, 128, 4);"+;
  "}"+; 
  "QPushButton:pressed {"+;
    "background-color:  rgb(243, 179, 106);"+; 
  "}"

  Local cFuncoesCSS := ""+;
  "QPushButton {"+;
    "background: rgb(179, 179, 179);"+;
    "color: #000;"+;
  "}"+; 
  "QPushButton:pressed {"+;
    "background-color:  rgb(215, 215, 215);"+; 
  "}"

  Local cNumeroCSS := ""+;
  "QPushButton {"+;
    "background: rgb(58, 58, 58);"+;
  "}"+; 
  "QPushButton:pressed {"+;
    "background-color:  rgb(155, 155, 155);"+; 
  "}"

  //Variaveis 
  Local oDlg
  Private nValor          := 0
  Private cOperacao       := ''
  Private cOperacaoAux    := ''
  Private nResult         := 0
  Private nVigula         := 0
  Private nOpPendente     := .F.

  FwAlertInfo(cTITULO,"Bem vindo!")
  

  //Criacao de janela de Dialog
  oDlg := MSDIALOG():New(0, 0, 344, 228, cTITULODLG, , , , , , COLOR_BLACK, , , .T.)
  oDlg:SetCss(cInputCSS)

  oNumero := TGet():New( 005, 006, { | u | If( PCount() == 0, nValor, nValor := u ) },oDlg, ;
  130, 25, "@E 999,999,999,999,999.999",,,,,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F. ,,"nValor",,,,.T.)
  
  oDivisao:=TButton():New( 038, 006, "AC",oDlg,{||Resultado("L")}, 22,22,,,.F.,.T.,.F.,,.F.,,,.F. )
  oDivisao:SetCss(cFuncoesCSS)
  oDivisao:=TButton():New( 038, 033, "+/-",oDlg,{||Resultado("T")}, 22,22,,,.F.,.T.,.F.,,.F.,,,.F. )
  oDivisao:SetCss(cFuncoesCSS)
  oDivisao:=TButton():New( 038, 060, "%",oDlg,{||Resultado("%")}, 22,22,,,.F.,.T.,.F.,,.F.,,,.F. )
  oDivisao:SetCss(cFuncoesCSS)
  oDivisao:=TButton():New( 038, 087, "/",oDlg,{||Resultado("/")}, 22,22,,,.F.,.T.,.F.,,.F.,,,.F. )
  oDivisao:SetCss(cOpcoesCSS)
  
  oDivisao:=TButton():New( 065, 006, "7",oDlg,{||Resultado("7")}, 22,22,,,.F.,.T.,.F.,,.F.,,,.F. )
  oDivisao:SetCss(cNumeroCSS)
  oDivisao:=TButton():New( 065, 033, "8",oDlg,{||Resultado("8")}, 22,22,,,.F.,.T.,.F.,,.F.,,,.F. )
  oDivisao:SetCss(cNumeroCSS)
  oDivisao:=TButton():New( 065, 060, "9",oDlg,{||Resultado("9")}, 22,22,,,.F.,.T.,.F.,,.F.,,,.F. )
  oDivisao:SetCss(cNumeroCSS)
  oMult:=TButton():New( 065, 087, "X",oDlg,{||Resultado("*")}, 22,22,,,.F.,.T.,.F.,,.F.,,,.F. )
  oMult:SetCss(cOpcoesCSS)
  
  oDivisao:=TButton():New( 092, 006, "4",oDlg,{||Resultado("4")}, 22,22,,,.F.,.T.,.F.,,.F.,,,.F. )
  oDivisao:SetCss(cNumeroCSS)
  oDivisao:=TButton():New( 092, 033, "5",oDlg,{||Resultado("5")}, 22,22,,,.F.,.T.,.F.,,.F.,,,.F. )
  oDivisao:SetCss(cNumeroCSS)
  oDivisao:=TButton():New( 092, 060, "6",oDlg,{||Resultado("6")}, 22,22,,,.F.,.T.,.F.,,.F.,,,.F. )
  oDivisao:SetCss(cNumeroCSS)
  oSub:=TButton():New( 092, 087, "-",oDlg,{||Resultado("-")}, 22,22,,,.F.,.T.,.F.,,.F.,,,.F. )
  oSub:SetCss(cOpcoesCSS)
  
  oDivisao:=TButton():New( 120, 006, "1",oDlg,{||Resultado("1")}, 22,22,,,.F.,.T.,.F.,,.F.,,,.F. )
  oDivisao:SetCss(cNumeroCSS)
  oDivisao:=TButton():New( 120, 033, "2",oDlg,{||Resultado("2")}, 22,22,,,.F.,.T.,.F.,,.F.,,,.F. )
  oDivisao:SetCss(cNumeroCSS)
  oDivisao:=TButton():New( 120, 060, "3",oDlg,{||Resultado("3")}, 22,22,,,.F.,.T.,.F.,,.F.,,,.F. )
  oDivisao:SetCss(cNumeroCSS)
  oSoma:=TButton():New( 120, 087, "+",oDlg,{||Resultado("+")}, 22,22,,,.F.,.T.,.F.,,.F.,,,.F. )
  oSoma:SetCss(cOpcoesCSS)

  oDivisao:=TButton():New( 147, 006, "0",oDlg,{||Resultado("0")}, 48,22,,,.F.,.T.,.F.,,.F.,,,.F. )
  oDivisao:SetCss(cNumeroCSS)
  oDivisao:=TButton():New( 147, 060, ",",oDlg,{||Resultado(",")}, 22,22,,,.F.,.T.,.F.,,.F.,,,.F. )
  oDivisao:SetCss(cNumeroCSS)
  oSoma:=TButton():New( 147, 087, "=",oDlg,{||Resultado("=")}, 22,22,,,.F.,.T.,.F.,,.F.,,,.F. )
  oSoma:SetCss(cOpcoesCSS)

  oDlg:Activate(, , , .T., , ,)

Return 

Static Function Resultado(cOpcao)
  Local cAux
  do case
    case ASC(cOpcao) == 76
      Limpa()
    case ASC(cOpcao) == 84
      nValor*= -1
    case ASC(cOpcao) == 37
      nValor/= 100
    case ASC(cOpcao) >=48 .and. ASC(cOpcao) <=57
      if(nResult==1)
        nValor:= 0
        nResult:=0
      endif
      cAux := cValToChar(nValor)
      if(nVigula==1)
        cAux+="."
        nVigula:= 2
      endif
      if(len(cOperacao)>0 .and. ISDIGIT(SubStr(cOperacao,len(cOperacao),1)))
        cAux += cOpcao
        nValor:= val(cAux)
        cOperacao += cOpcao
      elseif len(cOperacao)==0
        cAux += cOpcao
        nValor:= val(cAux)
      else
        cAux := cOpcao
        nValor:= val(cAux)
        cOperacao += cValToChar(nValor)
      endif
    case ASC(cOpcao) == 44
      if(nVigula==0)
        nVigula := 1
      endif
    case (ASC(cOpcao) == 42 .or. ASC(cOpcao) == 43 .or. ASC(cOpcao) == 45 .or. ASC(cOpcao) == 47)
      if len(cOperacao)>0
        if(SubStr(cOperacao,len(cOperacao),1)<>cOpcao .and. !ISDIGIT(SubStr(cOperacao,len(cOperacao),1)) )
          cOperacao:= left(cOperacao,len(cOperacao)-1)+cOpcao
        elseif SubStr(cOperacao,len(cOperacao),1)<>cOpcao
          nValor := &(cOperacao)
          cOperacao := cValToChar(nValor)+cOpcao
        endif
      else
        cOperacao := cValToChar(nValor)+cOpcao
        nValor := 0
      endif
    case ASC(cOpcao) == 61
      nValor :=  &(cOperacao)
      cOperacao   := ''
      nVigula     := 0
      nResult     := 1
    otherwise
  endcase
return

Static Function Limpa()
  nValor      := 0
  cOperacao   := ''
  nVigula     := 0
Return 
