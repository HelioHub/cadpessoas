program ClientDSWK;

uses
  Vcl.Forms,
  CliCadPessoa in 'View\CliCadPessoa.pas' {Form1},
  ClientClassesWK in 'Controller\ClientClassesWK.pas',
  ClientModuleWK in 'Model\ClientModuleWK.pas' {ClientModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TClientModule1, ClientModule1);
  Application.Run;
end.
