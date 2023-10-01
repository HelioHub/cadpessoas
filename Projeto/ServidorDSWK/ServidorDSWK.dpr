program ServidorDSWK;
{$APPTYPE GUI}

{$R *.dres}

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  FUServidorDataSnapRest in 'View\FUServidorDataSnapRest.pas' {FServidorDataSnapRest},
  ServerMethodsWK in 'Controller\ServerMethodsWK.pas' {ServerMethods1: TDataModule},
  ServerContainerWK in 'View\ServerContainerWK.pas' {ServerContainer2: TDataModule},
  WebModuleWK in 'View\WebModuleWK.pas' {WebModule1: TWebModule},
  UDMBanco in 'Model\UDMBanco.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TFServidorDataSnapRest, FServidorDataSnapRest);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
