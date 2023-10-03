program ClientDSWK;

uses
  Vcl.Forms,
  CliCadPessoa in 'View\CliCadPessoa.pas' {FCliCadPessoa},
  ClientClassesWK in 'Controller\ClientClassesWK.pas',
  ClientModuleWK in 'Model\ClientModuleWK.pas' {ClientModuleWKX: TDataModule},
  UGridBase in 'View\UGridBase.pas' {FGridBase},
  UDadosBase in 'View\UDadosBase.pas' {FDadosBase},
  ConstWK in '..\Biblioteca\ConstWK.pas',
  UGridPessoa in 'View\UGridPessoa.pas' {FGridPessoa},
  UClaIni in '..\Biblioteca\Model\Classes\UClaIni.pas',
  UCEP in '..\Biblioteca\UCEP.pas',
  UBuscaCEP in '..\Biblioteca\UBuscaCEP.pas',
  UDadosPessoa in 'View\UDadosPessoa.pas' {FDadosPessoa},
  UClaPessoa in '..\Biblioteca\Model\Classes\UClaPessoa.pas',
  UControllerPessoa in '..\Biblioteca\Controller\UControllerPessoa.pas',
  UDAOPessoa in '..\Biblioteca\Model\DAO\UDAOPessoa.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Cadastro de Pessoas';
  Application.CreateForm(TFCliCadPessoa, FCliCadPessoa);
  Application.CreateForm(TClientModuleWKX, ClientModuleWKX);
  Application.Run;
end.
