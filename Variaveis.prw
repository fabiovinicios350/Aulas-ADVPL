#INCLUDE 'TOTVS.CH'
//Noese
User Function Tipos()
  Local cNome   := 'Fabio'
  Local nIdade  := 18
  Local dNasc   := CTOD('12/18/1998')
  Local aCores  := {'Preto, ','Branco, ','Azul'} 

  FwAlertInfo('Nome: '+cNome+CRLF+;
              'Idade: '+CVALTOCHAR( nIdade )+CRLF+;
              'Nascimento: '+DTOC( dNasc )+CRLF+;
              'Cores: '+aCores[1]+aCores[2]+aCores[3],'Dados Pessoais')

  FwAlertError('Nome: '+cNome+CRLF+;
              'Idade: '+CVALTOCHAR( nIdade )+CRLF+;
              'Nascimento: '+DTOC( dNasc )+CRLF+;
              'Cores: '+aCores[1]+aCores[2]+aCores[3],'Dados Pessoais')
              
  FwAlertSuccess('Nome: '+cNome+CRLF+;
              'Idade: '+CVALTOCHAR( nIdade )+CRLF+;
              'Nascimento: '+DTOC( dNasc )+CRLF+;
              'Cores: '+aCores[1]+aCores[2]+aCores[3],'Dados Pessoais')
Return


