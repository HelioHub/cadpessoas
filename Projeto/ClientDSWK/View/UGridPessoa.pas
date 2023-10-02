unit UGridPessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UGridBase, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TFGridPessoa = class(TFGridBase)
    LCEP: TLabel;
    DBECEP: TDBEdit;
    LLogradouro: TLabel;
    LNo: TLabel;
    LBairro: TLabel;
    LComplemento: TLabel;
    LCidade: TLabel;
    DBELogradouro: TDBEdit;
    DBENo: TDBEdit;
    DBEBairro: TDBEdit;
    DBEComplemento: TDBEdit;
    DBECidade: TDBEdit;
    LUF: TLabel;
    DBEUF: TDBEdit;
    procedure BBAtualizarClick(Sender: TObject);
    procedure BBIncluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FGridPessoa: TFGridPessoa;

implementation

{$R *.dfm}

uses ClientModuleWK, UDadosPessoa, ConstWK;

procedure TFGridPessoa.BBAtualizarClick(Sender: TObject);
var sLimiteRegistros : String;
begin
  inherited;
  sLimiteRegistros := ENR.Text;
  ClientModuleWKX.LoadPessoa('', sLimiteRegistros);
end;

procedure TFGridPessoa.BBIncluirClick(Sender: TObject);
var Formulario: TFDadosPessoa;
begin
  inherited;
  Formulario := TFDadosPessoa.Create(Application);
  if (Sender As TBitBtn).Caption = cAcaoAlterar then
  begin
    Formulario.ObjetoPessoa.dsdocumento  := DSBase.DataSet.FieldByName('dsdocumento').AsString;
    Formulario.ObjetoPessoa.nmprimeiro   := DSBase.DataSet.FieldByName('nmprimeiro').AsString;
    Formulario.ObjetoPessoa.nmsegundo    := DSBase.DataSet.FieldByName('nmsegundo').AsString;
    Formulario.ObjetoPessoa.flnatureza   := cSexoF;
    if DSBase.DataSet.FieldByName('flnatureza').AsString = cSexoM then
      Formulario.ObjetoPessoa.flnatureza := cSexoM;

    Formulario.ObjetoPessoa.CEP.dscep    := DSBase.DataSet.FieldByName('dscep').AsString;
    Formulario.ObjetoPessoa.CEP.dsnumero := DSBase.DataSet.FieldByName('dsnumero').Asinteger;

    Formulario.ObjetoPessoa.CEP.idendereco.nmlogradouro := DSBase.DataSet.FieldByName('nmlogradouro').AsString;
    Formulario.ObjetoPessoa.CEP.idendereco.nmbairro     := DSBase.DataSet.FieldByName('nmbairro').AsString;
    Formulario.ObjetoPessoa.CEP.idendereco.dscomplemento:= DSBase.DataSet.FieldByName('dscomplemento').AsString;
    Formulario.ObjetoPessoa.CEP.idendereco.nmcidade     := DSBase.DataSet.FieldByName('nmcidade').AsString;
    Formulario.ObjetoPessoa.CEP.idendereco.dsuf         := DSBase.DataSet.FieldByName('dsuf').AsString;

    Formulario.ObjetoPessoa.Acao  := tacAlterar;
  end
  else
    Formulario.ObjetoPessoa.Acao  := tacIncluir;

  Formulario.ShowModal;
  DSBase.DataSet.Refresh;
end;

end.
