unit UDadosPessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UDadosBase, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, UClaPessoa;

type
  TFDadosPessoa = class(TFDadosBase)
    LDocumento: TLabel;
    L1Nome: TLabel;
    LSegundoNome: TLabel;
    RGSexo: TRadioGroup;
    LCEP: TLabel;
    LLogradouro: TLabel;
    LBairro: TLabel;
    LCidade: TLabel;
    LNo: TLabel;
    LComplemento: TLabel;
    LUF: TLabel;
    EDocumento: TEdit;
    E1Nome: TEdit;
    E2Nome: TEdit;
    ECEP: TEdit;
    BBCEP: TBitBtn;
    ELogradouro: TEdit;
    EBairro: TEdit;
    ECidade: TEdit;
    ENo: TEdit;
    EComplemento: TEdit;
    EUF: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BBGravarClick(Sender: TObject);
    procedure BBCEPClick(Sender: TObject);
  private
    { Private declarations }
    function fValidacoesPessoa : Boolean;

    procedure HabilitarControls;
    procedure DesabilitarControls(pCEP: Boolean = True);

    destructor Destroy; override;
  public
    { Public declarations }
    ObjetoPessoa : TPessoa;
  end;

var
  FDadosPessoa: TFDadosPessoa;

implementation

{$R *.dfm}

uses ConstWK, UControllerPessoa, ClientModuleWK, URotinaAPICEP, UClaAPIRest;

{ TFDadosPessoa }

procedure TFDadosPessoa.BBCEPClick(Sender: TObject);
var Formulario: TFRotinaAPICEP;
begin
  inherited;
  Formulario           := TFRotinaAPICEP.Create(Application);
  Formulario.ECEP.Text := ECEP.Text;

  Formulario.BBPesquisar.Click;
  if Formulario.ShowModal = mrOK then
  begin
     ELogradouro.Text := Formulario.ELogradouro.Text;
     ECidade.Text     := Formulario.ECidade.Text;
     EBairro.Text     := Formulario.EBairro.Text;
     EComplemento.Text:= Formulario.EComplemento.Text;
     EUF.Text         := Formulario.EUF.Text;
  end;
  Formulario.Destroy;
end;

procedure TFDadosPessoa.BBGravarClick(Sender: TObject);
begin
  inherited;
  if (ObjetoPessoa.acao <> acExcluir) and fValidacoesPessoa then
    Exit;

  try
    //Pessoa
    ObjetoPessoa.dsdocumento := EDocumento.Text;
    ObjetoPessoa.nmprimeiro  := E1Nome.Text;
    ObjetoPessoa.nmsegundo   := E2Nome.Text;
    ObjetoPessoa.dtregistro  := Date;
    if RGSexo.ItemIndex = Integer(TSexo.F) then
      ObjetoPessoa.flnatureza := cSexoF
    else
      ObjetoPessoa.flnatureza := cSexoM;
    //CEP
    ObjetoPessoa.CEP.dsnumero:= StrToIntDef(ENo.Text,0);
    //Endere�o
    ObjetoPessoa.CEP.dscep.dscep        := ECEP.Text;
    ObjetoPessoa.CEP.dscep.nmlogradouro := ELogradouro.Text;
    ObjetoPessoa.CEP.dscep.nmbairro     := EBairro.Text;
    ObjetoPessoa.CEP.dscep.nmcidade     := ECidade.Text;
    ObjetoPessoa.CEP.dscep.dscomplemento:= EComplemento.Text;
    ObjetoPessoa.CEP.dscep.dsuf         := EUF.Text;

    ClientModuleWKX.InsertPessoa(ObjetoPessoa);
  finally
    Close;
  end;
end;

destructor TFDadosPessoa.Destroy;
begin
  FreeAndNil(ObjetoPessoa);
  inherited;
end;

procedure TFDadosPessoa.FormCreate(Sender: TObject);
begin
  inherited;
  ObjetoPessoa := TPessoa.Create;
end;

procedure TFDadosPessoa.FormShow(Sender: TObject);
begin
  inherited;
  HabilitarControls;
  if ObjetoPessoa.acao = acIncluir then
    Self.Caption := Self.Caption + ' - ' + cAcaoIncluir
  else
  begin
    //Pessoa
    EDocumento.Text    := ObjetoPessoa.dsdocumento;
    E1Nome.Text        := ObjetoPessoa.nmprimeiro;
    E2Nome.Text        := ObjetoPessoa.nmsegundo;
    if ObjetoPessoa.flnatureza = cSexoM then
      RGSexo.ItemIndex := Integer(TSexo.M)
    else
      RGSexo.ItemIndex := Integer(TSexo.F);
    //CEP
    ENo.Text           := IntToStr(ObjetoPessoa.CEP.dsnumero);
    //Endere�o
    ECEP.Text          := ObjetoPessoa.CEP.dscep.dscep;
    ELogradouro.Text   := ObjetoPessoa.CEP.dscep.nmlogradouro;
    EBairro.Text       := ObjetoPessoa.CEP.dscep.nmbairro;
    ECidade.Text       := ObjetoPessoa.CEP.dscep.nmcidade;
    EComplemento.Text  := ObjetoPessoa.CEP.dscep.dscomplemento;
    EUF.Text           := ObjetoPessoa.CEP.dscep.dsuf;

    if ObjetoPessoa.acao = acExcluir then
    begin
      DesabilitarControls;
      Self.Caption := Self.Caption + ' - ' + cAcaoExcluir;
    end
    else
    begin
      DesabilitarControls(False);
      Self.Caption := Self.Caption + ' - ' + cAcaoAlterar;
    end;
  end;

  EDocumento.SetFocus;
end;

procedure TFDadosPessoa.HabilitarControls;
begin
  //Pessoa
  EDocumento.ReadOnly  := False;
  E1Nome.ReadOnly      := False;
  E2Nome.ReadOnly      := False;
  RGSexo.Enabled       := True;
  //CEP
  ECEP.ReadOnly        := False;
  BBCEP.Enabled        := True;
  ENo.ReadOnly         := False;
  //Endere�o
  EComplemento.ReadOnly:= False;
end;

procedure TFDadosPessoa.DesabilitarControls(pCEP: Boolean = True);
begin
  //Pessoa
  if pCEP then
  begin
    EDocumento.ReadOnly  := True;
    E1Nome.ReadOnly      := True;
    E2Nome.ReadOnly      := True;
    RGSexo.Enabled       := False;
    //CEP
    ECEP.ReadOnly        := True;
    BBCEP.Enabled        := False;
    ENo.ReadOnly         := True;
    //Endere�o
    EComplemento.ReadOnly:= True;
  end;
end;

function TFDadosPessoa.fValidacoesPessoa: Boolean;
var sCodigo : String;
begin
  result := false;
  if Trim(EDocumento.Text) = Empty then
  begin
    Beep;
    ShowMessage('Aten��o Informe o Documento!');
    result := true;
  end;

  if Trim(E1Nome.Text) = Empty then
  begin
    Beep;
    ShowMessage('Aten��o! Informe o 1� Nome');
    result := true;
  end;

  if Trim(E2Nome.Text) = Empty then
  begin
    Beep;
    ShowMessage('Aten��o! Informe o 2� Nome');
    result := true;
  end;

  if Trim(ECEP.Text) = Empty then
  begin
    Beep;
    ShowMessage('Aten��o! Informe o CEP');
    result := true;
  end
  else
  begin
    if DMClaAPIRest.fPesquisaCEPAPI(Trim(ECEP.Text)) = Empty then
    begin
      Beep;
      ShowMessage('Aten��o! Informe um CEP v�lido.');
      result := true;
    end;
  end;

  if Trim(ELogradouro.Text) = Empty then
  begin
    Beep;
    ShowMessage('Aten��o! Informe o Endere�o v�lido');
    result := true;
  end;

  if StrToIntDef(ENo.Text,0) = cZero then
  begin
    Beep;
    ShowMessage('Aten��o! Informe o n�mero do Endere�o');
    result := true;
  end;

  sCodigo := ClientModuleWKX.DocumentoPessoa(Trim(EDocumento.Text), IntToStr(ObjetoPessoa.idpessoa));
  if sCodigo <> Empty then
  begin
    Beep;
    ShowMessage('Aten��o! '+cEOL+
                'Pessoa com Documento '+EDocumento.Text+' j� cadastrado com o C�digo '+sCodigo);
    result := true;
  end;
end;

end.
