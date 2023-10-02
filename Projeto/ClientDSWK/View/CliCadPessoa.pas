unit CliCadPessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  dxGDIPlusClasses, Vcl.ExtCtrls, Winapi.ShellApi;

type
  TFCliCadPessoa = class(TForm)
    ImageWK: TImage;
    BBCadPessoas: TBitBtn;
    BBFechar: TBitBtn;
    PHost: TPanel;
    edtHostName: TEdit;
    procedure BBFecharClick(Sender: TObject);
    procedure ImageWKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BBCadPessoasClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCliCadPessoa: TFCliCadPessoa;

implementation

{$R *.dfm}

uses ClientConstWK, UGridPessoa;

procedure TFCliCadPessoa.BBCadPessoasClick(Sender: TObject);
var Formulario: TFGridPessoa;
begin
  Formulario := TFGridPessoa.Create(Application);
  Formulario.WindowState := wsMaximized;
  Formulario.ShowModal;
end;

procedure TFCliCadPessoa.BBFecharClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFCliCadPessoa.FormShow(Sender: TObject);
begin
  edtHostName.Text := cHostServidorWK;
end;

procedure TFCliCadPessoa.ImageWKClick(Sender: TObject);
begin
  ShellExecute(Handle, nil, PChar(curlWK), nil, nil, SW_SHOWNORMAL);
end;

end.
