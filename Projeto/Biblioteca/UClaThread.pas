unit UClaThread;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes;

type
  TProcesso = class(TThread)
  private
    FAux : String;
  public
    procedure Execute; override;
    procedure Sincronizar;
end;

implementation

procedure TProcesso.Execute;
var I : Integer;
begin
  inherited;
  for I := 0 to 1000 do
  begin
    FAux := 'Valor = ' + I.ToString;
    Self.Queue(Self.Sincronizar);
  end;
end;

procedure TProcesso.Sincronizar;
begin
end;

end.

