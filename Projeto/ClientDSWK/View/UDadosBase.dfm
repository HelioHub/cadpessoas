object FDadosBase: TFDadosBase
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Dados Base'
  ClientHeight = 483
  ClientWidth = 599
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
  object PRodape: TPanel
    Left = 0
    Top = 442
    Width = 599
    Height = 41
    Align = alBottom
    TabOrder = 0
    DesignSize = (
      599
      41)
    object BBSair: TBitBtn
      Left = 513
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akRight]
      Caption = '&Fechar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Kind = bkClose
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 1
      OnClick = BBSairClick
    end
    object BBGravar: TBitBtn
      Left = 430
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akRight]
      Caption = '&Gravar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Kind = bkOK
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 0
    end
  end
  object PDados: TPanel
    Left = 0
    Top = 0
    Width = 599
    Height = 442
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 8
    ExplicitTop = -6
  end
end
