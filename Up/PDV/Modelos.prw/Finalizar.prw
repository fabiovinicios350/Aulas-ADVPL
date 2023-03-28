//Bibliotecas
#Include 'TOTVS.ch'

/*/{Protheus.doc} User Function Finalizar
Funcao com tela customizada usando a classe TDialog que foi gerado pelo PDialogMaker
@type  Function
@author fabio
@since 22/03/2023 
@see https://atiliosistemas.com/portfolio/pdialogmaker/
@obs Obrigado por usar um aplicativo da Atilio Sistemas
/*/

User Function Finalizar()
    Local aArea         := FWGetArea()
    Local nCorFundo     := RGB(238, 238, 238)
    Local nJanAltura    := 647
    Local nJanLargur    := 1281 
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
    //TituloApagar 
    Private oGetTituloApagar 
    Private xGetTituloApagar    := Space(10) //Se o get for data para inicilizar use dToS(''), se for numerico inicie com 0  
    //Total 
    Private oGetTotal 
    Private xGetTotal    := Space(10) //Se o get for data para inicilizar use dToS(''), se for numerico inicie com 0  
    //Pago 
    Private oSayPago 
    Private cSayPago    := 'Label'  
    //Dinheiro 
    Private oSayDinheiro 
    Private cSayDinheiro    := 'Label'  
    //Credito 
    Private oSayCredito 
    Private cSayCredito    := 'Label'  
    //Debito 
    Private oSayDebito 
    Private cSayDebito    := 'Label'  
    //PIX 
    Private oSayPIX 
    Private cSayPIX    := 'Label'  
    //ValTroco 
    Private oSayValTroco 
    Private cSayValTroco    := 'Label'  
    //Troco 
    Private oSayTroco 
    Private cSayTroco    := 'Label'  
    //ValPago 
    Private oSayValPago 
    Private cSayValPago    := 'Label'  
    //objeto19 
    Private oSayObj19 
    Private cSayObj19    := 'Label'  
    //Desc 
    Private oSayDesc 
    Private cSayDesc    := 'Label'  
    //SubTotal 
    Private oSaySubTotal 
    Private cSaySubTotal    := 'Label'  
    //valDesc 
    Private oSayvalDesc 
    Private cSayvalDesc    := 'Label'  
    //valcred 
    Private oGetvalcred 
    Private xGetvalcred    := Space(10) //Se o get for data para inicilizar use dToS(''), se for numerico inicie com 0  
    //ValDeb 
    Private oGetValDeb 
    Private xGetValDeb    := Space(10) //Se o get for data para inicilizar use dToS(''), se for numerico inicie com 0  
    //ValDinhe 
    Private oGetValDinhe 
    Private xGetValDinhe    := Space(10) //Se o get for data para inicilizar use dToS(''), se for numerico inicie com 0  
    //Pagar 
    Private oBtnPagar 
    Private cBtnPagar    := 'Button'  
    Private bBtnPagar    := {|| MsgInfo('Coloque sua funcao aqui', 'Atencao Pagar')}  
    //Cancelar 
    Private oBtnCancelar 
    Private cBtnCancelar    := 'Button'  
    Private bBtnCancelar    := {|| MsgInfo('Coloque sua funcao aqui', 'Atencao Cancelar')}  
    //ValSub 
    Private oSayValSub 
    Private cSayValSub    := 'Label'  
    //valPix 
    Private oGetvalPix 
    Private xGetvalPix    := Space(10) //Se o get for data para inicilizar use dToS(''), se for numerico inicie com 0  
    //janela 
    Private oGetjanela 
    Private xGetjanela    := Space(10) //Se o get for data para inicilizar use dToS(''), se for numerico inicie com 0  
    
    //Cria a dialog
    oDialogPvt := TDialog():New(0, 0, nJanAltura, nJanLargur, cJanTitulo, , , , , , nCorFundo, , , lDimPixels)
    
        //TituloApagar - usando a classe TGet
        nObjLinha := 35
        nObjColun := 235
        nObjLargu := 160
        nObjAltur := 15
        oGetTituloApagar  := TGet():New(nObjLinha, nObjColun, {|u| Iif(PCount() > 0 , xGetTituloApagar := u, xGetTituloApagar)}, oDialogPvt, nObjLargu, nObjAltur, /*cPict*/, /*bValid*/, /*nClrFore*/, /*nClrBack*/, oFontPadrao, , , lDimPixels)
        //oGetTituloApagar:cPlaceHold := 'Digite aqui um texto...'   //Texto que sera exibido no campo antes de ter conteudo
        //oGetTituloApagar:cF3        := 'Codigo da consulta padrao' //Codigo da consulta padrao / F3 que sera habilitada
        //oGetTituloApagar:bValid     := {|| fFuncaoVld()}           //Funcao para validar o que foi digitado
        //oGetTituloApagar:lReadOnly  := .T.                         //Para permitir o usuario clicar mas nao editar o campo
        //oGetTituloApagar:lActive    := .F.                         //Para deixar o campo inativo e o usuario nao conseguir nem clicar
        //oGetTituloApagar:Picture    := '@!'                        //Mascara / Picture do campo

        //Total - usando a classe TGet
        nObjLinha := 55
        nObjColun := 235
        nObjLargu := 160
        nObjAltur := 25
        oGetTotal  := TGet():New(nObjLinha, nObjColun, {|u| Iif(PCount() > 0 , xGetTotal := u, xGetTotal)}, oDialogPvt, nObjLargu, nObjAltur, /*cPict*/, /*bValid*/, /*nClrFore*/, /*nClrBack*/, oFontPadrao, , , lDimPixels)
        //oGetTotal:cPlaceHold := 'Digite aqui um texto...'   //Texto que sera exibido no campo antes de ter conteudo
        //oGetTotal:cF3        := 'Codigo da consulta padrao' //Codigo da consulta padrao / F3 que sera habilitada
        //oGetTotal:bValid     := {|| fFuncaoVld()}           //Funcao para validar o que foi digitado
        //oGetTotal:lReadOnly  := .T.                         //Para permitir o usuario clicar mas nao editar o campo
        //oGetTotal:lActive    := .F.                         //Para deixar o campo inativo e o usuario nao conseguir nem clicar
        //oGetTotal:Picture    := '@!'                        //Mascara / Picture do campo

        //Pago - usando a classe TSay
        nObjLinha := 240
        nObjColun := 236
        nObjLargu := 28
        nObjAltur := 20
        oSayPago  := TSay():New(nObjLinha, nObjColun, {|| cSayPago}, oDialogPvt, /*cPicture*/, oFontPadrao, , , , lDimPixels, /*nClrText*/, /*nClrBack*/, nObjLargu, nObjAltur, , , , , , /*lHTML*/)

        //Dinheiro - usando a classe TSay
        nObjLinha := 175
        nObjColun := 235
        nObjLargu := 28
        nObjAltur := 6
        oSayDinheiro  := TSay():New(nObjLinha, nObjColun, {|| cSayDinheiro}, oDialogPvt, /*cPicture*/, oFontPadrao, , , , lDimPixels, /*nClrText*/, /*nClrBack*/, nObjLargu, nObjAltur, , , , , , /*lHTML*/)

        //Credito - usando a classe TSay
        nObjLinha := 125
        nObjColun := 235
        nObjLargu := 28
        nObjAltur := 6
        oSayCredito  := TSay():New(nObjLinha, nObjColun, {|| cSayCredito}, oDialogPvt, /*cPicture*/, oFontPadrao, , , , lDimPixels, /*nClrText*/, /*nClrBack*/, nObjLargu, nObjAltur, , , , , , /*lHTML*/)

        //Debito - usando a classe TSay
        nObjLinha := 150
        nObjColun := 235
        nObjLargu := 28
        nObjAltur := 6
        oSayDebito  := TSay():New(nObjLinha, nObjColun, {|| cSayDebito}, oDialogPvt, /*cPicture*/, oFontPadrao, , , , lDimPixels, /*nClrText*/, /*nClrBack*/, nObjLargu, nObjAltur, , , , , , /*lHTML*/)

        //PIX - usando a classe TSay
        nObjLinha := 200
        nObjColun := 235
        nObjLargu := 28
        nObjAltur := 6
        oSayPIX  := TSay():New(nObjLinha, nObjColun, {|| cSayPIX}, oDialogPvt, /*cPicture*/, oFontPadrao, , , , lDimPixels, /*nClrText*/, /*nClrBack*/, nObjLargu, nObjAltur, , , , , , /*lHTML*/)

        //ValTroco - usando a classe TSay
        nObjLinha := 222
        nObjColun := 275
        nObjLargu := 120
        nObjAltur := 15
        oSayValTroco  := TSay():New(nObjLinha, nObjColun, {|| cSayValTroco}, oDialogPvt, /*cPicture*/, oFontPadrao, , , , lDimPixels, /*nClrText*/, /*nClrBack*/, nObjLargu, nObjAltur, , , , , , /*lHTML*/)

        //Troco - usando a classe TSay
        nObjLinha := 222
        nObjColun := 236
        nObjLargu := 28
        nObjAltur := 15
        oSayTroco  := TSay():New(nObjLinha, nObjColun, {|| cSayTroco}, oDialogPvt, /*cPicture*/, oFontPadrao, , , , lDimPixels, /*nClrText*/, /*nClrBack*/, nObjLargu, nObjAltur, , , , , , /*lHTML*/)

        //ValPago - usando a classe TSay
        nObjLinha := 240
        nObjColun := 275
        nObjLargu := 120
        nObjAltur := 20
        oSayValPago  := TSay():New(nObjLinha, nObjColun, {|| cSayValPago}, oDialogPvt, /*cPicture*/, oFontPadrao, , , , lDimPixels, /*nClrText*/, /*nClrBack*/, nObjLargu, nObjAltur, , , , , , /*lHTML*/)

        //objeto19 - usando a classe TSay
        nObjLinha := 72
        nObjColun := 253
        nObjLargu := 28
        nObjAltur := 6
        oSayObj19  := TSay():New(nObjLinha, nObjColun, {|| cSayObj19}, oDialogPvt, /*cPicture*/, oFontPadrao, , , , lDimPixels, /*nClrText*/, /*nClrBack*/, nObjLargu, nObjAltur, , , , , , /*lHTML*/)

        //Desc - usando a classe TSay
        nObjLinha := 102
        nObjColun := 235
        nObjLargu := 28
        nObjAltur := 6
        oSayDesc  := TSay():New(nObjLinha, nObjColun, {|| cSayDesc}, oDialogPvt, /*cPicture*/, oFontPadrao, , , , lDimPixels, /*nClrText*/, /*nClrBack*/, nObjLargu, nObjAltur, , , , , , /*lHTML*/)

        //SubTotal - usando a classe TSay
        nObjLinha := 92
        nObjColun := 235
        nObjLargu := 28
        nObjAltur := 6
        oSaySubTotal  := TSay():New(nObjLinha, nObjColun, {|| cSaySubTotal}, oDialogPvt, /*cPicture*/, oFontPadrao, , , , lDimPixels, /*nClrText*/, /*nClrBack*/, nObjLargu, nObjAltur, , , , , , /*lHTML*/)

        //valDesc - usando a classe TSay
        nObjLinha := 102
        nObjColun := 275
        nObjLargu := 120
        nObjAltur := 6
        oSayvalDesc  := TSay():New(nObjLinha, nObjColun, {|| cSayvalDesc}, oDialogPvt, /*cPicture*/, oFontPadrao, , , , lDimPixels, /*nClrText*/, /*nClrBack*/, nObjLargu, nObjAltur, , , , , , /*lHTML*/)

        //valcred - usando a classe TGet
        nObjLinha := 121
        nObjColun := 275
        nObjLargu := 120
        nObjAltur := 15
        oGetvalcred  := TGet():New(nObjLinha, nObjColun, {|u| Iif(PCount() > 0 , xGetvalcred := u, xGetvalcred)}, oDialogPvt, nObjLargu, nObjAltur, /*cPict*/, /*bValid*/, /*nClrFore*/, /*nClrBack*/, oFontPadrao, , , lDimPixels)
        //oGetvalcred:cPlaceHold := 'Digite aqui um texto...'   //Texto que sera exibido no campo antes de ter conteudo
        //oGetvalcred:cF3        := 'Codigo da consulta padrao' //Codigo da consulta padrao / F3 que sera habilitada
        //oGetvalcred:bValid     := {|| fFuncaoVld()}           //Funcao para validar o que foi digitado
        //oGetvalcred:lReadOnly  := .T.                         //Para permitir o usuario clicar mas nao editar o campo
        //oGetvalcred:lActive    := .F.                         //Para deixar o campo inativo e o usuario nao conseguir nem clicar
        //oGetvalcred:Picture    := '@!'                        //Mascara / Picture do campo

        //ValDeb - usando a classe TGet
        nObjLinha := 145
        nObjColun := 275
        nObjLargu := 120
        nObjAltur := 15
        oGetValDeb  := TGet():New(nObjLinha, nObjColun, {|u| Iif(PCount() > 0 , xGetValDeb := u, xGetValDeb)}, oDialogPvt, nObjLargu, nObjAltur, /*cPict*/, /*bValid*/, /*nClrFore*/, /*nClrBack*/, oFontPadrao, , , lDimPixels)
        //oGetValDeb:cPlaceHold := 'Digite aqui um texto...'   //Texto que sera exibido no campo antes de ter conteudo
        //oGetValDeb:cF3        := 'Codigo da consulta padrao' //Codigo da consulta padrao / F3 que sera habilitada
        //oGetValDeb:bValid     := {|| fFuncaoVld()}           //Funcao para validar o que foi digitado
        //oGetValDeb:lReadOnly  := .T.                         //Para permitir o usuario clicar mas nao editar o campo
        //oGetValDeb:lActive    := .F.                         //Para deixar o campo inativo e o usuario nao conseguir nem clicar
        //oGetValDeb:Picture    := '@!'                        //Mascara / Picture do campo

        //ValDinhe - usando a classe TGet
        nObjLinha := 170
        nObjColun := 275
        nObjLargu := 120
        nObjAltur := 15
        oGetValDinhe  := TGet():New(nObjLinha, nObjColun, {|u| Iif(PCount() > 0 , xGetValDinhe := u, xGetValDinhe)}, oDialogPvt, nObjLargu, nObjAltur, /*cPict*/, /*bValid*/, /*nClrFore*/, /*nClrBack*/, oFontPadrao, , , lDimPixels)
        //oGetValDinhe:cPlaceHold := 'Digite aqui um texto...'   //Texto que sera exibido no campo antes de ter conteudo
        //oGetValDinhe:cF3        := 'Codigo da consulta padrao' //Codigo da consulta padrao / F3 que sera habilitada
        //oGetValDinhe:bValid     := {|| fFuncaoVld()}           //Funcao para validar o que foi digitado
        //oGetValDinhe:lReadOnly  := .T.                         //Para permitir o usuario clicar mas nao editar o campo
        //oGetValDinhe:lActive    := .F.                         //Para deixar o campo inativo e o usuario nao conseguir nem clicar
        //oGetValDinhe:Picture    := '@!'                        //Mascara / Picture do campo

        //Pagar - usando a classe TButton
        nObjLinha := 272
        nObjColun := 318
        nObjLargu := 75
        nObjAltur := 20
        oBtnPagar  := TButton():New(nObjLinha, nObjColun, cBtnPagar, oDialogPvt, bBtnPagar, nObjLargu, nObjAltur, , oFontPadrao, , lDimPixels)

        //Cancelar - usando a classe TButton
        nObjLinha := 272
        nObjColun := 235
        nObjLargu := 75
        nObjAltur := 20
        oBtnCancelar  := TButton():New(nObjLinha, nObjColun, cBtnCancelar, oDialogPvt, bBtnCancelar, nObjLargu, nObjAltur, , oFontPadrao, , lDimPixels)

        //ValSub - usando a classe TSay
        nObjLinha := 92
        nObjColun := 275
        nObjLargu := 120
        nObjAltur := 6
        oSayValSub  := TSay():New(nObjLinha, nObjColun, {|| cSayValSub}, oDialogPvt, /*cPicture*/, oFontPadrao, , , , lDimPixels, /*nClrText*/, /*nClrBack*/, nObjLargu, nObjAltur, , , , , , /*lHTML*/)

        //valPix - usando a classe TGet
        nObjLinha := 193
        nObjColun := 275
        nObjLargu := 120
        nObjAltur := 15
        oGetvalPix  := TGet():New(nObjLinha, nObjColun, {|u| Iif(PCount() > 0 , xGetvalPix := u, xGetvalPix)}, oDialogPvt, nObjLargu, nObjAltur, /*cPict*/, /*bValid*/, /*nClrFore*/, /*nClrBack*/, oFontPadrao, , , lDimPixels)
        //oGetvalPix:cPlaceHold := 'Digite aqui um texto...'   //Texto que sera exibido no campo antes de ter conteudo
        //oGetvalPix:cF3        := 'Codigo da consulta padrao' //Codigo da consulta padrao / F3 que sera habilitada
        //oGetvalPix:bValid     := {|| fFuncaoVld()}           //Funcao para validar o que foi digitado
        //oGetvalPix:lReadOnly  := .T.                         //Para permitir o usuario clicar mas nao editar o campo
        //oGetvalPix:lActive    := .F.                         //Para deixar o campo inativo e o usuario nao conseguir nem clicar
        //oGetvalPix:Picture    := '@!'                        //Mascara / Picture do campo

        //janela - usando a classe TGet
        nObjLinha := 25
        nObjColun := 227
        nObjLargu := 175
        nObjAltur := 275
        oGetjanela  := TGet():New(nObjLinha, nObjColun, {|u| Iif(PCount() > 0 , xGetjanela := u, xGetjanela)}, oDialogPvt, nObjLargu, nObjAltur, /*cPict*/, /*bValid*/, /*nClrFore*/, /*nClrBack*/, oFontPadrao, , , lDimPixels)
        //oGetjanela:cPlaceHold := 'Digite aqui um texto...'   //Texto que sera exibido no campo antes de ter conteudo
        //oGetjanela:cF3        := 'Codigo da consulta padrao' //Codigo da consulta padrao / F3 que sera habilitada
        //oGetjanela:bValid     := {|| fFuncaoVld()}           //Funcao para validar o que foi digitado
        //oGetjanela:lReadOnly  := .T.                         //Para permitir o usuario clicar mas nao editar o campo
        //oGetjanela:lActive    := .F.                         //Para deixar o campo inativo e o usuario nao conseguir nem clicar
        //oGetjanela:Picture    := '@!'                        //Mascara / Picture do campo

    
    //Ativa e exibe a janela
    oDialogPvt:Activate(, , , lCentraliz, , , bBlocoIni)
    
    FWRestArea(aArea)
Return
