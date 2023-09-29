program ServidorSnapRestWK;
{$APPTYPE GUI}



{$R *.dres}

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  ServidorDataSnapRestWK in 'ServidorDataSnapRestWK.pas' {Form1},
  ServerMethodsWK in 'ServerMethodsWK.pas' {ServerMethods1: TDataModule},
  ServerContainerWK in 'ServerContainerWK.pas' {ServerContainer1: TDataModule},
  WebModuleWK in 'WebModuleWK.pas' {WebModule1: TWebModule};

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
