//Bibliotecas
#Include 'TOTVS.ch'

/*/{Protheus.doc} User Function TesteFabio
Funcao com tela customizada usando a classe TDialog que foi gerado pelo PDialogMaker
@type  Function
@author User
@since 27/02/2023 
@see https://atiliosistemas.com/portfolio/pdialogmaker/
@obs Obrigado por usar um aplicativo da Atilio Sistemas
/*/

User Function TesteFabio()
    Local aArea         := FWGetArea()
    Local nCorFundo     := RGB(255, 0, 204)
    Local nJanAltura    := 373
    Local nJanLargur    := 327 
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
    //objeto1 
    Private oChkObj1 
    Private lChkObj1    := .F.  
    Private cChkObj1    := 'CheckBox'  
    //objeto2 
    Private oCmbObj2 
    Private cCmbObj2    := '01'  
    Private aCmbObj2    := {'01=Sim', '02=Nao', '03=Talvez', 'ZZ=Etc'}  
    
    //Cria a dialog
    oDialogPvt := TDialog():New(0, 0, nJanAltura, nJanLargur, cJanTitulo, , , , , , nCorFundo, , , lDimPixels)
    
        //objeto0 - usando a classe TGet
        nObjLinha := 14
        nObjColun := 13
        nObjLargu := 100
        nObjAltur := 25
        oGetObj0  := TGet():New(nObjLinha, nObjColun, {|u| Iif(PCount() > 0 , xGetObj0 := u, xGetObj0)}, oDialogPvt, nObjLargu, nObjAltur, /*cPict*/, /*bValid*/, /*nClrFore*/, /*nClrBack*/, oFontPadrao, , , lDimPixels)
        //oGetObj0:cPlaceHold := 'Digite aqui um texto...'   //Texto que sera exibido no campo antes de ter conteudo
        //oGetObj0:cF3        := 'Codigo da consulta padrao' //Codigo da consulta padrao / F3 que sera habilitada
        //oGetObj0:bValid     := {|| fFuncaoVld()}           //Funcao para validar o que foi digitado
        //oGetObj0:lReadOnly  := .T.                         //Para permitir o usuario clicar mas nao editar o campo
        //oGetObj0:lActive    := .F.                         //Para deixar o campo inativo e o usuario nao conseguir nem clicar
        //oGetObj0:Picture    := '@!'                        //Mascara / Picture do campo

        //objeto1 - usando a classe TCheckBox
        nObjLinha := 51
        nObjColun := 18
        nObjLargu := 50
        nObjAltur := 15
        oChkObj1  := TCheckBox():New(nObjLinha, nObjColun, cChkObj1, {|u| Iif(PCount() > 0 , lChkObj1 := u, lChkObj1)}, oDialogPvt, nObjLargu, nObjAltur, , /*bLClicked*/, oFontPadrao, /*bValid*/, /*nClrText*/, /*nClrPane*/, , lDimPixels)

        //objeto2 - usando a classe TComboBox
        nObjLinha := 73
        nObjColun := 19
        nObjLargu := 28
        nObjAltur := 10
        oCmbObj2  := TComboBox():New(nObjLinha, nObjColun, {|u| Iif(PCount() > 0 , cCmbObj2 := u, cCmbObj2)}, aCmbObj2, nObjLargu, nObjAltur, oDialogPvt, , /*bChange*/, /*bValid*/, /*nClrText*/, /*nClrBack*/, lDimPixels, oFontPadrao)

    
    //Ativa e exibe a janela
    oDialogPvt:Activate(, , , lCentraliz, , , bBlocoIni)
    
    FWRestArea(aArea)
Return
