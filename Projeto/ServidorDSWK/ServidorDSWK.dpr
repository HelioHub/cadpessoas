program ServidorDSWK;
{$APPTYPE GUI}

{$R *.dres}

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  FUServidorDataSnapRest in 'FUServidorDataSnapRest.pas' {FServidorDataSnapRest},
  ServerMethodsWK in 'ServerMethodsWK.pas' {ServerMethods1: TDataModule},
  ServerContainerWK in 'ServerContainerWK.pas' {ServerContainer2: TDataModule},
  WebModuleWK in 'WebModuleWK.pas' {WebModule1: TWebModule};

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TFServidorDataSnapRest, FServidorDataSnapRest);
  Application.Run;
end.
