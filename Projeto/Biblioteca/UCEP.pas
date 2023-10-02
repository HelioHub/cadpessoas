// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://consultacep.correios.com.br/office2003/Query.asmx?WSDL
// Encoding : utf-8
// Version  : 1.0
// ************************************************************************ //

unit UCEP;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Borland types; however, they could also
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"



  // ************************************************************************ //
  // Namespace : urn:Microsoft.Search
  // soapAction: urn:Microsoft.Search/Query
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : document
  // binding   : QueryProcessorSoap
  // service   : QueryProcessor
  // port      : QueryProcessorSoap
  // URL       : http://consultacep.correios.com.br/office2003/Query.asmx
  // ************************************************************************ //
  QueryProcessorSoap = interface(IInvokable)
  ['{037CBEAE-AA02-4A75-ED9A-9A81981DB8A8}']
    function  Query(const queryXml: WideString): WideString; stdcall;
  end;

function GetQueryProcessorSoap(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): QueryProcessorSoap;


implementation

function GetQueryProcessorSoap(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): QueryProcessorSoap;
const
  defWSDL = 'http://consultacep.correios.com.br/office2003/Query.asmx?WSDL';
  defURL  = 'http://consultacep.correios.com.br/office2003/Query.asmx';
  defSvc  = 'QueryProcessor';
  defPrt  = 'QueryProcessorSoap';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as QueryProcessorSoap);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


initialization
  InvRegistry.RegisterInterface(TypeInfo(QueryProcessorSoap), 'urn:Microsoft.Search', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(QueryProcessorSoap), 'urn:Microsoft.Search/Query');
  InvRegistry.RegisterInvokeOptions(TypeInfo(QueryProcessorSoap), ioDocument);
end.
