program ClientDSWK;

uses
  Vcl.Forms,
  CliCadPessoa in 'View\CliCadPessoa.pas' {FCliCadPessoa},
  ClientClassesWK in 'Controller\ClientClassesWK.pas',
  ClientModuleWK in 'Model\ClientModuleWK.pas' {ClientModuleWKX: TDataModule},
  UGridBase in 'View\UGridBase.pas' {FGridBase},
  UDadosBase in 'View\UDadosBase.pas' {FDadosBase},
  ClientConstWK in 'ClientConstWK.pas',
  UGridPessoa in 'View\UGridPessoa.pas' {FGridPessoa};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFCliCadPessoa, FCliCadPessoa);
  Application.CreateForm(TClientModuleWKX, ClientModuleWKX);
  Application.Run;
end.
