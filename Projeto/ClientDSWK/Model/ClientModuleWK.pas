unit ClientModuleWK;

interface

uses
  System.SysUtils, System.Classes, ClientClassesWK, IPPeerClient,
  Datasnap.DSClientRest, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.StorageBin, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Stan.StorageJSON, Data.FireDACJSONReflect;

type
  TClientModuleWKX = class(TDataModule)
    DSRestConnectionWK: TDSRestConnection;
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    PessoaMemTable: TFDMemTable;
    PessoaMemTabledtregistro: TDateTimeField;
    PessoaMemTableidPessoa: TLargeintField;
    PessoaMemTabledsdocumento: TWideStringField;
    PessoaMemTablenmprimeiro: TWideStringField;
    PessoaMemTablenmsegundo: TWideStringField;
    PessoaMemTableflnatureza: TWideStringField;
  private
    FInstanceOwner: Boolean;
    FServerMethods1Client: TServerMethods_WKClient;
    function GetServerMethods1Client: TServerMethods_WKClient;
    { Private declarations }
  public
    procedure LoadPessoa(const IDPessoa: string);

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property InstanceOwner: Boolean read FInstanceOwner write FInstanceOwner;
    property ServerMethods1Client: TServerMethods_WKClient read GetServerMethods1Client write FServerMethods1Client;

end;

var
  ClientModuleWKX: TClientModuleWKX;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

constructor TClientModuleWKX.Create(AOwner: TComponent);
begin
  inherited;
  FInstanceOwner := True;
end;

destructor TClientModuleWKX.Destroy;
begin
  FServerMethods1Client.Free;
  inherited;
end;

function TClientModuleWKX.GetServerMethods1Client: TServerMethods_WKClient;
begin
  if FServerMethods1Client = nil then
    FServerMethods1Client:= TServerMethods_WKClient.Create(DSRestConnectionWK, FInstanceOwner);
  Result := FServerMethods1Client;
end;

procedure TClientModuleWKX.LoadPessoa(const IDPessoa: string);
var
  LDataSetList: TFDJSONDataSets;
begin
  LDataSetList := ServerMethods1Client.GetPessoa(IDPessoa);

  PessoaMemTable.Close;
  PessoaMemTable.AppendData(TFDJSONDataSetsReader.GetListValue(LDataSetList, 0));
  PessoaMemTable.Open;
end;

end.
