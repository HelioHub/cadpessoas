unit UClaPessoa;

interface

uses ConstWK;

type
  TEndereco = class
  private
    fidendereco   : integer;
    fnmlogradouro : String;
    fnmbairro     : String;
    fdscomplemento: String;
    fnmcidade     : String;
    fdsuf         : String;

    constructor Create;
  protected
  public
    property idendereco   : integer read fidendereco    write fidendereco;
    property nmlogradouro : String  read fnmlogradouro  write fnmlogradouro;
    property nmbairro     : String  read fnmbairro      write fnmbairro;
    property dscomplemento: String  read fdscomplemento write fdscomplemento;
    property nmcidade     : String  read fnmcidade      write fnmcidade;
    property dsuf         : String  read fdsuf          write fdsuf;
  end;

  TCEP = class
  private
    fidendereco : TEndereco;
    fidpessoa   : integer;
    fdscep      : String;
    fdsnumero   : integer;

    constructor Create;
  protected
  public
    property idendereco : TEndereco read fidendereco write fidendereco;
    property idpessoa   : integer   read fidpessoa   write fidpessoa;
    property dscep      : String    read fdscep      write fdscep;
    property dsnumero   : integer   read fdsnumero   write fdsnumero;
  end;

  TPessoa = class
  private
    facao        : TAcao;
    fidpessoa    : integer;
    fdsdocumento : string;
    fnmprimeiro  : string;
    fnmsegundo   : string;
    fdtregistro  : TDateTime;
    fflnatureza  : string;
    fCEP         : TCEP;

    constructor Create;
  protected
  public
    property acao        : TAcao     read facao        write facao;
    property idpessoa    : integer   read fidpessoa    write fidpessoa;
    property dsdocumento : string    read fdsdocumento write fdsdocumento;
    property nmprimeiro  : string    read fnmprimeiro  write fnmprimeiro;
    property nmsegundo   : string    read fnmsegundo   write fnmsegundo;
    property dtregistro  : TDateTime read fdtregistro  write fdtregistro;
    property flnatureza  : string    read fflnatureza  write fflnatureza;
    property CEP         : TCEP      read fCEP         write fCEP;
  end;

implementation

{ TEndereco }

constructor TEndereco.Create;
begin
  fnmcidade := cCidadePadrao;
  fdsuf := cUFPadrao;
end;

{ TCEP }

constructor TCEP.Create;
begin

end;

{ TPessoa }

constructor TPessoa.Create;
begin

end;

end.
