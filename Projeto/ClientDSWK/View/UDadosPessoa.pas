unit UDadosPessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UDadosBase, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, UClaPessoa;

type
  TFDadosPessoa = class(TFDadosBase)
    LDocumento: TLabel;
    L1Nome: TLabel;
    LSegundoNome: TLabel;
    RGSexo: TRadioGroup;
    LCEP: TLabel;
    LLogradouro: TLabel;
    LBairro: TLabel;
    LCidade: TLabel;
    LNo: TLabel;
    LComplemento: TLabel;
    LUF: TLabel;
    EDocumento: TEdit;
    E1Nome: TEdit;
    E2Nome: TEdit;
    ECEP: TEdit;
    BBCEP: TBitBtn;
    ELogradouro: TEdit;
    EBairro: TEdit;
    ECidade: TEdit;
    ENo: TEdit;
    EComplemento: TEdit;
    EUF: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BBGravarClick(Sender: TObject);
  private
    { Private declarations }

    destructor Destroy; override;
  public
    { Public declarations }
    ObjetoPessoa : TPessoa;
  end;

var
  FDadosPessoa: TFDadosPessoa;

implementation

{$R *.dfm}

uses ConstWK, UControllerPessoa, ClientModuleWK;

{ TFDadosPessoa }

procedure TFDadosPessoa.BBGravarClick(Sender: TObject);
begin
  inherited;

  try
    //Pessoa
    ObjetoPessoa.dsdocumento := EDocumento.Text;
    ObjetoPessoa.nmprimeiro  := E1Nome.Text;
    ObjetoPessoa.nmsegundo   := E2Nome.Text;
    ObjetoPessoa.dtregistro  := Date;
    if RGSexo.ItemIndex = Integer(TSexo.F) then
      ObjetoPessoa.flnatureza := cSexoF
    else
      ObjetoPessoa.flnatureza := cSexoM;
    //CEP
    ObjetoPessoa.CEP.dscep   := ECEP.Text;
    ObjetoPessoa.CEP.dsnumero:= StrToIntDef(ENo.Text,0);
    //Endere�o
    ObjetoPessoa.CEP.idendereco.nmlogradouro := ELogradouro.Text;
    ObjetoPessoa.CEP.idendereco.nmbairro     := EBairro.Text;
    ObjetoPessoa.CEP.idendereco.nmcidade     := ECidade.Text;
    ObjetoPessoa.CEP.idendereco.dscomplemento:= EComplemento.Text;
    ObjetoPessoa.CEP.idendereco.dsuf         := EUF.Text;

    ClientModuleWKX.InsertPessoa(ObjetoPessoa);
  finally
    Close;
  end;
end;

destructor TFDadosPessoa.Destroy;
begin
  FreeAndNil(ObjetoPessoa);
  inherited;
end;

procedure TFDadosPessoa.FormCreate(Sender: TObject);
begin
  inherited;
  ObjetoPessoa := TPessoa.Create;
end;

procedure TFDadosPessoa.FormShow(Sender: TObject);
begin
  inherited;
  if ObjetoPessoa.acao = acAlterar then
  begin
    //Pessoa
    EDocumento.Text    := ObjetoPessoa.dsdocumento;
    E1Nome.Text        := ObjetoPessoa.nmprimeiro;
    E2Nome.Text        := ObjetoPessoa.nmsegundo;
    if ObjetoPessoa.flnatureza = cSexoM then
      RGSexo.ItemIndex := Integer(TSexo.M)
    else
      RGSexo.ItemIndex := Integer(TSexo.F);
    //CEP
    ECEP.Text          := ObjetoPessoa.CEP.dscep;
    ENo.Text           := IntToStr(ObjetoPessoa.CEP.dsnumero);
    //Endere�o
    ELogradouro.Text   := ObjetoPessoa.CEP.idendereco.nmlogradouro;
    EBairro.Text       := ObjetoPessoa.CEP.idendereco.nmbairro;
    ECidade.Text       := ObjetoPessoa.CEP.idendereco.nmcidade;
    EComplemento.Text  := ObjetoPessoa.CEP.idendereco.dscomplemento;
    EUF.Text           := ObjetoPessoa.CEP.idendereco.dsuf;

    Self.Caption := Self.Caption + ' - ' + cAcaoAlterar;
  end
  else
    Self.Caption := Self.Caption + ' - ' + cAcaoIncluir;

  EDocumento.SetFocus;
end;

end.
