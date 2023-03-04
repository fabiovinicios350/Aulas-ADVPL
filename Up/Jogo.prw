//Bibliotecas
#Include 'TOTVS.ch'

/*/{Protheus.doc} User Function zTeste
Funcao com tela customizada usando a classe TDialog que foi gerado pelo PDialogMaker
@type  Function
@author fabio
@since 03/03/2023 
@see https://atiliosistemas.com/portfolio/pdialogmaker/
@obs Obrigado por usar um aplicativo da Atilio Sistemas
/*/

User Function zTeste()
    Local aArea         := FWGetArea()
    Local nCorFundo     := RGB(102, 255, 204)
    Local nJanAltura    := 530
    Local nJanLargur    := 896 
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
    //objeto1 
    Private oBtnObj1 
    Private cBtnObj1    := 'Button'  
    Private bBtnObj1    := {|| MsgInfo('Coloque sua funcao aqui', 'Atencao objeto1')}  
    //objeto2 
    Private oLisObj2 
    Private nLisObj2    := 0  
    Private aLisObj2    := {'Item 1', 'Item 2', 'Item 3', 'Item 4', 'etc'}  
    //objeto3 
    Private oCmbObj3 
    Private cCmbObj3    := '01'  
    Private aCmbObj3    := {'01=Sim', '02=Nao', '03=Talvez', 'ZZ=Etc'}  
    //objeto4 
    Private oChkObj4 
    Private lChkObj4    := .F.  
    Private cChkObj4    := 'CheckBox'  
    //objeto5 
    Private oChkObj5 
    Private lChkObj5    := .F.  
    Private cChkObj5    := 'CheckBox'  
    
    //Cria a dialog
    oDialogPvt := TDialog():New(0, 0, nJanAltura, nJanLargur, cJanTitulo, , , , , , nCorFundo, , , lDimPixels)
    
        //objeto1 - usando a classe TButton
        nObjLinha := 12
        nObjColun := 11
        nObjLargu := 100
        nObjAltur := 150
        oBtnObj1  := TButton():New(nObjLinha, nObjColun, cBtnObj1, oDialogPvt, bBtnObj1, nObjLargu, nObjAltur, , oFontPadrao, , lDimPixels)

        //objeto2 - usando a classe TListBox
        nObjLinha := 17
        nObjColun := 125
        nObjLargu := 65
        nObjAltur := 80
        oLisObj2  := TListBox():New(nObjLinha, nObjColun, {|u| Iif(PCount() > 0 , nLisObj2 := u, nLisObj2)}, aLisObj2, nObjLargu, nObjAltur, /*bChange*/, oDialogPvt, /*bValid*/, , , lDimPixels, , /*bLDBLClick*/, oFontPadrao)

        //objeto3 - usando a classe TComboBox
        nObjLinha := 110
        nObjColun := 122
        nObjLargu := 75
        nObjAltur := 10
        oCmbObj3  := TComboBox():New(nObjLinha, nObjColun, {|u| Iif(PCount() > 0 , cCmbObj3 := u, cCmbObj3)}, aCmbObj3, nObjLargu, nObjAltur, oDialogPvt, , /*bChange*/, /*bValid*/, /*nClrText*/, /*nClrBack*/, lDimPixels, oFontPadrao)

        //objeto4 - usando a classe TCheckBox
        nObjLinha := 22
        nObjColun := 201
        nObjLargu := 50
        nObjAltur := 15
        oChkObj4  := TCheckBox():New(nObjLinha, nObjColun, cChkObj4, {|u| Iif(PCount() > 0 , lChkObj4 := u, lChkObj4)}, oDialogPvt, nObjLargu, nObjAltur, , /*bLClicked*/, oFontPadrao, /*bValid*/, /*nClrText*/, /*nClrPane*/, , lDimPixels)

        //objeto5 - usando a classe TCheckBox
        nObjLinha := 42
        nObjColun := 201
        nObjLargu := 50
        nObjAltur := 15
        oChkObj5  := TCheckBox():New(nObjLinha, nObjColun, cChkObj5, {|u| Iif(PCount() > 0 , lChkObj5 := u, lChkObj5)}, oDialogPvt, nObjLargu, nObjAltur, , /*bLClicked*/, oFontPadrao, /*bValid*/, /*nClrText*/, /*nClrPane*/, , lDimPixels)

    
    //Ativa e exibe a janela
    oDialogPvt:Activate(, , , lCentraliz, , , bBlocoIni)
    
    FWRestArea(aArea)
Return
