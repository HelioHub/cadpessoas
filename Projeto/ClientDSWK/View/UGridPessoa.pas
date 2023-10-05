unit UGridPessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UGridBase, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, ConstWK;

type
  TFGridPessoa = class(TFGridBase)
    LCEP: TLabel;
    DBECEP: TDBEdit;
    LLogradouro: TLabel;
    LNo: TLabel;
    LBairro: TLabel;
    LComplemento: TLabel;
    LCidade: TLabel;
    DBELogradouro: TDBEdit;
    DBENo: TDBEdit;
    DBEBairro: TDBEdit;
    DBEComplemento: TDBEdit;
    DBECidade: TDBEdit;
    LUF: TLabel;
    DBEUF: TDBEdit;
    CBAtualizar: TCheckBox;
    LCodigo: TLabel;
    ECodigo: TEdit;
    SPPesquisa: TSpeedButton;
    BBCEP: TBitBtn;
    procedure BBAtualizarClick(Sender: TObject);
    procedure BBIncluirClick(Sender: TObject);
    procedure BBAlterarClick(Sender: TObject);
    procedure DBGViewDblClick(Sender: TObject);
    procedure BBExcluirClick(Sender: TObject);
    procedure BBImportacaoClick(Sender: TObject);
    procedure SPPesquisaClick(Sender: TObject);
    procedure BBCEPClick(Sender: TObject);
  private
    procedure pCRUD(pAcao: TAcao);
    procedure pAtualizacao;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FGridPessoa: TFGridPessoa;

implementation

{$R *.dfm}

uses ClientModuleWK, UDadosPessoa, URotImpLote, URotinaAPICEP;

procedure TFGridPessoa.BBAlterarClick(Sender: TObject);
begin
  inherited;
  pCRUD(acAlterar);
end;

procedure TFGridPessoa.BBAtualizarClick(Sender: TObject);
begin
  inherited;
  pAtualizacao;
end;

procedure TFGridPessoa.BBCEPClick(Sender: TObject);
var Formulario: TFRotinaAPICEP;
begin
  inherited;
  Formulario := TFRotinaAPICEP.Create(Application);
  Formulario.BBLevar.Enabled := False;
  Formulario.ShowModal;
  Formulario.Destroy;
end;

procedure TFGridPessoa.pAtualizacao;
var sLimiteRegistros : String;
begin
  sLimiteRegistros := ENR.Text;
  ClientModuleWKX.LoadPessoa('', sLimiteRegistros);
end;

procedure TFGridPessoa.BBExcluirClick(Sender: TObject);
begin
  inherited;
  pCRUD(acExcluir);
end;

procedure TFGridPessoa.BBImportacaoClick(Sender: TObject);
var Formulario: TFRotImpLote;
begin
  inherited;
  Formulario := TFRotImpLote.Create(Application);
  Formulario.ShowModal;
end;

procedure TFGridPessoa.BBIncluirClick(Sender: TObject);
begin
  inherited;
  pCRUD(acIncluir);
end;

procedure TFGridPessoa.DBGViewDblClick(Sender: TObject);
begin
  inherited;
  pCRUD(acAlterar);
end;

procedure TFGridPessoa.pCRUD(pAcao: TAcao);
var Formulario: TFDadosPessoa;
begin
  inherited;
  if (DSBase.DataSet.FieldByName('idpessoa').IsNull) and (pAcao <> acIncluir) then
  begin
    Beep;
    ShowMessage('Selecione um registro v�lido '+cEOL+'para efetuar opera��o desejada!');
    Exit;
  end;

  Formulario := TFDadosPessoa.Create(Application);
  if (pAcao <> acIncluir) then
  begin
    //Pessoa
    Formulario.ObjetoPessoa.idpessoa     := DSBase.DataSet.FieldByName('idpessoa').Asinteger;
    Formulario.ObjetoPessoa.dsdocumento  := DSBase.DataSet.FieldByName('dsdocumento').AsString;
    Formulario.ObjetoPessoa.nmprimeiro   := DSBase.DataSet.FieldByName('nmprimeiro').AsString;
    Formulario.ObjetoPessoa.nmsegundo    := DSBase.DataSet.FieldByName('nmsegundo').AsString;
    if DSBase.DataSet.FieldByName('flnatureza').AsString = cSexoM then
      Formulario.ObjetoPessoa.flnatureza := cSexoM
    else
      Formulario.ObjetoPessoa.flnatureza := cSexoF;

    //CEP
    Formulario.ObjetoPessoa.CEP.dsnumero := DSBase.DataSet.FieldByName('dsnumero').Asinteger;

    //Endereco
    Formulario.ObjetoPessoa.CEP.dscep.idendereco   := DSBase.DataSet.FieldByName('idendereco').Asinteger;
    Formulario.ObjetoPessoa.CEP.dscep.dscep        := DSBase.DataSet.FieldByName('dscep').AsString;
    Formulario.ObjetoPessoa.CEP.dscep.nmlogradouro := DSBase.DataSet.FieldByName('nmlogradouro').AsString;
    Formulario.ObjetoPessoa.CEP.dscep.nmbairro     := DSBase.DataSet.FieldByName('nmbairro').AsString;
    Formulario.ObjetoPessoa.CEP.dscep.dscomplemento:= DSBase.DataSet.FieldByName('dscomplemento').AsString;
    Formulario.ObjetoPessoa.CEP.dscep.nmcidade     := DSBase.DataSet.FieldByName('nmcidade').AsString;
    Formulario.ObjetoPessoa.CEP.dscep.dsuf         := DSBase.DataSet.FieldByName('dsuf').AsString;
  end;

  Formulario.ObjetoPessoa.Acao := pAcao;
  Formulario.ShowModal;
  if CBAtualizar.Checked then
    pAtualizacao;
end;

procedure TFGridPessoa.SPPesquisaClick(Sender: TObject);
begin
  inherited;
  ClientModuleWKX.PessoaMemTable.Locate('idpessoa',Trim(ECodigo.Text));
end;

end.
