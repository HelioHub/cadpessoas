object FGridBase: TFGridBase
  Left = 0
  Top = 0
  Caption = 'Grid Base'
  ClientHeight = 434
  ClientWidth = 890
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object PHead: TPanel
    Left = 0
    Top = 0
    Width = 890
    Height = 44
    Align = alTop
    TabOrder = 0
    object LNR: TLabel
      Left = 768
      Top = 16
      Width = 60
      Height = 13
      Caption = 'N'#186' Registros'
    end
    object BBIncluir: TBitBtn
      Left = 8
      Top = 11
      Width = 75
      Height = 25
      Caption = 'Incluir'
      TabOrder = 0
    end
    object BBAlterar: TBitBtn
      Left = 89
      Top = 11
      Width = 75
      Height = 25
      Caption = 'Alterar'
      TabOrder = 1
    end
    object BBExcluir: TBitBtn
      Left = 170
      Top = 11
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 2
    end
    object BBAtualizar: TBitBtn
      Left = 684
      Top = 11
      Width = 75
      Height = 25
      Caption = 'Atualizar'
      TabOrder = 3
      OnClick = BBAtualizarClick
    end
    object BBSair: TBitBtn
      Left = 251
      Top = 11
      Width = 75
      Height = 25
      Caption = 'Sair'
      TabOrder = 4
      OnClick = BBSairClick
    end
    object ENR: TEdit
      Left = 834
      Top = 13
      Width = 45
      Height = 21
      Alignment = taRightJustify
      NumbersOnly = True
      TabOrder = 5
      Text = '100'
    end
  end
  object PRodape: TPanel
    Left = 0
    Top = 412
    Width = 890
    Height = 22
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 411
  end
  object PView: TPanel
    Left = 0
    Top = 44
    Width = 890
    Height = 368
    Align = alClient
    TabOrder = 2
    ExplicitTop = 49
    ExplicitHeight = 376
    object DBGView: TDBGrid
      Left = 1
      Top = 1
      Width = 888
      Height = 366
      Align = alClient
      DataSource = DSBase
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object DSBase: TDataSource
    Left = 432
    Top = 152
  end
end