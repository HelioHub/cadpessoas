unit ConstWK;

interface

type
  TAcao = (tacIncluir, tacAlterar, tacExcluir, tacConsultar);
  TSexo = (M, F);

const
  curlWK = 'https://wktechnology.com.br/';
  cHostServidorWK = '127.0.0.1';
  cEOL = #13;
  cTabServerINI = 'SERVIDOR';
  cCamServerINI = 'HOST';
  cArquivoConnection = 'Connection.Data';
  cMensagemConexaoServer = 'Servidor DataSnap n�o dispon�vel. '+ cEOL + 'Mensagem de Erro: ' + cEOL;
  cCidadePadrao = 'Fortaleza';
  cUFPadrao = 'CE';
  cAcaoAlterar = '&Alterar';
  cAcaoIncluir = 'Incluir';
  cSexoM = 'M';
  cSexoF = 'F';

implementation

end.
