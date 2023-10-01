unit ClientModuleWK;

interface

uses
  System.SysUtils, System.Classes, ClientClassesWK, IPPeerClient,
  Datasnap.DSClientRest;

type
  TClientModuleWKX = class(TDataModule)
    DSRestConnectionWK: TDSRestConnection;
  private
    FInstanceOwner: Boolean;
    FServerMethods1Client: TServerMethods1Client;
    function GetServerMethods1Client: TServerMethods1Client;
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property InstanceOwner: Boolean read FInstanceOwner write FInstanceOwner;
    property ServerMethods1Client: TServerMethods1Client read GetServerMethods1Client write FServerMethods1Client;

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

function TClientModuleWKX.GetServerMethods1Client: TServerMethods1Client;
begin
  if FServerMethods1Client = nil then
    FServerMethods1Client:= TServerMethods1Client.Create(DSRestConnectionWK, FInstanceOwner);
  Result := FServerMethods1Client;
end;

end.