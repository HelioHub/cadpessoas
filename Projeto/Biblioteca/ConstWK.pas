unit ConstWK;

interface

type
  TAcao = (acIncluir, acAlterar, acExcluir, acConsultar);
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
  cAcaoAlterar = 'Alterar';
  cAcaoIncluir = 'Incluir';
  cAcaoExcluir = 'Excluir';
  cSexoM = 'M';
  cSexoF = 'F';
  Empty = '';
  cZero = 0;

implementation

end.
