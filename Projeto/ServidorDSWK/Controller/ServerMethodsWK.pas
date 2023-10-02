unit ServerMethodsWK;

interface

uses System.SysUtils, System.Classes, System.Json,
    Datasnap.DSServer, Datasnap.DSAuth, DataSnap.DSProviderDataModuleAdapter,
  FireDAC.Stan.StorageBin, FireDAC.Stan.StorageJSON, Data.FireDACJSONReflect;

type
{$METHODINFO ON}
  TServerMethods_WK = class(TDataModule)
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
  private
    { Private declarations }
    procedure PreparePessoa(const IDPessoa: string = '');
  public
    { Public declarations }
    function GetPessoa(const IDPessoa: string): TFDJSONDataSets;
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
  end;
{$METHODINFO OFF}

implementation


{$R *.dfm}


uses System.StrUtils, UDMBanco;

function TServerMethods_WK.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TServerMethods_WK.GetPessoa(const IDPessoa: string): TFDJSONDataSets;
begin
  PreparePessoa(IDPessoa);

  Result := TFDJSONDataSets.Create;
  TFDJSONDataSetsWriter.ListAdd(Result, DataModuleWK.WKPessoa);
end;

procedure TServerMethods_WK.PreparePessoa(const IDPessoa: string = '');
var
  sSQL: string;
begin
  sSQL := 'SELECT * FROM PESSOA';
  sSQL := sSQL + ' ORDER BY IDPESSOA';
  if not IDPessoa.IsEmpty then
    sSQL := sSQL + ' LIMIT ' + IDPessoa;

  DataModuleWK.WKPessoa.Active   := False;
  DataModuleWK.WKPessoa.SQL.Text := sSQL;
end;

function TServerMethods_WK.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

end.

