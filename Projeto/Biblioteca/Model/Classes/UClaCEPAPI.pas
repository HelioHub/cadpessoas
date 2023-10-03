unit UClaCEPAPI;

interface

type
  TCEPAPI = class
  private
    flogradouro : String;
    fbairro     : String;
    fcomplemento: String;
    fcidade     : String;
    fuf         : String;

    destructor Destroy; override;
  protected
  public
    constructor Create;

    property logradouro : String  read flogradouro  write flogradouro;
    property bairro     : String  read fbairro      write fbairro;
    property complemento: String  read fcomplemento write fcomplemento;
    property localidade : String  read fcidade      write fcidade;
    property uf         : String  read fuf          write fuf;
  end;

implementation

{ TCEPAPI }

constructor TCEPAPI.Create;
begin

end;

destructor TCEPAPI.Destroy;
begin

  inherited;
end;

end.
