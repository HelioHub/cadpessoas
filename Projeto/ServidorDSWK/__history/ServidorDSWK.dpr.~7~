program ServidorDSWK;
{$APPTYPE GUI}

{$R *.dres}

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  FUServidorDataSnapRest in 'View\FUServidorDataSnapRest.pas' {FServidorDataSnapRest},
  ServerMethodsWK in 'Controller\ServerMethodsWK.pas' {ServerMethods_WK: TDataModule},
  ServerContainerWK in 'View\ServerContainerWK.pas' {ServerContainer_WK: TDataModule},
  WebModuleWK in 'View\WebModuleWK.pas' {WebModule_WK: TWebModule},
  UDMBanco in 'Model\UDMBanco.pas' {DataModuleWK: TDataModule},
  ServerConstWK in 'ServerConstWK.pas';

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TFServidorDataSnapRest, FServidorDataSnapRest);
  Application.CreateForm(TDataModuleWK, DataModuleWK);
  Application.Run;
end.
