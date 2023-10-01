unit CliCadPessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  dxGDIPlusClasses, Vcl.ExtCtrls, Winapi.ShellApi;

type
  TForm1 = class(TForm)
    ImageWK: TImage;
    BBCadPessoas: TBitBtn;
    BBFechar: TBitBtn;
    procedure BBFecharClick(Sender: TObject);
    procedure ImageWKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

const
  urlWK = 'https://wktechnology.com.br/';

implementation

{$R *.dfm}

procedure TForm1.BBFecharClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm1.ImageWKClick(Sender: TObject);
begin
  ShellExecute(Handle, nil, PChar(urlWK), nil, nil, SW_SHOWNORMAL);
end;

end.
