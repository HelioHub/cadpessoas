unit ServerMethodsWK;

interface

uses System.SysUtils, System.Classes, System.Json,
    Datasnap.DSServer, Datasnap.DSAuth, DataSnap.DSProviderDataModuleAdapter,
  FireDAC.Stan.StorageBin, FireDAC.Stan.StorageJSON, Data.FireDACJSONReflect, UClaPessoa;

type
{$METHODINFO ON}
  TServerMethods_WK = class(TDataModule)
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
  private
    { Private declarations }
    procedure PreparePessoa(const IDPessoa : string = ''; const SLimit : String = '');
    function GetProximoCodigoPessoal: String;
  public
    { Public declarations }
    function GetPessoa(const IDPessoa: string; const SLimit: string): TFDJSONDataSets;
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;

    procedure InsertPessoa(const oPessoa : TPessoa);
  end;
{$METHODINFO OFF}

Const
  sSQLPessoaSelect = 'SELECT A.idpessoa, A.dsdocumento, A.nmprimeiro, A.nmsegundo, A.dtregistro, A.flnatureza, ' +
                     'B.dscep, B.dsnumero, ' +
                     'C.nmlogradouro, C.nmbairro, C.dscomplemento, C.nmcidade, C.dsuf ' +
                     'FROM pessoa A ' +
                     'LEFT JOIN endereco B            ON B.idpessoa = A.idpessoa ' +
                     'LEFT JOIN endereco_integracao C ON C.idendereco = B.idendereco ';

  sSQLPessoaWhere = 'WHERE A.idpessoa = ';
  sSQLPessoaOrder = 'ORDER BY A.idpessoa ';
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
var sSQL: string;
begin
  sSQL := sSQLPessoaSelect;

  if not IDPessoa.IsEmpty then
    sSQL := sSQL + sSQLPessoaWhere + IDPessoa;

  sSQL := sSQL + sSQLPessoaOrder + IDPessoa;

  if not SLimit.IsEmpty then
    sSQL := sSQL + sSQLLimit + SLimit;

  DataModuleWK.WKPessoa.Active   := False;
  DataModuleWK.WKPessoa.SQL.Text := sSQL;
end;

function TServerMethods_WK.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

procedure TServerMethods_WK.InsertPessoa(const oPessoa: TPessoa);
var sSQL, sSequencial: string;
begin
  DataModuleWK.WKConnection.StartTransaction;
  try
     sSequencial := GetProximoCodigoPessoal;
     sSQL := 'INSERT INTO PESSOA (idpessoa, dsdocumento, nmprimeiro, nmsegundo, dtregistro, flnatureza) '+
             ' VALUES ('+sSequencial+', '+
                         QuotedStr(oPessoa.dsdocumento)+', '+
                         QuotedStr(oPessoa.nmprimeiro) +', '+
                         QuotedStr(oPessoa.nmsegundo)  +', '+
	                      '(SELECT CURRENT_DATE), '+
                         QuotedStr(oPessoa.flnatureza) +') ';

    DataModuleWK.WKConnection.ExecSQL(sSQL);
    DataModuleWK.WKConnection.Commit;
  except
    on E: Exception do
    begin
      DataModuleWK.WKConnection.Rollback;
      raise Exception.Create('Error Message: ' + E.Message);
    end;
  end;
end;


function TServerMethods_WK.GetProximoCodigoPessoal: String;
begin
  {Recupera o pr�ximo c�digo sequencial para o cadastro de pessoas}
  try
    DataModuleWK.WKSequencial.Close;
    DataModuleWK.WKSequencial.SQL.Text := 'SELECT (COALESCE(MAX(idpessoa),0)+1) AS SEQUENCIAL FROM PESSOA';
    DataModuleWK.WKSequencial.Open;
    Result := DataModuleWK.WKSequencial.FieldByName('SEQUENCIAL').AsString;
  finally
    DataModuleWK.WKSequencial.Close;
  end;
end;


end.

