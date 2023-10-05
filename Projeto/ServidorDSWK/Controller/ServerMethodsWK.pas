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
    function GetProximoCodigoCEP: String;
    function GetCEP(wCEP: String): String;

    procedure InsertPessoa(const oPessoa: TPessoa);
    procedure UpdatePessoa(const oPessoa: TPessoa);
    procedure DeletePessoa(const oPessoa: TPessoa);
  public
    { Public declarations }
    function GetPessoa(const IDPessoa: string; const SLimit: string): TFDJSONDataSets;
    function GetDocumento(const Documento: string): String;
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;

    procedure PersistenciaPessoa(const jObjectPessoa: TJSONObject);
  end;
{$METHODINFO OFF}

Const
  sSQLPessoaSelect = 'SELECT A.idpessoa, A.dsdocumento, A.nmprimeiro, A.nmsegundo, A.dtregistro, A.flnatureza, ' +
                     'B.dsnumero, ' +
                     'C.idendereco, C.dscep, C.nmlogradouro, C.nmbairro, C.dscomplemento, C.nmcidade, C.dsuf ' +
                     'FROM pessoa A ' +
                     'LEFT JOIN endereco B            ON B.idpessoa   = A.idpessoa ' +
                     'LEFT JOIN endereco_integracao C ON C.idendereco = B.dscep ';

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

function TServerMethods_WK.GetCEP(wCEP: String): String;
begin
  try
    DataModuleWK.WKSequencial.Close;
    DataModuleWK.WKSequencial.SQL.Text := 'SELECT idendereco FROM endereco_integracao WHERE dscep = '+QuotedStr(wCEP);
    DataModuleWK.WKSequencial.Open;
    Result := DataModuleWK.WKSequencial.FieldByName('idendereco').AsString;
  finally
    DataModuleWK.WKSequencial.Close;
  end;
end;

function TServerMethods_WK.GetDocumento(const Documento: string): String;
begin
  try
    DataModuleWK.WKSequencial.Close;
    DataModuleWK.WKSequencial.SQL.Text := 'SELECT idpessoa FROM pessoa WHERE dsdocumento = '+QuotedStr(Documento);
    DataModuleWK.WKSequencial.Open;
    Result := DataModuleWK.WKSequencial.FieldByName('idpessoa').AsString;
  finally
    DataModuleWK.WKSequencial.Close;
  end;
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

function TServerMethods_WK.GetProximoCodigoCEP: String;
begin
  {Recupera o pr�ximo c�digo sequencial da entity Endereco(CEP)}
  try
    DataModuleWK.WKSequencial.Close;
    DataModuleWK.WKSequencial.SQL.Text := 'SELECT (COALESCE(MAX(idendereco),0)+1) AS SEQUENCIAL FROM ENDERECO ';
    DataModuleWK.WKSequencial.Open;
    Result := DataModuleWK.WKSequencial.FieldByName('SEQUENCIAL').AsString;
  finally
    DataModuleWK.WKSequencial.Close;
  end;
end;

function TServerMethods_WK.GetProximoCodigoEndereco: String;
begin
  {Recupera o pr�ximo c�digo sequencial da entity Endereco_Integracao}
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
        raise Exception.Create('Ocorreu problema na grava��o. Entre em contato com o Suporte.'+cEOL+
                               'Error Message: ' + E.Message);
      end;
    end;
  finally
    FreeAndNil(oPessoa);
  end;
end;

procedure TServerMethods_WK.InsertPessoa(const oPessoa: TPessoa);
var sSQL,
    sSequencialPessoa, sSequencialEndereco, sSequencialCEP,
    sCEPExist : string;

  procedure insertEndereco;
  begin
    sSequencialEndereco := GetProximoCodigoCEP;
    sSQL := 'INSERT INTO ENDERECO (idendereco, idpessoa, dscep, dsnumero) '+
            ' VALUES ('+sSequencialEndereco           +', '+
                        sSequencialPessoa             +', '+
                        sSequencialCEP                +', '+
                        IntToStr(oPessoa.CEP.dsnumero)+') ';
    DataModuleWK.WKConnection.ExecSQL(sSQL);
  end;

begin
  {Requisitos novos:
    1) Caso o CEP j� exista reutilizar na rela��o com a Entidade Pessoa;
    2) N�o perminitir cadastro com o mesmo documento (ser unique no Banco 'dsdocumento', criar a constraint;
  }
  sSequencialPessoa := GetProximoCodigoPessoa;
  sSQL := 'INSERT INTO PESSOA (idpessoa, dsdocumento, nmprimeiro, nmsegundo, dtregistro, flnatureza) '+
          ' VALUES ('+sSequencialPessoa             +', '+
                      QuotedStr(oPessoa.dsdocumento)+', '+
                      QuotedStr(oPessoa.nmprimeiro) +', '+
                      QuotedStr(oPessoa.nmsegundo)  +', '+
                     '(SELECT CURRENT_DATE), '+
                      QuotedStr(oPessoa.flnatureza) +') ';
  DataModuleWK.WKConnection.ExecSQL(sSQL);

  sCEPExist := GetCEP(oPessoa.CEP.dscep.dscep);
  if sCEPExist = Empty then
  begin
    sSequencialEndereco := GetProximoCodigoEndereco;
    sSQL := 'INSERT INTO ENDERECO_INTEGRACAO (idendereco, dscep, dsuf, nmcidade, nmbairro, nmlogradouro, dscomplemento) '+
            ' VALUES ('+sSequencialEndereco                        +', '+
                        QuotedStr(oPessoa.CEP.dscep.dscep)         +', '+
                        QuotedStr(oPessoa.CEP.dscep.dsuf)          +', '+
                        QuotedStr(oPessoa.CEP.dscep.nmcidade)      +', '+
                        QuotedStr(oPessoa.CEP.dscep.nmbairro)      +', '+
                        QuotedStr(oPessoa.CEP.dscep.nmlogradouro)  +', '+
                        QuotedStr(oPessoa.CEP.dscep.dscomplemento) +')';
    DataModuleWK.WKConnection.ExecSQL(sSQL);

    insertEndereco;
  end
  else
  begin
    sSequencialCEP := sCEPExist;
    insertEndereco;
  end;
end;

procedure TServerMethods_WK.UpdatePessoa(const oPessoa: TPessoa);
var sSQL: string;
begin
  sSQL := 'UPDATE PESSOA SET '+
          ' dsdocumento = '+ QuotedStr(oPessoa.dsdocumento)+', '+
          ' nmprimeiro  = '+ QuotedStr(oPessoa.nmprimeiro) +', '+
          ' nmsegundo   = '+ QuotedStr(oPessoa.nmsegundo)  +', '+
          ' flnatureza  = '+ QuotedStr(oPessoa.flnatureza) +'  '+
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

