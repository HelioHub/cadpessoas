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
    procedure BBSairClick(Sender: TObject);
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

uses ConstWK, UControllerPessoa;

{ TFDadosPessoa }

procedure TFDadosPessoa.BBGravarClick(Sender: TObject);
var objControle: TControllerPessoa;
begin
  inherited;

  objControle := TControllerPessoa.Create;
  try
    ObjetoPessoa.dsdocumento := EDocumento.Text;
    ObjetoPessoa.nmprimeiro  := E1Nome.Text;
    ObjetoPessoa.nmsegundo   := E2Nome.Text;
    if RGSexo.ItemIndex = Integer(TSexo.F) then
      ObjetoPessoa.flnatureza := cSexoF
    else
      ObjetoPessoa.flnatureza := cSexoM;

    ObjetoPessoa.CEP.dscep   := ECEP.Text;
    ObjetoPessoa.CEP.dsnumero:= StrToIntDef(ENo.Text,0);

    ObjetoPessoa.CEP.idendereco.nmlogradouro := ELogradouro.Text;
    ObjetoPessoa.CEP.idendereco.nmbairro     := EBairro.Text;
    ObjetoPessoa.CEP.idendereco.nmcidade     := ECidade.Text;
    ObjetoPessoa.CEP.idendereco.dscomplemento:= EComplemento.Text;
    ObjetoPessoa.CEP.idendereco.dsuf         := EUF.Text;

    ObjControle.Salvar(ObjetoPessoa);
  finally
    FreeAndNil(objControle);
  end;

  Close;
end;

procedure TFDadosPessoa.BBSairClick(Sender: TObject);
begin
  inherited;
  Close;
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
  ObjetoPessoa.CEP := TCEP.Create;
  ObjetoPessoa.CEP.idendereco := TEndereco.Create;
end;

procedure TFDadosPessoa.FormShow(Sender: TObject);
begin
  inherited;
  if ObjetoPessoa.acao = tacAlterar then
  begin
    EDocumento.Text  := ObjetoPessoa.dsdocumento;
    E1Nome.Text      := ObjetoPessoa.nmprimeiro;
    E2Nome.Text      := ObjetoPessoa.nmsegundo;
    RGSexo.ItemIndex := Integer(TSexo.F);
    if ObjetoPessoa.flnatureza = cSexoM then
      RGSexo.ItemIndex := Integer(TSexo.F);
    ECEP.Text        := ObjetoPessoa.CEP.dscep;
    ENo.Text         := IntToStr(ObjetoPessoa.CEP.dsnumero);
    ELogradouro.Text := ObjetoPessoa.CEP.idendereco.nmlogradouro;
    EBairro.Text     := ObjetoPessoa.CEP.idendereco.nmbairro;
    ECidade.Text     := ObjetoPessoa.CEP.idendereco.nmcidade;
    EComplemento.Text:= ObjetoPessoa.CEP.idendereco.dscomplemento;
    EUF.Text         := ObjetoPessoa.CEP.idendereco.dsuf;

    Self.Caption := Self.Caption + ' - ' + cAcaoAlterar;
  end
  else
    Self.Caption := Self.Caption + ' - ' + cAcaoIncluir;

  EDocumento.SetFocus;
end;

end.