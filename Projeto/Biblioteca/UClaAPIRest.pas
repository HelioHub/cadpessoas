unit UClaAPIRest;

interface

uses
  System.SysUtils, System.Classes, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, Vcl.StdCtrls;

type
  TDMClaAPIRest = class(TDataModule)
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
  private
    { Private declarations }
  public
    { Public declarations }
    function fPesquisaCEPAPI(wsCEP: String) : String;
    procedure pPesquisaCEPAPI;
  end;

var
  DMClaAPIRest: TDMClaAPIRest;

Const cURL   = 'viacep.com.br/ws/_numero_CEP/json/';
      cURLP1 = 'viacep.com.br/ws/';
      cURLP2 = '/json/';

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDMClaAPIRest }

function TDMClaAPIRest.fPesquisaCEPAPI(wsCEP: String): String;
var sJSON : String;
begin
  try
    RESTClient1.BaseURL := cURLP1+wsCEP+cURLP2;
    RESTRequest1.Execute;

    sJSON := RESTRequest1.Response.JSONValue.ToString;

    Result := sJSON;
  except
    Result := '';
  end;
end;

procedure TDMClaAPIRest.pPesquisaCEPAPI;
begin

end;

end.
