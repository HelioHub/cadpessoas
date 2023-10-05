unit URotinaAPICEP;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, IPPeerClient,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, Rest.JSON, System.Json;

type
  TFRotinaAPICEP = class(TForm)
    ECEP: TEdit;
    BBPesquisar: TBitBtn;
    BBLevar: TBitBtn;
    MJSON: TMemo;
    LCEP: TLabel;
    LJSON: TLabel;
    LLogradouro: TLabel;
    LComplemento: TLabel;
    LBairro: TLabel;
    LCidade: TLabel;
    LUF: TLabel;
    ELogradouro: TEdit;
    EComplemento: TEdit;
    EBairro: TEdit;
    ECidade: TEdit;
    EUF: TEdit;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    BBIncluir: TBitBtn;
    procedure BBPesquisarClick(Sender: TObject);
    procedure BBLevarClick(Sender: TObject);
    procedure BBIncluirClick(Sender: TObject);
  private
    procedure BBPesquisaCEP;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRotinaAPICEP: TFRotinaAPICEP;

implementation

{$R *.dfm}

uses ConstWK, UClaCEPAPI, UClaAPIRest, UClaPessoa, ClientModuleWK;

procedure TFRotinaAPICEP.BBIncluirClick(Sender: TObject);
var oEndereco : TEndereco;
begin
  TThread.CreateAnonymousThread(BBPesquisaCEP).Start;
  ShowMessage('Efetuando Inclus�o do CEP na base...Click em Ok!');

  oEndereco := TEndereco.Create;
  try
    oEndereco.dscep         := Trim(ECEP.Text);
    oEndereco.nmlogradouro  := ELogradouro.Text;
    oEndereco.nmbairro      := EBairro.Text;
    oEndereco.dscomplemento := EComplemento.Text;
    oEndereco.nmcidade      := ECidade.Text;
    oEndereco.dsuf          := EUF.Text;
    try
      ClientModuleWKX.InsertEndereco(oEndereco);
      ShowMessage('Inclus�o efetuada com sucesso!');
    except
      ShowMessage('Inclus�o n�o efetuada!'+cEOL+
                  'Procure o Suporte do Sistema.');
    end;
  finally
    FreeAndNil(oEndereco);
  end;
end;

procedure TFRotinaAPICEP.BBLevarClick(Sender: TObject);
begin
  Close;
  ModalResult := mrOK;
end;

procedure TFRotinaAPICEP.BBPesquisarClick(Sender: TObject);
begin
  TThread.CreateAnonymousThread(BBPesquisaCEP).Start;
end;

procedure TFRotinaAPICEP.BBPesquisaCEP;
var JSON : String;
    CEPApi : TCEPAPI;
begin
  if Trim(ECEP.Text) = Empty then
  begin
    beep;
    ShowMessage('Aten��o!!'+cEOL+'Necess�rio informar o CEP.');
    Exit;
  end;

  RESTClient1.BaseURL := cURLP1+ECEP.Text+cURLP2;
  RESTRequest1.Execute;

  MJSON.Lines.Clear;
  ELogradouro.Clear;
  EComplemento.Clear;
  EBairro.Clear;
  ECidade.Clear;
  EUF.Clear;

  try
    MJSON.Lines.Add(RESTRequest1.Response.JSONValue.ToString);

    JSON := MJSON.Text;
    CEPApi := TJson.JsonToObject<TCEPAPI>(Trim(JSON));
    Try
      ELogradouro.Text  := CEPApi.logradouro;
      EComplemento.Text := CEPApi.complemento;
      EBairro.Text      := CEPApi.bairro;
      ECidade.Text      := CEPApi.localidade;
      EUF.Text          := CEPApi.uf;
    Finally
      CEPApi.Free;
    End;
  except
    begin
      Beep;
      ShowMessage('N�o foi poss�vel conex�o com a API! '+cEOL+
                  '1.Verifique a conex�o da internet;'+cEOL+
                  '2.Verifique o c�digo do CEP.');
    end;
  end;
end;

end.
