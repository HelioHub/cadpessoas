//
// Created by the DataSnap proxy generator.
// 05/10/2023 13:04:21
//

unit ClientClassesWK;

interface

uses System.JSON, Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.FireDACJSONReflect, Data.DBXJSONReflect;

type

  IDSRestCachedTFDJSONDataSets = interface;

  TServerMethods_WKClient = class(TDSAdminRestClient)
  private
    FGetPessoaCommand: TDSRestCommand;
    FGetPessoaCommand_Cache: TDSRestCommand;
    FGetDocumentoCommand: TDSRestCommand;
    FEchoStringCommand: TDSRestCommand;
    FReverseStringCommand: TDSRestCommand;
    FPersistenciaPessoaCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function GetPessoa(IDPessoa: string; SLimit: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function GetPessoa_Cache(IDPessoa: string; SLimit: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function GetDocumento(Documento: string; idPessoa: string; const ARequestFilter: string = ''): string;
    function EchoString(Value: string; const ARequestFilter: string = ''): string;
    function ReverseString(Value: string; const ARequestFilter: string = ''): string;
    procedure PersistenciaPessoa(jObjectPessoa: TJSONObject);
  end;

  IDSRestCachedTFDJSONDataSets = interface(IDSRestCachedObject<TFDJSONDataSets>)
  end;

  TDSRestCachedTFDJSONDataSets = class(TDSRestCachedObject<TFDJSONDataSets>, IDSRestCachedTFDJSONDataSets, IDSRestCachedCommand)
  end;

const
  TServerMethods_WK_GetPessoa: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'IDPessoa'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'SLimit'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerMethods_WK_GetPessoa_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'IDPessoa'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'SLimit'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMethods_WK_GetDocumento: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'Documento'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'idPessoa'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerMethods_WK_EchoString: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerMethods_WK_ReverseString: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerMethods_WK_PersistenciaPessoa: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'jObjectPessoa'; Direction: 1; DBXType: 37; TypeName: 'TJSONObject')
  );

implementation

function TServerMethods_WKClient.GetPessoa(IDPessoa: string; SLimit: string; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FGetPessoaCommand = nil then
  begin
    FGetPessoaCommand := FConnection.CreateCommand;
    FGetPessoaCommand.RequestType := 'GET';
    FGetPessoaCommand.Text := 'TServerMethods_WK.GetPessoa';
    FGetPessoaCommand.Prepare(TServerMethods_WK_GetPessoa);
  end;
  FGetPessoaCommand.Parameters[0].Value.SetWideString(IDPessoa);
  FGetPessoaCommand.Parameters[1].Value.SetWideString(SLimit);
  FGetPessoaCommand.Execute(ARequestFilter);
  if not FGetPessoaCommand.Parameters[2].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetPessoaCommand.Parameters[2].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FGetPessoaCommand.Parameters[2].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetPessoaCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethods_WKClient.GetPessoa_Cache(IDPessoa: string; SLimit: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FGetPessoaCommand_Cache = nil then
  begin
    FGetPessoaCommand_Cache := FConnection.CreateCommand;
    FGetPessoaCommand_Cache.RequestType := 'GET';
    FGetPessoaCommand_Cache.Text := 'TServerMethods_WK.GetPessoa';
    FGetPessoaCommand_Cache.Prepare(TServerMethods_WK_GetPessoa_Cache);
  end;
  FGetPessoaCommand_Cache.Parameters[0].Value.SetWideString(IDPessoa);
  FGetPessoaCommand_Cache.Parameters[1].Value.SetWideString(SLimit);
  FGetPessoaCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FGetPessoaCommand_Cache.Parameters[2].Value.GetString);
end;

function TServerMethods_WKClient.GetDocumento(Documento: string; idPessoa: string; const ARequestFilter: string): string;
begin
  if FGetDocumentoCommand = nil then
  begin
    FGetDocumentoCommand := FConnection.CreateCommand;
    FGetDocumentoCommand.RequestType := 'GET';
    FGetDocumentoCommand.Text := 'TServerMethods_WK.GetDocumento';
    FGetDocumentoCommand.Prepare(TServerMethods_WK_GetDocumento);
  end;
  FGetDocumentoCommand.Parameters[0].Value.SetWideString(Documento);
  FGetDocumentoCommand.Parameters[1].Value.SetWideString(idPessoa);
  FGetDocumentoCommand.Execute(ARequestFilter);
  Result := FGetDocumentoCommand.Parameters[2].Value.GetWideString;
end;

function TServerMethods_WKClient.EchoString(Value: string; const ARequestFilter: string): string;
begin
  if FEchoStringCommand = nil then
  begin
    FEchoStringCommand := FConnection.CreateCommand;
    FEchoStringCommand.RequestType := 'GET';
    FEchoStringCommand.Text := 'TServerMethods_WK.EchoString';
    FEchoStringCommand.Prepare(TServerMethods_WK_EchoString);
  end;
  FEchoStringCommand.Parameters[0].Value.SetWideString(Value);
  FEchoStringCommand.Execute(ARequestFilter);
  Result := FEchoStringCommand.Parameters[1].Value.GetWideString;
end;

function TServerMethods_WKClient.ReverseString(Value: string; const ARequestFilter: string): string;
begin
  if FReverseStringCommand = nil then
  begin
    FReverseStringCommand := FConnection.CreateCommand;
    FReverseStringCommand.RequestType := 'GET';
    FReverseStringCommand.Text := 'TServerMethods_WK.ReverseString';
    FReverseStringCommand.Prepare(TServerMethods_WK_ReverseString);
  end;
  FReverseStringCommand.Parameters[0].Value.SetWideString(Value);
  FReverseStringCommand.Execute(ARequestFilter);
  Result := FReverseStringCommand.Parameters[1].Value.GetWideString;
end;

procedure TServerMethods_WKClient.PersistenciaPessoa(jObjectPessoa: TJSONObject);
begin
  if FPersistenciaPessoaCommand = nil then
  begin
    FPersistenciaPessoaCommand := FConnection.CreateCommand;
    FPersistenciaPessoaCommand.RequestType := 'POST';
    FPersistenciaPessoaCommand.Text := 'TServerMethods_WK."PersistenciaPessoa"';
    FPersistenciaPessoaCommand.Prepare(TServerMethods_WK_PersistenciaPessoa);
  end;
  FPersistenciaPessoaCommand.Parameters[0].Value.SetJSONValue(jObjectPessoa, FInstanceOwner);
  FPersistenciaPessoaCommand.Execute;
end;

constructor TServerMethods_WKClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TServerMethods_WKClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TServerMethods_WKClient.Destroy;
begin
  FGetPessoaCommand.DisposeOf;
  FGetPessoaCommand_Cache.DisposeOf;
  FGetDocumentoCommand.DisposeOf;
  FEchoStringCommand.DisposeOf;
  FReverseStringCommand.DisposeOf;
  FPersistenciaPessoaCommand.DisposeOf;
  inherited;
end;

end.

