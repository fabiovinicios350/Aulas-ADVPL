#INCLUDE 'TOTVS.CH'

//Função para a criação dos componentes da tela de confirmação
User Function SenhaLibera()

  //Constantes
  #DEFINE cTITULO 'Algoritimos para solicitra a senha de liberação'
  #DEFINE cTITULODLG 'Liberação' 

  //Cor
  #DEFINE COR_FUNDO_PADRAO RGB(216,216,216)
  #DEFINE CLR_TEXTO RGB(136,136,136)
  #DEFINE CSENHALIBERA "fabio1998"

  //CSS
  Local cCssDlgLibera :=;
  "QLineEdit {"+;
    "background: #fff;"+;
    "border: none;"+;
    "border-radius: 5px;"+; 
    "color: #A5A5A5;"+;
    "font: normal 14px Arial;"+;
    "padding-left: 10px ;"+;
  "}"+;
  "QPushButton {"+;
    "background: #fff;"+;
    "color: #818181;"+;
    "border: none;"+;
    "border-radius: 5px;"+; 
    "font: normal 14px Arial;"+;
  "}"

  Local cCssLibera :=;
  "QPushButton {"+;
    "background: #A3CDA7;"+;
    "color: #438B4A;"+;
  "}"

  //Variaveis Global
  Private lRet          :=.F.
  Private cSenhaSUP     := space(30)
  Private oDlgLibera

  oDlgLibera := TDialog():New(0,0,97,252,cTITULODLG,,,,,CLR_TEXTO,COR_FUNDO_PADRAO,,,.T.)
  oDlgLibera:SetCss( cCssDlgLibera )

  oGetSenha := TGet():New( 8,8,{|u| If( PCount() == 0, cSenhaSUP, cSenhaSUP:=u )},oDlgLibera,112,15,,,0,,,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.T.,,cSenhaSUP,,,,)
  oGetSenha:cPlaceHold := 'Digite a senha do supervisor...'

  oCancelaLibera := TButton():New( 30, 8, "Cancelar",oDlgLibera,{||oDlgLibera:End()}, 53,15,,,.F.,.T.,.F.,,.F.,,,.F. )
  oLiberar := TButton():New( 30, 68, "Liberar",oDlgLibera,{||ValidaSenha()}, 53,15,,,.F.,.T.,.F.,,.F.,,,.F. )
  oLiberar:SetCss( cCssLibera )

  oDlgLibera:Activate(,,,.T.,,,)
Return lRet

Static Function ValidaSenha()
  if(alltrim(cSenhaSUP)==CSENHALIBERA)
    FwAlertSuccess("Operação liberada com sucesso!","Sucesso")
    lRet:=.T.
    oDlgLibera:End()
  else
    FwAlertError("Senha incorreta","Erro")
    lRet:=.F.
  endif
Return
