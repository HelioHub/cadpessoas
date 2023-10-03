unit ServerMethodsWK;

interface

uses System.SysUtils, System.Classes, System.Json,
     Datasnap.DSServer, Datasnap.DSAuth, DataSnap.DSProviderDataModuleAdapter,
     FireDAC.Stan.StorageBin, FireDAC.Stan.StorageJSON, Data.FireDACJSONReflect,
     Rest.JSON, UClaPessoa, ConstWK;

type
{$METHODINFO ON}
  TServerMethods_WK = class(TDataModule)
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
  private
    { Private declarations }
    procedure PreparePessoa(const IDPessoa : string = ''; const SLimit : String = '');
    //Pessoa
    function GetProximoCodigoPessoa: String;
    function GetProximoCodigoEndereco: String;

    procedure InsertPessoa(const oPessoa: TPessoa);
    procedure UpdatePessoa(const oPessoa: TPessoa);
    procedure DeletePessoa(const oPessoa: TPessoa);
  public
    { Public declarations }
    function GetPessoa(const IDPessoa: string; const SLimit: string): TFDJSONDataSets;
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;

    procedure PersistenciaPessoa(const jObjectPessoa: TJSONObject);
  end;
{$METHODINFO OFF}

Const
  sSQLPessoaSelect = 'SELECT A.idpessoa, A.dsdocumento, A.nmprimeiro, A.nmsegundo, A.dtregistro, A.flnatureza, ' +
                     'B.idendereco, B.dscep, B.dsnumero, ' +
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

function TServerMethods_WK.GetProximoCodigoPessoa: String;
begin
  {Recupera o pr�ximo c�digo sequencial da entity pessoa}
  try
    DataModuleWK.WKSequencial.Close;
    DataModuleWK.WKSequencial.SQL.Text := 'SELECT (COALESCE(MAX(idpessoa),0)+1) AS SEQUENCIAL FROM PESSOA';
    DataModuleWK.WKSequencial.Open;
    Result := DataModuleWK.WKSequencial.FieldByName('SEQUENCIAL').AsString;
  finally
    DataModuleWK.WKSequencial.Close;
  end;
end;

function TServerMethods_WK.GetProximoCodigoEndereco: String;
begin
  {Recupera o pr�ximo c�digo sequencial da entity Endere�c}
  try
    DataModuleWK.WKSequencial.Close;
    DataModuleWK.WKSequencial.SQL.Text := 'SELECT (COALESCE(MAX(idendereco),0)+1) AS SEQUENCIAL FROM ENDERECO_INTEGRACAO ';
    DataModuleWK.WKSequencial.Open;
    Result := DataModuleWK.WKSequencial.FieldByName('SEQUENCIAL').AsString;
  finally
    DataModuleWK.WKSequencial.Close;
  end;
end;

procedure TServerMethods_WK.PersistenciaPessoa(const jObjectPessoa: TJSONObject);
var oPessoa: TPessoa;
begin
  try
    oPessoa := TJson.JsonToObject<TPessoa>(jObjectPessoa);

    DataModuleWK.WKConnection.StartTransaction;
    try
      case oPessoa.acao of
         acIncluir: InsertPessoa(oPessoa);
         acAlterar: UpdatePessoa(oPessoa);
         acExcluir: DeletePessoa(oPessoa);
      end;

      DataModuleWK.WKConnection.Commit;
    except
      on E: Exception do
      begin
        DataModuleWK.WKConnection.Rollback;
        raise Exception.Create('Error Message: ' + E.Message);
      end;
    end;
  finally
    FreeAndNil(oPessoa);
  end;
end;

procedure TServerMethods_WK.InsertPessoa(const oPessoa: TPessoa);
var sSQL, sSequencialPessoa, sSequencialEndereco: string;
begin
  sSequencialPessoa := GetProximoCodigoPessoa;
  sSQL := 'INSERT INTO PESSOA (idpessoa, dsdocumento, nmprimeiro, nmsegundo, dtregistro, flnatureza) '+
          ' VALUES ('+sSequencialPessoa             +', '+
                      QuotedStr(oPessoa.dsdocumento)+', '+
                      QuotedStr(oPessoa.nmprimeiro) +', '+
                      QuotedStr(oPessoa.nmsegundo)  +', '+
                     '(SELECT CURRENT_DATE), '+
                      QuotedStr(oPessoa.flnatureza) +') ';
  DataModuleWK.WKConnection.ExecSQL(sSQL);

  sSequencialEndereco := GetProximoCodigoEndereco;
  sSQL := 'INSERT INTO ENDERECO (idendereco, idpessoa, dscep, dsnumero) '+
          ' VALUES ('+sSequencialEndereco           +', '+
                      sSequencialPessoa             +', '+
                      QuotedStr(oPessoa.CEP.dscep)  +', '+
                      IntToStr(oPessoa.CEP.dsnumero)+') ';
  DataModuleWK.WKConnection.ExecSQL(sSQL);

  sSQL := 'INSERT INTO ENDERECO_INTEGRACAO (idendereco, dsuf, nmcidade, nmbairro, nmlogradouro, dscomplemento) '+
          ' VALUES ('+sSequencialEndereco                             +', '+
                      QuotedStr(oPessoa.CEP.idendereco.dsuf)          +', '+
                      QuotedStr(oPessoa.CEP.idendereco.nmcidade)      +', '+
                      QuotedStr(oPessoa.CEP.idendereco.nmbairro)      +', '+
                      QuotedStr(oPessoa.CEP.idendereco.nmlogradouro)  +', '+
                      QuotedStr(oPessoa.CEP.idendereco.dscomplemento) +')';
  DataModuleWK.WKConnection.ExecSQL(sSQL);
end;

procedure TServerMethods_WK.UpdatePessoa(const oPessoa: TPessoa);
var sSQL: string;
begin
  sSQL := 'DELETE FROM PESSOA '+
          'WHERE idpessoa = '+IntToStr(oPessoa.idpessoa);
  DataModuleWK.WKConnection.ExecSQL(sSQL);
end;

procedure TServerMethods_WK.DeletePessoa(const oPessoa: TPessoa);
var sSQL: string;
begin
  sSQL := 'DELETE FROM PESSOA '+
          'WHERE idpessoa = '+IntToStr(oPessoa.idpessoa);
  DataModuleWK.WKConnection.ExecSQL(sSQL);
end;

end.

