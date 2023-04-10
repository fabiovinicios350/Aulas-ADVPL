//Bibliotecas
#Include 'TOTVS.ch'

/*/{Protheus.doc} User Function modelo
Funcao com tela customizada usando a classe TDialog que foi gerado pelo PDialogMaker
@type  Function
@author fabio
@since 07/04/2023 
@see https://atiliosistemas.com/portfolio/pdialogmaker/
@obs Obrigado por usar um aplicativo da Atilio Sistemas
/*/

User Function modelo()
    Local aArea         := FWGetArea()
    Local nCorFundo     := RGB(238, 238, 238)
    Local nJanAltura    := 277
    Local nJanLargur    := 609 
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
    //NomeProd 
    Private oSayNomeProd 
    Private cSayNomeProd    := 'Label'  
    //un 
    Private oSayun 
    Private cSayun    := 'Label'  
    //valUn 
    Private oSayvalUn 
    Private cSayvalUn    := 'Label'  
    //Cod 
    Private oSayCod 
    Private cSayCod    := 'Label'  
    //ValCod 
    Private oSayValCod 
    Private cSayValCod    := 'Label'  
    //Qtd 
    Private oSayQtd 
    Private cSayQtd    := 'Label'  
    //ValQtd 
    Private oSayValQtd 
    Private cSayValQtd    := 'Label'  
    //valValor 
    Private oSayvalValor 
    Private cSayvalValor    := 'Label'  
    //Valor 
    Private oSayValor 
    Private cSayValor    := 'Label'  
    //imagem 
    Private oGetimagem 
    Private xGetimagem    := Space(10) //Se o get for data para inicilizar use dToS(''), se for numerico inicie com 0  
    //Info 
    Private oGetInfo 
    Private xGetInfo    := Space(10) //Se o get for data para inicilizar use dToS(''), se for numerico inicie com 0  
    //Fechar 
    Private oBtnFechar 
    Private cBtnFechar    := 'Button'  
    Private bBtnFechar    := {|| MsgInfo('Coloque sua funcao aqui', 'Atencao Fechar')}  
    
    //Cria a dialog
    oDialogPvt := TDialog():New(0, 0, nJanAltura, nJanLargur, cJanTitulo, , , , , , nCorFundo, , , lDimPixels)
    
        //NomeProd - usando a classe TSay
        nObjLinha := 14
        nObjColun := 145
        nObjLargu := 145
        nObjAltur := 25
        oSayNomeProd  := TSay():New(nObjLinha, nObjColun, {|| cSayNomeProd}, oDialogPvt, /*cPicture*/, oFontPadrao, , , , lDimPixels, /*nClrText*/, /*nClrBack*/, nObjLargu, nObjAltur, , , , , , /*lHTML*/)

        //un - usando a classe TSay
        nObjLinha := 40
        nObjColun := 145
        nObjLargu := 72
        nObjAltur := 15
        oSayun  := TSay():New(nObjLinha, nObjColun, {|| cSayun}, oDialogPvt, /*cPicture*/, oFontPadrao, , , , lDimPixels, /*nClrText*/, /*nClrBack*/, nObjLargu, nObjAltur, , , , , , /*lHTML*/)

        //valUn - usando a classe TSay
        nObjLinha := 40
        nObjColun := 217
        nObjLargu := 72
        nObjAltur := 15
        oSayvalUn  := TSay():New(nObjLinha, nObjColun, {|| cSayvalUn}, oDialogPvt, /*cPicture*/, oFontPadrao, , , , lDimPixels, /*nClrText*/, /*nClrBack*/, nObjLargu, nObjAltur, , , , , , /*lHTML*/)

        //Cod - usando a classe TSay
        nObjLinha := 56
        nObjColun := 145
        nObjLargu := 72
        nObjAltur := 15
        oSayCod  := TSay():New(nObjLinha, nObjColun, {|| cSayCod}, oDialogPvt, /*cPicture*/, oFontPadrao, , , , lDimPixels, /*nClrText*/, /*nClrBack*/, nObjLargu, nObjAltur, , , , , , /*lHTML*/)

        //ValCod - usando a classe TSay
        nObjLinha := 56
        nObjColun := 217
        nObjLargu := 72
        nObjAltur := 15
        oSayValCod  := TSay():New(nObjLinha, nObjColun, {|| cSayValCod}, oDialogPvt, /*cPicture*/, oFontPadrao, , , , lDimPixels, /*nClrText*/, /*nClrBack*/, nObjLargu, nObjAltur, , , , , , /*lHTML*/)

        //Qtd - usando a classe TSay
        nObjLinha := 72
        nObjColun := 145
        nObjLargu := 72
        nObjAltur := 15
        oSayQtd  := TSay():New(nObjLinha, nObjColun, {|| cSayQtd}, oDialogPvt, /*cPicture*/, oFontPadrao, , , , lDimPixels, /*nClrText*/, /*nClrBack*/, nObjLargu, nObjAltur, , , , , , /*lHTML*/)

        //ValQtd - usando a classe TSay
        nObjLinha := 72
        nObjColun := 217
        nObjLargu := 72
        nObjAltur := 15
        oSayValQtd  := TSay():New(nObjLinha, nObjColun, {|| cSayValQtd}, oDialogPvt, /*cPicture*/, oFontPadrao, , , , lDimPixels, /*nClrText*/, /*nClrBack*/, nObjLargu, nObjAltur, , , , , , /*lHTML*/)

        //valValor - usando a classe TSay
        nObjLinha := 88
        nObjColun := 217
        nObjLargu := 72
        nObjAltur := 15
        oSayvalValor  := TSay():New(nObjLinha, nObjColun, {|| cSayvalValor}, oDialogPvt, /*cPicture*/, oFontPadrao, , , , lDimPixels, /*nClrText*/, /*nClrBack*/, nObjLargu, nObjAltur, , , , , , /*lHTML*/)

        //Valor - usando a classe TSay
        nObjLinha := 88
        nObjColun := 145
        nObjLargu := 72
        nObjAltur := 15
        oSayValor  := TSay():New(nObjLinha, nObjColun, {|| cSayValor}, oDialogPvt, /*cPicture*/, oFontPadrao, , , , lDimPixels, /*nClrText*/, /*nClrBack*/, nObjLargu, nObjAltur, , , , , , /*lHTML*/)

        //imagem - usando a classe TGet
        nObjLinha := 7
        nObjColun := 5
        nObjLargu := 125
        nObjAltur := 125
        oGetimagem  := TGet():New(nObjLinha, nObjColun, {|u| Iif(PCount() > 0 , xGetimagem := u, xGetimagem)}, oDialogPvt, nObjLargu, nObjAltur, /*cPict*/, /*bValid*/, /*nClrFore*/, /*nClrBack*/, oFontPadrao, , , lDimPixels)
        //oGetimagem:cPlaceHold := 'Digite aqui um texto...'   //Texto que sera exibido no campo antes de ter conteudo
        //oGetimagem:cF3        := 'Codigo da consulta padrao' //Codigo da consulta padrao / F3 que sera habilitada
        //oGetimagem:bValid     := {|| fFuncaoVld()}           //Funcao para validar o que foi digitado
        //oGetimagem:lReadOnly  := .T.                         //Para permitir o usuario clicar mas nao editar o campo
        //oGetimagem:lActive    := .F.                         //Para deixar o campo inativo e o usuario nao conseguir nem clicar
        //oGetimagem:Picture    := '@!'                        //Mascara / Picture do campo
        
        //Info - usando a classe TGet
        nObjLinha := 7
        nObjColun := 137
        nObjLargu := 160
        nObjAltur := 100
        oGetInfo  := TGet():New(nObjLinha, nObjColun, {|u| Iif(PCount() > 0 , xGetInfo := u, xGetInfo)}, oDialogPvt, nObjLargu, nObjAltur, /*cPict*/, /*bValid*/, /*nClrFore*/, /*nClrBack*/, oFontPadrao, , , lDimPixels)
        //oGetInfo:cPlaceHold := 'Digite aqui um texto...'   //Texto que sera exibido no campo antes de ter conteudo
        //oGetInfo:cF3        := 'Codigo da consulta padrao' //Codigo da consulta padrao / F3 que sera habilitada
        //oGetInfo:bValid     := {|| fFuncaoVld()}           //Funcao para validar o que foi digitado
        //oGetInfo:lReadOnly  := .T.                         //Para permitir o usuario clicar mas nao editar o campo
        //oGetInfo:lActive    := .F.                         //Para deixar o campo inativo e o usuario nao conseguir nem clicar
        //oGetInfo:Picture    := '@!'                        //Mascara / Picture do campo

        //Fechar - usando a classe TButton
        nObjLinha := 113
        nObjColun := 138
        nObjLargu := 160
        nObjAltur := 20
        oBtnFechar  := TButton():New(nObjLinha, nObjColun, cBtnFechar, oDialogPvt, bBtnFechar, nObjLargu, nObjAltur, , oFontPadrao, , lDimPixels)

    
    //Ativa e exibe a janela
    oDialogPvt:Activate(, , , lCentraliz, , , bBlocoIni)
    
    FWRestArea(aArea)
Return
