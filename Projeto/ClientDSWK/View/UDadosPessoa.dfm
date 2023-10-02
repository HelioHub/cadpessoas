inherited FDadosPessoa: TFDadosPessoa
  Caption = 'Dados da Pessoa'
  ClientHeight = 393
  ClientWidth = 766
  ExplicitWidth = 772
  ExplicitHeight = 422
  PixelsPerInch = 96
  TextHeight = 13
  inherited PRodape: TPanel
    Top = 352
    Width = 766
    inherited BBSair: TBitBtn
      Left = 680
      Top = 7
      ExplicitTop = 7
    end
    inherited BBGravar: TBitBtn
      Left = 597
      Top = 7
      ExplicitTop = 7
    end
  end
  inherited PDados: TPanel
    Width = 766
    Height = 352
    ExplicitLeft = 0
    ExplicitTop = 1
    ExplicitWidth = 766
    ExplicitHeight = 352
    object LDocumento: TLabel
      Left = 8
      Top = 24
      Width = 68
      Height = 14
      Caption = 'Documento:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object L1Nome: TLabel
      Left = 8
      Top = 57
      Width = 83
      Height = 14
      Caption = 'Primeiro Nome:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LSegundoNome: TLabel
      Left = 8
      Top = 94
      Width = 89
      Height = 14
      Caption = 'Segundo Nome:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LCEP: TLabel
      Left = 10
      Top = 232
      Width = 27
      Height = 14
      Caption = 'CEP:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LLogradouro: TLabel
      Left = 10
      Top = 259
      Width = 66
      Height = 14
      Caption = 'Logradouro:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LBairro: TLabel
      Left = 10
      Top = 286
      Width = 34
      Height = 14
      Caption = 'Bairro:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LCidade: TLabel
      Left = 10
      Top = 313
      Width = 40
      Height = 14
      Caption = 'Cidade:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LNo: TLabel
      Left = 514
      Top = 259
      Width = 18
      Height = 14
      Caption = 'N'#186':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LComplemento: TLabel
      Left = 514
      Top = 286
      Width = 80
      Height = 14
      Caption = 'Complemento:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LUF: TLabel
      Left = 514
      Top = 313
      Width = 18
      Height = 14
      Caption = 'UF:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object RGSexo: TRadioGroup
      Left = 10
      Top = 122
      Width = 185
      Height = 93
      Caption = 'Sexo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'Masculino '
        'Feminino')
      ParentFont = False
      TabOrder = 3
    end
    object EDocumento: TEdit
      Left = 98
      Top = 22
      Width = 121
      Height = 21
      MaxLength = 20
      TabOrder = 0
    end
    object E1Nome: TEdit
      Left = 98
      Top = 55
      Width = 344
      Height = 21
      MaxLength = 100
      TabOrder = 1
    end
    object E2Nome: TEdit
      Left = 98
      Top = 92
      Width = 344
      Height = 21
      MaxLength = 100
      TabOrder = 2
    end
    object ECEP: TEdit
      Left = 82
      Top = 229
      Width = 112
      Height = 21
      MaxLength = 15
      TabOrder = 4
    end
    object BBCEP: TBitBtn
      Left = 199
      Top = 227
      Width = 75
      Height = 25
      Caption = 'Buscar CEP'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object ELogradouro: TEdit
      Left = 82
      Top = 256
      Width = 423
      Height = 21
      MaxLength = 15
      ReadOnly = True
      TabOrder = 6
    end
    object EBairro: TEdit
      Left = 82
      Top = 283
      Width = 327
      Height = 21
      MaxLength = 50
      ReadOnly = True
      TabOrder = 8
    end
    object ECidade: TEdit
      Left = 82
      Top = 310
      Width = 423
      Height = 21
      MaxLength = 100
      ReadOnly = True
      TabOrder = 10
    end
    object ENo: TEdit
      Left = 538
      Top = 256
      Width = 79
      Height = 21
      NumbersOnly = True
      TabOrder = 7
    end
    object EComplemento: TEdit
      Left = 597
      Top = 283
      Width = 150
      Height = 21
      MaxLength = 50
      TabOrder = 9
    end
    object EUF: TEdit
      Left = 538
      Top = 310
      Width = 150
      Height = 21
      MaxLength = 50
      ReadOnly = True
      TabOrder = 11
    end
  end
end
