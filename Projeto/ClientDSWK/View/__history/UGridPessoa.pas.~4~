unit UGridPessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UGridBase, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFGridPessoa = class(TFGridBase)
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
begin
  inherited;
  ClientModuleWKX.LoadPessoa('');
end;

end.
