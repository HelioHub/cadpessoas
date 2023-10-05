unit UClaLotePessoas;

interface

uses ConstWK, System.Generics.Collections, System.SysUtils, UClaPessoa;

type
  TLotePessoas = class
  private
    fListaPessoa: TObjectList<TPessoa>;
  protected
  public
    property ListaPessoa: TObjectList<TPessoa> read fListaPessoa write fListaPessoa;

    constructor Create;
    destructor Destroy; override;
    procedure AdicionarPessoa(oPessoa: TPessoa);
  end;


implementation

{ TLotePessoas }

procedure TLotePessoas.AdicionarPessoa(oPessoa: TPessoa);
begin
  fListaPessoa.Add(oPessoa);
end;

constructor TLotePessoas.Create;
begin
  fListaPessoa := TObjectList<TPessoa>.Create;
end;

destructor TLotePessoas.Destroy;
begin
  FreeAndNil(fListaPessoa);
  inherited;
end;

end.
