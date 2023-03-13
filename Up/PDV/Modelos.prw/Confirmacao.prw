//Bibliotecas
#Include 'TOTVS.ch'

/*/{Protheus.doc} User Function confirmacao
Funcao com tela customizada usando a classe TDialog que foi gerado pelo PDialogMaker
@type  Function
@author fabio
@since 10/03/2023 
@see https://atiliosistemas.com/portfolio/pdialogmaker/
@obs Obrigado por usar um aplicativo da Atilio Sistemas
/*/

User Function confirmacao()
    Local aArea         := FWGetArea()
    Local nCorFundo     := RGB(238, 238, 238)
    Local nJanAltura    := 97
    Local nJanLargur    := 252 
    Local cJanTitulo    := 'PDialogMaker - Versao 1.02'
    Local lDimPixels    := .T. 
    Local lCentraliz    := .T. 
    Local nObjLinha     := 0
    Local nObjColun     := 0
    Local nObjLargu     := 0
    Local nObjAltur     := 0
    Private cFontNome   := 'Tahoma'
    Private oFontPadrao := TFont():New(cFontNome, , -12)
    Private oDialogPvt 
    Private bBlocoIni   := {|| /*fSuaFuncao()*/ } //Aqui voce pode acionar funcoes customizadas que irao ser acionadas ao abrir a dialog 
    //objeto0 
    Private oGetObj0 
    Private xGetObj0    := Space(10) //Se o get for data para inicilizar use dToS(''), se for numerico inicie com 0  
    //objeto2 
    Private oBtnObj2 
    Private cBtnObj2    := 'Button'  
    Private bBtnObj2    := {|| MsgInfo('Coloque sua funcao aqui', 'Atencao objeto2')}  
    //objeto3 
    Private oBtnObj3 
    Private cBtnObj3    := 'Button'  
    Private bBtnObj3    := {|| MsgInfo('Coloque sua funcao aqui', 'Atencao objeto3')}  
    
    //Cria a dialog
    oDialogPvt := TDialog():New(0, 0, nJanAltura, nJanLargur, cJanTitulo, , , , , , nCorFundo, , , lDimPixels)
    
        //objeto0 - usando a classe TGet
        nObjLinha := 7
        nObjColun := 7
        nObjLargu := 112
        nObjAltur := 15
        oGetObj0  := TGet():New(nObjLinha, nObjColun, {|u| Iif(PCount() > 0 , xGetObj0 := u, xGetObj0)}, oDialogPvt, nObjLargu, nObjAltur, /*cPict*/, /*bValid*/, /*nClrFore*/, /*nClrBack*/, oFontPadrao, , , lDimPixels)
        //oGetObj0:cPlaceHold := 'Digite aqui um texto...'   //Texto que sera exibido no campo antes de ter conteudo
        //oGetObj0:cF3        := 'Codigo da consulta padrao' //Codigo da consulta padrao / F3 que sera habilitada
        //oGetObj0:bValid     := {|| fFuncaoVld()}           //Funcao para validar o que foi digitado
        //oGetObj0:lReadOnly  := .T.                         //Para permitir o usuario clicar mas nao editar o campo
        //oGetObj0:lActive    := .F.                         //Para deixar o campo inativo e o usuario nao conseguir nem clicar
        //oGetObj0:Picture    := '@!'                        //Mascara / Picture do campo

        //objeto2 - usando a classe TButton
        nObjLinha := 27
        nObjColun := 66
        nObjLargu := 55
        nObjAltur := 15
        oBtnObj2  := TButton():New(nObjLinha, nObjColun, cBtnObj2, oDialogPvt, bBtnObj2, nObjLargu, nObjAltur, , oFontPadrao, , lDimPixels)

        //objeto3 - usando a classe TButton
        nObjLinha := 27
        nObjColun := 8
        nObjLargu := 55
        nObjAltur := 15
        oBtnObj3  := TButton():New(nObjLinha, nObjColun, cBtnObj3, oDialogPvt, bBtnObj3, nObjLargu, nObjAltur, , oFontPadrao, , lDimPixels)

    
    //Ativa e exibe a janela
    oDialogPvt:Activate(, , , lCentraliz, , , bBlocoIni)
    
    FWRestArea(aArea)
Return
