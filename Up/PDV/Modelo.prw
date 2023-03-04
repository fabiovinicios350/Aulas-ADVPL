//Bibliotecas
#Include 'TOTVS.ch'

/*/{Protheus.doc} User Function Modelo
Funcao com tela customizada usando a classe TDialog que foi gerado pelo PDialogMaker
@type  Function
@author Fabio
@since 03/03/2023 
@see https://atiliosistemas.com/portfolio/pdialogmaker/
@obs Obrigado por usar um aplicativo da Atilio Sistemas
/*/

User Function Modelo()
    Local aArea         := FWGetArea()
    Local nCorFundo     := RGB(204, 204, 204)
    Local nJanAltura    := 644
    Local nJanLargur    := 1274 
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
    //Logo 
    Private oGetLogo 
    Private xGetLogo    := Space(10) //Se o get for data para inicilizar use dToS(''), se for numerico inicie com 0  
    //Cabecalho 
    Private oGetCabecalho 
    Private xGetCabecalho    := Space(10) //Se o get for data para inicilizar use dToS(''), se for numerico inicie com 0  
    //logoPesquisa 
    Private oGetlogoPesquisa 
    Private xGetlogoPesquisa    := Space(10) //Se o get for data para inicilizar use dToS(''), se for numerico inicie com 0  
    //TituloProduto 
    Private oGetTituloProduto 
    Private xGetTituloProduto    := Space(10) //Se o get for data para inicilizar use dToS(''), se for numerico inicie com 0  
    //objeto5 
    Private oBtnObj5 
    Private cBtnObj5    := 'Button'  
    Private bBtnObj5    := {|| MsgInfo('Coloque sua funcao aqui', 'Atencao objeto5')}  
    //objeto6 
    Private oBtnObj6 
    Private cBtnObj6    := 'Button'  
    Private bBtnObj6    := {|| MsgInfo('Coloque sua funcao aqui', 'Atencao objeto6')}  
    //objeto7 
    Private oBtnObj7 
    Private cBtnObj7    := 'Button'  
    Private bBtnObj7    := {|| MsgInfo('Coloque sua funcao aqui', 'Atencao objeto7')}  
    //objeto8 
    Private oBtnObj8 
    Private cBtnObj8    := 'Button'  
    Private bBtnObj8    := {|| MsgInfo('Coloque sua funcao aqui', 'Atencao objeto8')}  
    //objeto10 
    Private oBtnObj10 
    Private cBtnObj10    := 'Button'  
    Private bBtnObj10    := {|| MsgInfo('Coloque sua funcao aqui', 'Atencao objeto10')}  
    //IconeVendedor 
    Private oGetIconeVendedor 
    Private xGetIconeVendedor    := Space(10) //Se o get for data para inicilizar use dToS(''), se for numerico inicie com 0  
    //IconeCliente 
    Private oGetIconeCliente 
    Private xGetIconeCliente    := Space(10) //Se o get for data para inicilizar use dToS(''), se for numerico inicie com 0  
    //total 
    Private oGettotal 
    Private xGettotal    := Space(10) //Se o get for data para inicilizar use dToS(''), se for numerico inicie com 0  
    //Getpesquisa 
    Private oGetGetpesquisa 
    Private xGetGetpesquisa    := Space(10) //Se o get for data para inicilizar use dToS(''), se for numerico inicie com 0  
    //pesquisa 
    Private oGetpesquisa 
    Private xGetpesquisa    := Space(10) //Se o get for data para inicilizar use dToS(''), se for numerico inicie com 0  
    //fotoProduto 
    Private oGetfotoProduto 
    Private xGetfotoProduto    := Space(10) //Se o get for data para inicilizar use dToS(''), se for numerico inicie com 0  
    //DescrProduto 
    Private oGetDescrProduto 
    Private xGetDescrProduto    := Space(10) //Se o get for data para inicilizar use dToS(''), se for numerico inicie com 0  
    //valProduto 
    Private oGetvalProduto 
    Private xGetvalProduto    := Space(10) //Se o get for data para inicilizar use dToS(''), se for numerico inicie com 0  
    //InfoProduto 
    Private oGetInfoProduto 
    Private xGetInfoProduto    := Space(10) //Se o get for data para inicilizar use dToS(''), se for numerico inicie com 0  
    //Produto 
    Private oGetProduto 
    Private xGetProduto    := Space(10) //Se o get for data para inicilizar use dToS(''), se for numerico inicie com 0  
    //nomeVendedor 
    Private oSaynomeVendedor 
    Private cSaynomeVendedor    := 'Label'  
    //Vendedor 
    Private oGetVendedor 
    Private xGetVendedor    := Space(10) //Se o get for data para inicilizar use dToS(''), se for numerico inicie com 0  
    //nomeCliente 
    Private oSaynomeCliente 
    Private cSaynomeCliente    := 'Label'  
    //Cliente 
    Private oGetCliente 
    Private xGetCliente    := Space(10) //Se o get for data para inicilizar use dToS(''), se for numerico inicie com 0  
    //Subtotal 
    Private oGetSubtotal 
    Private xGetSubtotal    := Space(10) //Se o get for data para inicilizar use dToS(''), se for numerico inicie com 0  
    //Desconto 
    Private oGetDesconto 
    Private xGetDesconto    := Space(10) //Se o get for data para inicilizar use dToS(''), se for numerico inicie com 0  
    //Resumo 
    Private oGetResumo 
    Private xGetResumo    := Space(10) //Se o get for data para inicilizar use dToS(''), se for numerico inicie com 0  
    //listProduto 
    Private oMullistProduto 
    Private cMullistProduto    := ''  
    //ProdutosVenda 
    Private oGetProdutosVenda 
    Private xGetProdutosVenda    := Space(10) //Se o get for data para inicilizar use dToS(''), se for numerico inicie com 0  
    
    //Cria a dialog
    oDialogPvt := TDialog():New(0, 0, nJanAltura, nJanLargur, cJanTitulo, , , , , , nCorFundo, , , lDimPixels)
    
        //Logo - usando a classe TGet
        nObjLinha := 7
        nObjColun := 7
        nObjLargu := 162
        nObjAltur := 75
        oGetLogo  := TGet():New(nObjLinha, nObjColun, {|u| Iif(PCount() > 0 , xGetLogo := u, xGetLogo)}, oDialogPvt, nObjLargu, nObjAltur, /*cPict*/, /*bValid*/, /*nClrFore*/, /*nClrBack*/, oFontPadrao, , , lDimPixels)
        //oGetLogo:cPlaceHold := 'Digite aqui um texto...'   //Texto que sera exibido no campo antes de ter conteudo
        //oGetLogo:cF3        := 'Codigo da consulta padrao' //Codigo da consulta padrao / F3 que sera habilitada
        //oGetLogo:bValid     := {|| fFuncaoVld()}           //Funcao para validar o que foi digitado
        //oGetLogo:lReadOnly  := .T.                         //Para permitir o usuario clicar mas nao editar o campo
        //oGetLogo:lActive    := .F.                         //Para deixar o campo inativo e o usuario nao conseguir nem clicar
        //oGetLogo:Picture    := '@!'                        //Mascara / Picture do campo

        //Cabecalho - usando a classe TGet
        nObjLinha := 12
        nObjColun := 182
        nObjLargu := 445
        nObjAltur := 17
        oGetCabecalho  := TGet():New(nObjLinha, nObjColun, {|u| Iif(PCount() > 0 , xGetCabecalho := u, xGetCabecalho)}, oDialogPvt, nObjLargu, nObjAltur, /*cPict*/, /*bValid*/, /*nClrFore*/, /*nClrBack*/, oFontPadrao, , , lDimPixels)
        //oGetCabecalho:cPlaceHold := 'Digite aqui um texto...'   //Texto que sera exibido no campo antes de ter conteudo
        //oGetCabecalho:cF3        := 'Codigo da consulta padrao' //Codigo da consulta padrao / F3 que sera habilitada
        //oGetCabecalho:bValid     := {|| fFuncaoVld()}           //Funcao para validar o que foi digitado
        //oGetCabecalho:lReadOnly  := .T.                         //Para permitir o usuario clicar mas nao editar o campo
        //oGetCabecalho:lActive    := .F.                         //Para deixar o campo inativo e o usuario nao conseguir nem clicar
        //oGetCabecalho:Picture    := '@!'                        //Mascara / Picture do campo

        //logoPesquisa - usando a classe TGet
        nObjLinha := 92
        nObjColun := 17
        nObjLargu := 15
        nObjAltur := 15
        oGetlogoPesquisa  := TGet():New(nObjLinha, nObjColun, {|u| Iif(PCount() > 0 , xGetlogoPesquisa := u, xGetlogoPesquisa)}, oDialogPvt, nObjLargu, nObjAltur, /*cPict*/, /*bValid*/, /*nClrFore*/, /*nClrBack*/, oFontPadrao, , , lDimPixels)
        //oGetlogoPesquisa:cPlaceHold := 'Digite aqui um texto...'   //Texto que sera exibido no campo antes de ter conteudo
        //oGetlogoPesquisa:cF3        := 'Codigo da consulta padrao' //Codigo da consulta padrao / F3 que sera habilitada
        //oGetlogoPesquisa:bValid     := {|| fFuncaoVld()}           //Funcao para validar o que foi digitado
        //oGetlogoPesquisa:lReadOnly  := .T.                         //Para permitir o usuario clicar mas nao editar o campo
        //oGetlogoPesquisa:lActive    := .F.                         //Para deixar o campo inativo e o usuario nao conseguir nem clicar
        //oGetlogoPesquisa:Picture    := '@!'                        //Mascara / Picture do campo

        //TituloProduto - usando a classe TGet
        nObjLinha := 130
        nObjColun := 49
        nObjLargu := 80
        nObjAltur := 15
        oGetTituloProduto  := TGet():New(nObjLinha, nObjColun, {|u| Iif(PCount() > 0 , xGetTituloProduto := u, xGetTituloProduto)}, oDialogPvt, nObjLargu, nObjAltur, /*cPict*/, /*bValid*/, /*nClrFore*/, /*nClrBack*/, oFontPadrao, , , lDimPixels)
        //oGetTituloProduto:cPlaceHold := 'Digite aqui um texto...'   //Texto que sera exibido no campo antes de ter conteudo
        //oGetTituloProduto:cF3        := 'Codigo da consulta padrao' //Codigo da consulta padrao / F3 que sera habilitada
        //oGetTituloProduto:bValid     := {|| fFuncaoVld()}           //Funcao para validar o que foi digitado
        //oGetTituloProduto:lReadOnly  := .T.                         //Para permitir o usuario clicar mas nao editar o campo
        //oGetTituloProduto:lActive    := .F.                         //Para deixar o campo inativo e o usuario nao conseguir nem clicar
        //oGetTituloProduto:Picture    := '@!'                        //Mascara / Picture do campo

        //objeto5 - usando a classe TButton
        nObjLinha := 235
        nObjColun := 177
        nObjLargu := 85
        nObjAltur := 25
        oBtnObj5  := TButton():New(nObjLinha, nObjColun, cBtnObj5, oDialogPvt, bBtnObj5, nObjLargu, nObjAltur, , oFontPadrao, , lDimPixels)

        //objeto6 - usando a classe TButton
        nObjLinha := 235
        nObjColun := 270
        nObjLargu := 85
        nObjAltur := 25
        oBtnObj6  := TButton():New(nObjLinha, nObjColun, cBtnObj6, oDialogPvt, bBtnObj6, nObjLargu, nObjAltur, , oFontPadrao, , lDimPixels)

        //objeto7 - usando a classe TButton
        nObjLinha := 235
        nObjColun := 362
        nObjLargu := 85
        nObjAltur := 25
        oBtnObj7  := TButton():New(nObjLinha, nObjColun, cBtnObj7, oDialogPvt, bBtnObj7, nObjLargu, nObjAltur, , oFontPadrao, , lDimPixels)

        //objeto8 - usando a classe TButton
        nObjLinha := 235
        nObjColun := 455
        nObjLargu := 85
        nObjAltur := 25
        oBtnObj8  := TButton():New(nObjLinha, nObjColun, cBtnObj8, oDialogPvt, bBtnObj8, nObjLargu, nObjAltur, , oFontPadrao, , lDimPixels)

        //objeto10 - usando a classe TButton
        nObjLinha := 235
        nObjColun := 547
        nObjLargu := 85
        nObjAltur := 25
        oBtnObj10  := TButton():New(nObjLinha, nObjColun, cBtnObj10, oDialogPvt, bBtnObj10, nObjLargu, nObjAltur, , oFontPadrao, , lDimPixels)

        //IconeVendedor - usando a classe TGet
        nObjLinha := 268
        nObjColun := 185
        nObjLargu := 15
        nObjAltur := 15
        oGetIconeVendedor  := TGet():New(nObjLinha, nObjColun, {|u| Iif(PCount() > 0 , xGetIconeVendedor := u, xGetIconeVendedor)}, oDialogPvt, nObjLargu, nObjAltur, /*cPict*/, /*bValid*/, /*nClrFore*/, /*nClrBack*/, oFontPadrao, , , lDimPixels)
        //oGetIconeVendedor:cPlaceHold := 'Digite aqui um texto...'   //Texto que sera exibido no campo antes de ter conteudo
        //oGetIconeVendedor:cF3        := 'Codigo da consulta padrao' //Codigo da consulta padrao / F3 que sera habilitada
        //oGetIconeVendedor:bValid     := {|| fFuncaoVld()}           //Funcao para validar o que foi digitado
        //oGetIconeVendedor:lReadOnly  := .T.                         //Para permitir o usuario clicar mas nao editar o campo
        //oGetIconeVendedor:lActive    := .F.                         //Para deixar o campo inativo e o usuario nao conseguir nem clicar
        //oGetIconeVendedor:Picture    := '@!'                        //Mascara / Picture do campo

        //IconeCliente - usando a classe TGet
        nObjLinha := 298
        nObjColun := 185
        nObjLargu := 15
        nObjAltur := 15
        oGetIconeCliente  := TGet():New(nObjLinha, nObjColun, {|u| Iif(PCount() > 0 , xGetIconeCliente := u, xGetIconeCliente)}, oDialogPvt, nObjLargu, nObjAltur, /*cPict*/, /*bValid*/, /*nClrFore*/, /*nClrBack*/, oFontPadrao, , , lDimPixels)
        //oGetIconeCliente:cPlaceHold := 'Digite aqui um texto...'   //Texto que sera exibido no campo antes de ter conteudo
        //oGetIconeCliente:cF3        := 'Codigo da consulta padrao' //Codigo da consulta padrao / F3 que sera habilitada
        //oGetIconeCliente:bValid     := {|| fFuncaoVld()}           //Funcao para validar o que foi digitado
        //oGetIconeCliente:lReadOnly  := .T.                         //Para permitir o usuario clicar mas nao editar o campo
        //oGetIconeCliente:lActive    := .F.                         //Para deixar o campo inativo e o usuario nao conseguir nem clicar
        //oGetIconeCliente:Picture    := '@!'                        //Mascara / Picture do campo

        //total - usando a classe TGet
        nObjLinha := 287
        nObjColun := 422
        nObjLargu := 205
        nObjAltur := 25
        oGettotal  := TGet():New(nObjLinha, nObjColun, {|u| Iif(PCount() > 0 , xGettotal := u, xGettotal)}, oDialogPvt, nObjLargu, nObjAltur, /*cPict*/, /*bValid*/, /*nClrFore*/, /*nClrBack*/, oFontPadrao, , , lDimPixels)
        //oGettotal:cPlaceHold := 'Digite aqui um texto...'   //Texto que sera exibido no campo antes de ter conteudo
        //oGettotal:cF3        := 'Codigo da consulta padrao' //Codigo da consulta padrao / F3 que sera habilitada
        //oGettotal:bValid     := {|| fFuncaoVld()}           //Funcao para validar o que foi digitado
        //oGettotal:lReadOnly  := .T.                         //Para permitir o usuario clicar mas nao editar o campo
        //oGettotal:lActive    := .F.                         //Para deixar o campo inativo e o usuario nao conseguir nem clicar
        //oGettotal:Picture    := '@!'                        //Mascara / Picture do campo

        //Getpesquisa - usando a classe TGet
        nObjLinha := 92
        nObjColun := 37
        nObjLargu := 125
        nObjAltur := 15
        oGetGetpesquisa  := TGet():New(nObjLinha, nObjColun, {|u| Iif(PCount() > 0 , xGetGetpesquisa := u, xGetGetpesquisa)}, oDialogPvt, nObjLargu, nObjAltur, /*cPict*/, /*bValid*/, /*nClrFore*/, /*nClrBack*/, oFontPadrao, , , lDimPixels)
        //oGetGetpesquisa:cPlaceHold := 'Digite aqui um texto...'   //Texto que sera exibido no campo antes de ter conteudo
        //oGetGetpesquisa:cF3        := 'Codigo da consulta padrao' //Codigo da consulta padrao / F3 que sera habilitada
        //oGetGetpesquisa:bValid     := {|| fFuncaoVld()}           //Funcao para validar o que foi digitado
        //oGetGetpesquisa:lReadOnly  := .T.                         //Para permitir o usuario clicar mas nao editar o campo
        //oGetGetpesquisa:lActive    := .F.                         //Para deixar o campo inativo e o usuario nao conseguir nem clicar
        //oGetGetpesquisa:Picture    := '@!'                        //Mascara / Picture do campo

        //pesquisa - usando a classe TGet
        nObjLinha := 90
        nObjColun := 7
        nObjLargu := 162
        nObjAltur := 20
        oGetpesquisa  := TGet():New(nObjLinha, nObjColun, {|u| Iif(PCount() > 0 , xGetpesquisa := u, xGetpesquisa)}, oDialogPvt, nObjLargu, nObjAltur, /*cPict*/, /*bValid*/, /*nClrFore*/, /*nClrBack*/, oFontPadrao, , , lDimPixels)
        //oGetpesquisa:cPlaceHold := 'Digite aqui um texto...'   //Texto que sera exibido no campo antes de ter conteudo
        //oGetpesquisa:cF3        := 'Codigo da consulta padrao' //Codigo da consulta padrao / F3 que sera habilitada
        //oGetpesquisa:bValid     := {|| fFuncaoVld()}           //Funcao para validar o que foi digitado
        //oGetpesquisa:lReadOnly  := .T.                         //Para permitir o usuario clicar mas nao editar o campo
        //oGetpesquisa:lActive    := .F.                         //Para deixar o campo inativo e o usuario nao conseguir nem clicar
        //oGetpesquisa:Picture    := '@!'                        //Mascara / Picture do campo

        //fotoProduto - usando a classe TGet
        nObjLinha := 150
        nObjColun := 49
        nObjLargu := 80
        nObjAltur := 80
        oGetfotoProduto  := TGet():New(nObjLinha, nObjColun, {|u| Iif(PCount() > 0 , xGetfotoProduto := u, xGetfotoProduto)}, oDialogPvt, nObjLargu, nObjAltur, /*cPict*/, /*bValid*/, /*nClrFore*/, /*nClrBack*/, oFontPadrao, , , lDimPixels)
        //oGetfotoProduto:cPlaceHold := 'Digite aqui um texto...'   //Texto que sera exibido no campo antes de ter conteudo
        //oGetfotoProduto:cF3        := 'Codigo da consulta padrao' //Codigo da consulta padrao / F3 que sera habilitada
        //oGetfotoProduto:bValid     := {|| fFuncaoVld()}           //Funcao para validar o que foi digitado
        //oGetfotoProduto:lReadOnly  := .T.                         //Para permitir o usuario clicar mas nao editar o campo
        //oGetfotoProduto:lActive    := .F.                         //Para deixar o campo inativo e o usuario nao conseguir nem clicar
        //oGetfotoProduto:Picture    := '@!'                        //Mascara / Picture do campo

        //DescrProduto - usando a classe TGet
        nObjLinha := 235
        nObjColun := 12
        nObjLargu := 152
        nObjAltur := 15
        oGetDescrProduto  := TGet():New(nObjLinha, nObjColun, {|u| Iif(PCount() > 0 , xGetDescrProduto := u, xGetDescrProduto)}, oDialogPvt, nObjLargu, nObjAltur, /*cPict*/, /*bValid*/, /*nClrFore*/, /*nClrBack*/, oFontPadrao, , , lDimPixels)
        //oGetDescrProduto:cPlaceHold := 'Digite aqui um texto...'   //Texto que sera exibido no campo antes de ter conteudo
        //oGetDescrProduto:cF3        := 'Codigo da consulta padrao' //Codigo da consulta padrao / F3 que sera habilitada
        //oGetDescrProduto:bValid     := {|| fFuncaoVld()}           //Funcao para validar o que foi digitado
        //oGetDescrProduto:lReadOnly  := .T.                         //Para permitir o usuario clicar mas nao editar o campo
        //oGetDescrProduto:lActive    := .F.                         //Para deixar o campo inativo e o usuario nao conseguir nem clicar
        //oGetDescrProduto:Picture    := '@!'                        //Mascara / Picture do campo

        //valProduto - usando a classe TGet
        nObjLinha := 295
        nObjColun := 72
        nObjLargu := 92
        nObjAltur := 15
        oGetvalProduto  := TGet():New(nObjLinha, nObjColun, {|u| Iif(PCount() > 0 , xGetvalProduto := u, xGetvalProduto)}, oDialogPvt, nObjLargu, nObjAltur, /*cPict*/, /*bValid*/, /*nClrFore*/, /*nClrBack*/, oFontPadrao, , , lDimPixels)
        //oGetvalProduto:cPlaceHold := 'Digite aqui um texto...'   //Texto que sera exibido no campo antes de ter conteudo
        //oGetvalProduto:cF3        := 'Codigo da consulta padrao' //Codigo da consulta padrao / F3 que sera habilitada
        //oGetvalProduto:bValid     := {|| fFuncaoVld()}           //Funcao para validar o que foi digitado
        //oGetvalProduto:lReadOnly  := .T.                         //Para permitir o usuario clicar mas nao editar o campo
        //oGetvalProduto:lActive    := .F.                         //Para deixar o campo inativo e o usuario nao conseguir nem clicar
        //oGetvalProduto:Picture    := '@!'                        //Mascara / Picture do campo

        //InfoProduto - usando a classe TGet
        nObjLinha := 255
        nObjColun := 12
        nObjLargu := 152
        nObjAltur := 55
        oGetInfoProduto  := TGet():New(nObjLinha, nObjColun, {|u| Iif(PCount() > 0 , xGetInfoProduto := u, xGetInfoProduto)}, oDialogPvt, nObjLargu, nObjAltur, /*cPict*/, /*bValid*/, /*nClrFore*/, /*nClrBack*/, oFontPadrao, , , lDimPixels)
        //oGetInfoProduto:cPlaceHold := 'Digite aqui um texto...'   //Texto que sera exibido no campo antes de ter conteudo
        //oGetInfoProduto:cF3        := 'Codigo da consulta padrao' //Codigo da consulta padrao / F3 que sera habilitada
        //oGetInfoProduto:bValid     := {|| fFuncaoVld()}           //Funcao para validar o que foi digitado
        //oGetInfoProduto:lReadOnly  := .T.                         //Para permitir o usuario clicar mas nao editar o campo
        //oGetInfoProduto:lActive    := .F.                         //Para deixar o campo inativo e o usuario nao conseguir nem clicar
        //oGetInfoProduto:Picture    := '@!'                        //Mascara / Picture do campo

        //Produto - usando a classe TGet
        nObjLinha := 117
        nObjColun := 7
        nObjLargu := 162
        nObjAltur := 197
        oGetProduto  := TGet():New(nObjLinha, nObjColun, {|u| Iif(PCount() > 0 , xGetProduto := u, xGetProduto)}, oDialogPvt, nObjLargu, nObjAltur, /*cPict*/, /*bValid*/, /*nClrFore*/, /*nClrBack*/, oFontPadrao, , , lDimPixels)
        //oGetProduto:cPlaceHold := 'Digite aqui um texto...'   //Texto que sera exibido no campo antes de ter conteudo
        //oGetProduto:cF3        := 'Codigo da consulta padrao' //Codigo da consulta padrao / F3 que sera habilitada
        //oGetProduto:bValid     := {|| fFuncaoVld()}           //Funcao para validar o que foi digitado
        //oGetProduto:lReadOnly  := .T.                         //Para permitir o usuario clicar mas nao editar o campo
        //oGetProduto:lActive    := .F.                         //Para deixar o campo inativo e o usuario nao conseguir nem clicar
        //oGetProduto:Picture    := '@!'                        //Mascara / Picture do campo

        //nomeVendedor - usando a classe TSay
        nObjLinha := 267
        nObjColun := 206
        nObjLargu := 190
        nObjAltur := 15
        oSaynomeVendedor  := TSay():New(nObjLinha, nObjColun, {|| cSaynomeVendedor}, oDialogPvt, /*cPicture*/, oFontPadrao, , , , lDimPixels, /*nClrText*/, /*nClrBack*/, nObjLargu, nObjAltur, , , , , , /*lHTML*/)

        //Vendedor - usando a classe TGet
        nObjLinha := 265
        nObjColun := 177
        nObjLargu := 235
        nObjAltur := 22
        oGetVendedor  := TGet():New(nObjLinha, nObjColun, {|u| Iif(PCount() > 0 , xGetVendedor := u, xGetVendedor)}, oDialogPvt, nObjLargu, nObjAltur, /*cPict*/, /*bValid*/, /*nClrFore*/, /*nClrBack*/, oFontPadrao, , , lDimPixels)
        //oGetVendedor:cPlaceHold := 'Digite aqui um texto...'   //Texto que sera exibido no campo antes de ter conteudo
        //oGetVendedor:cF3        := 'Codigo da consulta padrao' //Codigo da consulta padrao / F3 que sera habilitada
        //oGetVendedor:bValid     := {|| fFuncaoVld()}           //Funcao para validar o que foi digitado
        //oGetVendedor:lReadOnly  := .T.                         //Para permitir o usuario clicar mas nao editar o campo
        //oGetVendedor:lActive    := .F.                         //Para deixar o campo inativo e o usuario nao conseguir nem clicar
        //oGetVendedor:Picture    := '@!'                        //Mascara / Picture do campo

        //nomeCliente - usando a classe TSay
        nObjLinha := 298
        nObjColun := 205
        nObjLargu := 190
        nObjAltur := 15
        oSaynomeCliente  := TSay():New(nObjLinha, nObjColun, {|| cSaynomeCliente}, oDialogPvt, /*cPicture*/, oFontPadrao, , , , lDimPixels, /*nClrText*/, /*nClrBack*/, nObjLargu, nObjAltur, , , , , , /*lHTML*/)

        //Cliente - usando a classe TGet
        nObjLinha := 295
        nObjColun := 177
        nObjLargu := 235
        nObjAltur := 22
        oGetCliente  := TGet():New(nObjLinha, nObjColun, {|u| Iif(PCount() > 0 , xGetCliente := u, xGetCliente)}, oDialogPvt, nObjLargu, nObjAltur, /*cPict*/, /*bValid*/, /*nClrFore*/, /*nClrBack*/, oFontPadrao, , , lDimPixels)
        //oGetCliente:cPlaceHold := 'Digite aqui um texto...'   //Texto que sera exibido no campo antes de ter conteudo
        //oGetCliente:cF3        := 'Codigo da consulta padrao' //Codigo da consulta padrao / F3 que sera habilitada
        //oGetCliente:bValid     := {|| fFuncaoVld()}           //Funcao para validar o que foi digitado
        //oGetCliente:lReadOnly  := .T.                         //Para permitir o usuario clicar mas nao editar o campo
        //oGetCliente:lActive    := .F.                         //Para deixar o campo inativo e o usuario nao conseguir nem clicar
        //oGetCliente:Picture    := '@!'                        //Mascara / Picture do campo

        //Subtotal - usando a classe TGet
        nObjLinha := 270
        nObjColun := 423
        nObjLargu := 85
        nObjAltur := 12
        oGetSubtotal  := TGet():New(nObjLinha, nObjColun, {|u| Iif(PCount() > 0 , xGetSubtotal := u, xGetSubtotal)}, oDialogPvt, nObjLargu, nObjAltur, /*cPict*/, /*bValid*/, /*nClrFore*/, /*nClrBack*/, oFontPadrao, , , lDimPixels)
        //oGetSubtotal:cPlaceHold := 'Digite aqui um texto...'   //Texto que sera exibido no campo antes de ter conteudo
        //oGetSubtotal:cF3        := 'Codigo da consulta padrao' //Codigo da consulta padrao / F3 que sera habilitada
        //oGetSubtotal:bValid     := {|| fFuncaoVld()}           //Funcao para validar o que foi digitado
        //oGetSubtotal:lReadOnly  := .T.                         //Para permitir o usuario clicar mas nao editar o campo
        //oGetSubtotal:lActive    := .F.                         //Para deixar o campo inativo e o usuario nao conseguir nem clicar
        //oGetSubtotal:Picture    := '@!'                        //Mascara / Picture do campo

        //Desconto - usando a classe TGet
        nObjLinha := 270
        nObjColun := 542
        nObjLargu := 85
        nObjAltur := 12
        oGetDesconto  := TGet():New(nObjLinha, nObjColun, {|u| Iif(PCount() > 0 , xGetDesconto := u, xGetDesconto)}, oDialogPvt, nObjLargu, nObjAltur, /*cPict*/, /*bValid*/, /*nClrFore*/, /*nClrBack*/, oFontPadrao, , , lDimPixels)
        //oGetDesconto:cPlaceHold := 'Digite aqui um texto...'   //Texto que sera exibido no campo antes de ter conteudo
        //oGetDesconto:cF3        := 'Codigo da consulta padrao' //Codigo da consulta padrao / F3 que sera habilitada
        //oGetDesconto:bValid     := {|| fFuncaoVld()}           //Funcao para validar o que foi digitado
        //oGetDesconto:lReadOnly  := .T.                         //Para permitir o usuario clicar mas nao editar o campo
        //oGetDesconto:lActive    := .F.                         //Para deixar o campo inativo e o usuario nao conseguir nem clicar
        //oGetDesconto:Picture    := '@!'                        //Mascara / Picture do campo

        //Resumo - usando a classe TGet
        nObjLinha := 265
        nObjColun := 418
        nObjLargu := 215
        nObjAltur := 52
        oGetResumo  := TGet():New(nObjLinha, nObjColun, {|u| Iif(PCount() > 0 , xGetResumo := u, xGetResumo)}, oDialogPvt, nObjLargu, nObjAltur, /*cPict*/, /*bValid*/, /*nClrFore*/, /*nClrBack*/, oFontPadrao, , , lDimPixels)
        //oGetResumo:cPlaceHold := 'Digite aqui um texto...'   //Texto que sera exibido no campo antes de ter conteudo
        //oGetResumo:cF3        := 'Codigo da consulta padrao' //Codigo da consulta padrao / F3 que sera habilitada
        //oGetResumo:bValid     := {|| fFuncaoVld()}           //Funcao para validar o que foi digitado
        //oGetResumo:lReadOnly  := .T.                         //Para permitir o usuario clicar mas nao editar o campo
        //oGetResumo:lActive    := .F.                         //Para deixar o campo inativo e o usuario nao conseguir nem clicar
        //oGetResumo:Picture    := '@!'                        //Mascara / Picture do campo

        //listProduto - usando a classe TMultiGet
        nObjLinha := 35
        nObjColun := 182
        nObjLargu := 445
        nObjAltur := 190
        oMullistProduto  := TMultiGet():New(nObjLinha, nObjColun, {|u| Iif(PCount() > 0 , cMullistProduto := u, cMullistProduto)}, oDialogPvt, nObjLargu, nObjAltur, oFontPadrao, , , , , lDimPixels, , , /*bWhen*/, , , /*lReadOnly*/, /*bValid*/, , , /*lNoBorder*/, .T.)

        //ProdutosVenda - usando a classe TGet
        nObjLinha := 7
        nObjColun := 177
        nObjLargu := 455
        nObjAltur := 222
        oGetProdutosVenda  := TGet():New(nObjLinha, nObjColun, {|u| Iif(PCount() > 0 , xGetProdutosVenda := u, xGetProdutosVenda)}, oDialogPvt, nObjLargu, nObjAltur, /*cPict*/, /*bValid*/, /*nClrFore*/, /*nClrBack*/, oFontPadrao, , , lDimPixels)
        //oGetProdutosVenda:cPlaceHold := 'Digite aqui um texto...'   //Texto que sera exibido no campo antes de ter conteudo
        //oGetProdutosVenda:cF3        := 'Codigo da consulta padrao' //Codigo da consulta padrao / F3 que sera habilitada
        //oGetProdutosVenda:bValid     := {|| fFuncaoVld()}           //Funcao para validar o que foi digitado
        //oGetProdutosVenda:lReadOnly  := .T.                         //Para permitir o usuario clicar mas nao editar o campo
        //oGetProdutosVenda:lActive    := .F.                         //Para deixar o campo inativo e o usuario nao conseguir nem clicar
        //oGetProdutosVenda:Picture    := '@!'                        //Mascara / Picture do campo

    
    //Ativa e exibe a janela
    oDialogPvt:Activate(, , , lCentraliz, , , bBlocoIni)
    
    FWRestArea(aArea)
Return
