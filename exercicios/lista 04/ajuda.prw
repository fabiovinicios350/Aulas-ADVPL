//Bibliotecas
#Include 'TOTVS.ch'

/*/{Protheus.doc} User Function Calculadora
Funcao com tela customizada usando a classe TDialog que foi gerado pelo PDialogMaker
@type  Function
@author fabko
@since 24/02/2023 
@see https://atiliosistemas.com/portfolio/pdialogmaker/
@obs Obrigado por usar um aplicativo da Atilio Sistemas
/*/

User Function Calculadora()
    Local aArea         := FWGetArea()
    Local nCorFundo     := RGB(0, 153, 204)
    Local nJanAltura    := 328
    Local nJanLargur    := 208 
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
    //Numero 
    Private oGetNumero 
    Private xGetNumero    := Space(10) //Se o get for data para inicilizar use dToS(''), se for numerico inicie com 0  
    //AC 
    Private oBtnAC 
    Private cBtnAC    := 'Button'  
    Private bBtnAC    := {|| MsgInfo('Coloque sua funcao aqui', 'Atencao AC')}  
    //+_- 
    Private oBtn+_- 
    Private cBtn+_-    := 'Button'  
    Private bBtn+_-    := {|| MsgInfo('Coloque sua funcao aqui', 'Atencao +_-')}  
    //% 
    Private oBtn% 
    Private cBtn%    := 'Button'  
    Private bBtn%    := {|| MsgInfo('Coloque sua funcao aqui', 'Atencao %')}  
    /// 
    Private oBtn/ 
    Private cBtn/    := 'Button'  
    Private bBtn/    := {|| MsgInfo('Coloque sua funcao aqui', 'Atencao /')}  
    //7 
    Private oBtn7 
    Private cBtn7    := 'Button'  
    Private bBtn7    := {|| MsgInfo('Coloque sua funcao aqui', 'Atencao 7')}  
    //8 
    Private oBtn8 
    Private cBtn8    := 'Button'  
    Private bBtn8    := {|| MsgInfo('Coloque sua funcao aqui', 'Atencao 8')}  
    //9 
    Private oBtn9 
    Private cBtn9    := 'Button'  
    Private bBtn9    := {|| MsgInfo('Coloque sua funcao aqui', 'Atencao 9')}  
    //X 
    Private oBtnX 
    Private cBtnX    := 'Button'  
    Private bBtnX    := {|| MsgInfo('Coloque sua funcao aqui', 'Atencao X')}  
    //4 
    Private oBtn4 
    Private cBtn4    := 'Button'  
    Private bBtn4    := {|| MsgInfo('Coloque sua funcao aqui', 'Atencao 4')}  
    //5 
    Private oBtn5 
    Private cBtn5    := 'Button'  
    Private bBtn5    := {|| MsgInfo('Coloque sua funcao aqui', 'Atencao 5')}  
    //6 
    Private oBtn6 
    Private cBtn6    := 'Button'  
    Private bBtn6    := {|| MsgInfo('Coloque sua funcao aqui', 'Atencao 6')}  
    //- 
    Private oBtn- 
    Private cBtn-    := 'Button'  
    Private bBtn-    := {|| MsgInfo('Coloque sua funcao aqui', 'Atencao -')}  
    //1 
    Private oBtn1 
    Private cBtn1    := 'Button'  
    Private bBtn1    := {|| MsgInfo('Coloque sua funcao aqui', 'Atencao 1')}  
    //2 
    Private oBtn2 
    Private cBtn2    := 'Button'  
    Private bBtn2    := {|| MsgInfo('Coloque sua funcao aqui', 'Atencao 2')}  
    //3 
    Private oBtn3 
    Private cBtn3    := 'Button'  
    Private bBtn3    := {|| MsgInfo('Coloque sua funcao aqui', 'Atencao 3')}  
    //+ 
    Private oBtn+ 
    Private cBtn+    := 'Button'  
    Private bBtn+    := {|| MsgInfo('Coloque sua funcao aqui', 'Atencao +')}  
    //0 
    Private oBtn0 
    Private cBtn0    := 'Button'  
    Private bBtn0    := {|| MsgInfo('Coloque sua funcao aqui', 'Atencao 0')}  
    //, 
    Private oBtn, 
    Private cBtn,    := 'Button'  
    Private bBtn,    := {|| MsgInfo('Coloque sua funcao aqui', 'Atencao ,')}  
    //= 
    Private oBtn= 
    Private cBtn=    := 'Button'  
    Private bBtn=    := {|| MsgInfo('Coloque sua funcao aqui', 'Atencao =')}  
    
    //Cria a dialog
    oDialogPvt := TDialog():New(0, 0, nJanAltura, nJanLargur, cJanTitulo, , , , , , nCorFundo, , , lDimPixels)
    
        //Numero - usando a classe TGet
        nObjLinha := 5
        nObjColun := 4
        nObjLargu := 97
        nObjAltur := 25
        oGetNumero  := TGet():New(nObjLinha, nObjColun, {|u| Iif(PCount() > 0 , xGetNumero := u, xGetNumero)}, oDialogPvt, nObjLargu, nObjAltur, /*cPict*/, /*bValid*/, /*nClrFore*/, /*nClrBack*/, oFontPadrao, , , lDimPixels)
        //oGetNumero:cPlaceHold := 'Digite aqui um texto...'   //Texto que sera exibido no campo antes de ter conteudo
        //oGetNumero:cF3        := 'Codigo da consulta padrao' //Codigo da consulta padrao / F3 que sera habilitada
        //oGetNumero:bValid     := {|| fFuncaoVld()}           //Funcao para validar o que foi digitado
        //oGetNumero:lReadOnly  := .T.                         //Para permitir o usuario clicar mas nao editar o campo
        //oGetNumero:lActive    := .F.                         //Para deixar o campo inativo e o usuario nao conseguir nem clicar
        //oGetNumero:Picture    := '@!'                        //Mascara / Picture do campo

        //AC - usando a classe TButton
        nObjLinha := 36
        nObjColun := 4
        nObjLargu := 22
        nObjAltur := 22
        oBtnAC  := TButton():New(nObjLinha, nObjColun, cBtnAC, oDialogPvt, bBtnAC, nObjLargu, nObjAltur, , oFontPadrao, , lDimPixels)

        //+_- - usando a classe TButton
        nObjLinha := 36
        nObjColun := 29
        nObjLargu := 22
        nObjAltur := 22
        oBtn+_-  := TButton():New(nObjLinha, nObjColun, cBtn+_-, oDialogPvt, bBtn+_-, nObjLargu, nObjAltur, , oFontPadrao, , lDimPixels)

        //% - usando a classe TButton
        nObjLinha := 36
        nObjColun := 54
        nObjLargu := 22
        nObjAltur := 22
        oBtn%  := TButton():New(nObjLinha, nObjColun, cBtn%, oDialogPvt, bBtn%, nObjLargu, nObjAltur, , oFontPadrao, , lDimPixels)

        /// - usando a classe TButton
        nObjLinha := 36
        nObjColun := 79
        nObjLargu := 22
        nObjAltur := 22
        oBtn/  := TButton():New(nObjLinha, nObjColun, cBtn/, oDialogPvt, bBtn/, nObjLargu, nObjAltur, , oFontPadrao, , lDimPixels)

        //7 - usando a classe TButton
        nObjLinha := 61
        nObjColun := 4
        nObjLargu := 22
        nObjAltur := 22
        oBtn7  := TButton():New(nObjLinha, nObjColun, cBtn7, oDialogPvt, bBtn7, nObjLargu, nObjAltur, , oFontPadrao, , lDimPixels)

        //8 - usando a classe TButton
        nObjLinha := 61
        nObjColun := 29
        nObjLargu := 22
        nObjAltur := 22
        oBtn8  := TButton():New(nObjLinha, nObjColun, cBtn8, oDialogPvt, bBtn8, nObjLargu, nObjAltur, , oFontPadrao, , lDimPixels)

        //9 - usando a classe TButton
        nObjLinha := 61
        nObjColun := 54
        nObjLargu := 22
        nObjAltur := 22
        oBtn9  := TButton():New(nObjLinha, nObjColun, cBtn9, oDialogPvt, bBtn9, nObjLargu, nObjAltur, , oFontPadrao, , lDimPixels)

        //X - usando a classe TButton
        nObjLinha := 61
        nObjColun := 79
        nObjLargu := 22
        nObjAltur := 22
        oBtnX  := TButton():New(nObjLinha, nObjColun, cBtnX, oDialogPvt, bBtnX, nObjLargu, nObjAltur, , oFontPadrao, , lDimPixels)

        //4 - usando a classe TButton
        nObjLinha := 87
        nObjColun := 4
        nObjLargu := 22
        nObjAltur := 22
        oBtn4  := TButton():New(nObjLinha, nObjColun, cBtn4, oDialogPvt, bBtn4, nObjLargu, nObjAltur, , oFontPadrao, , lDimPixels)

        //5 - usando a classe TButton
        nObjLinha := 87
        nObjColun := 29
        nObjLargu := 22
        nObjAltur := 22
        oBtn5  := TButton():New(nObjLinha, nObjColun, cBtn5, oDialogPvt, bBtn5, nObjLargu, nObjAltur, , oFontPadrao, , lDimPixels)

        //6 - usando a classe TButton
        nObjLinha := 87
        nObjColun := 54
        nObjLargu := 22
        nObjAltur := 22
        oBtn6  := TButton():New(nObjLinha, nObjColun, cBtn6, oDialogPvt, bBtn6, nObjLargu, nObjAltur, , oFontPadrao, , lDimPixels)

        //- - usando a classe TButton
        nObjLinha := 87
        nObjColun := 79
        nObjLargu := 22
        nObjAltur := 22
        oBtn-  := TButton():New(nObjLinha, nObjColun, cBtn-, oDialogPvt, bBtn-, nObjLargu, nObjAltur, , oFontPadrao, , lDimPixels)

        //1 - usando a classe TButton
        nObjLinha := 112
        nObjColun := 4
        nObjLargu := 22
        nObjAltur := 22
        oBtn1  := TButton():New(nObjLinha, nObjColun, cBtn1, oDialogPvt, bBtn1, nObjLargu, nObjAltur, , oFontPadrao, , lDimPixels)

        //2 - usando a classe TButton
        nObjLinha := 112
        nObjColun := 29
        nObjLargu := 22
        nObjAltur := 22
        oBtn2  := TButton():New(nObjLinha, nObjColun, cBtn2, oDialogPvt, bBtn2, nObjLargu, nObjAltur, , oFontPadrao, , lDimPixels)

        //3 - usando a classe TButton
        nObjLinha := 112
        nObjColun := 54
        nObjLargu := 22
        nObjAltur := 22
        oBtn3  := TButton():New(nObjLinha, nObjColun, cBtn3, oDialogPvt, bBtn3, nObjLargu, nObjAltur, , oFontPadrao, , lDimPixels)

        //+ - usando a classe TButton
        nObjLinha := 112
        nObjColun := 79
        nObjLargu := 22
        nObjAltur := 22
        oBtn+  := TButton():New(nObjLinha, nObjColun, cBtn+, oDialogPvt, bBtn+, nObjLargu, nObjAltur, , oFontPadrao, , lDimPixels)

        //0 - usando a classe TButton
        nObjLinha := 137
        nObjColun := 4
        nObjLargu := 48
        nObjAltur := 22
        oBtn0  := TButton():New(nObjLinha, nObjColun, cBtn0, oDialogPvt, bBtn0, nObjLargu, nObjAltur, , oFontPadrao, , lDimPixels)

        //, - usando a classe TButton
        nObjLinha := 137
        nObjColun := 54
        nObjLargu := 22
        nObjAltur := 22
        oBtn,  := TButton():New(nObjLinha, nObjColun, cBtn,, oDialogPvt, bBtn,, nObjLargu, nObjAltur, , oFontPadrao, , lDimPixels)

        //= - usando a classe TButton
        nObjLinha := 137
        nObjColun := 79
        nObjLargu := 22
        nObjAltur := 22
        oBtn=  := TButton():New(nObjLinha, nObjColun, cBtn=, oDialogPvt, bBtn=, nObjLargu, nObjAltur, , oFontPadrao, , lDimPixels)

    
    //Ativa e exibe a janela
    oDialogPvt:Activate(, , , lCentraliz, , , bBlocoIni)
    
    FWRestArea(aArea)
Return
