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
    procedure PreparePessoa(const IDPessoa : string = ''; const SLimit : String = '');
  public
    { Public declarations }
    function GetPessoa(const IDPessoa: string; const SLimit: string): TFDJSONDataSets;
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
  end;
{$METHODINFO OFF}

Const
  sSQLPessoa = 'SELECT A.idpessoa, A.dsdocumento, A.nmprimeiro, A.nmsegundo, A.dtregistro, A.flnatureza,' +
               'B.dscep, B.dsnumero, ' +
        	     'C.nmlogradouro, C.nmbairro, C.dscomplemento, C.nmcidade, C.dsuf ' +
               'FROM pessoa A ' +
               'LEFT JOIN endereco B            ON B.idpessoa = A.idpessoa ' +
               'LEFT JOIN endereco_integracao C ON C.idendereco = B.idendereco ';

  sSQLWhere = 'WHERE A.idpessoa = ';
  sSQLOrder = 'ORDER BY A.idpessoa ';
  sSQLLimit = 'LIMIT ';

implementation

{$R *.dfm}

uses System.StrUtils, UDMBanco;

function TServerMethods_WK.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TServerMethods_WK.GetPessoa(const IDPessoa: string; const SLimit: string): TFDJSONDataSets;
begin
  PreparePessoa(IDPessoa, SLimit);

  Result := TFDJSONDataSets.Create;
  TFDJSONDataSetsWriter.ListAdd(Result, DataModuleWK.WKPessoa);
end;

procedure TServerMethods_WK.PreparePessoa(const IDPessoa : string = ''; const SLimit : String = '');
var
  sSQL: string;
begin
  sSQL := sSQLPessoa;

  if not IDPessoa.IsEmpty then
    sSQL := sSQL + sSQLWhere + IDPessoa;

  sSQL := sSQL + sSQLOrder + IDPessoa;

  if not SLimit.IsEmpty then
    sSQL := sSQL + sSQLLimit + SLimit;

  DataModuleWK.WKPessoa.Active   := False;
  DataModuleWK.WKPessoa.SQL.Text := sSQL;
end;

function TServerMethods_WK.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

end.

