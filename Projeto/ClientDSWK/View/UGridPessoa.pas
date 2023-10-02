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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FGridPessoa: TFGridPessoa;

implementation

{$R *.dfm}

uses ClientModuleWK;

procedure TFGridPessoa.BBAtualizarClick(Sender: TObject);
var sLimiteRegistros : String;
begin
  inherited;
  sLimiteRegistros := ENR.Text;
  ClientModuleWKX.LoadPessoa('', sLimiteRegistros);
end;

end.
