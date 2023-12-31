unit UClaIni;

interface

uses
  SysUtils, Classes, IniFiles;

type

  TClaIni = class
    class function LerIni(StrArquivo, StrTabela, StrCampo : string) : string;
    class function GravaIni(StrArquivo, StrTabela, StrCampo, StrValor : string) : string;
  end;

implementation

{ TClaIni }

uses ConstWK;

class function TClaIni.LerIni(StrArquivo, StrTabela, StrCampo : string) : string;
var ServerIni: TIniFile;
    Caminho: String;
begin
  Caminho := ExtractFileDir(GetCurrentDir);
  StrArquivo := Caminho + StrArquivo;
  if not FileExists(StrArquivo) then
    GravaIni(StrArquivo, cTabServerINI, cCamServerINI, cHostServidorWK);

  ServerIni := TIniFile.Create(StrArquivo);
  try
    Result := ServerIni.ReadString(StrTabela, StrCampo, cHostServidorWK);
  finally
    ServerIni.Free;
  end;
end;

class function TClaIni.GravaIni(StrArquivo, StrTabela, StrCampo, StrValor : string) : string;
var ServerIni: TIniFile;
begin
  ServerIni := TIniFile.Create(StrArquivo);
  try
    ServerIni.WriteString(StrTabela, StrCampo, StrValor);
    ServerIni.UpdateFile;
  finally
    ServerIni.Free;
  end;
end;

end.
