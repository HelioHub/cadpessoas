object FServidorDataSnapRest: TFServidorDataSnapRest
  Left = 271
  Top = 114
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Servidor DataSnap Rest x JSON x FireDAC'
  ClientHeight = 189
  ClientWidth = 382
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 95
    Top = 105
    Width = 24
    Height = 13
    Caption = 'Port:'
  end
  object LWK: TLabel
    Left = 0
    Top = 0
    Width = 382
    Height = 46
    Hint = 'Click para acessa nosso Site. Seja Bem-Vindo!!'
    Align = alTop
    Alignment = taCenter
    Caption = 'WK Technology'
    Color = clSilver
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -40
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    ExplicitLeft = -16
    ExplicitTop = 64
  end
  object ButtonStart: TButton
    Left = 109
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 0
    OnClick = ButtonStartClick
  end
  object ButtonStop: TButton
    Left = 190
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Stop'
    TabOrder = 1
    OnClick = ButtonStopClick
  end
  object EditPort: TEdit
    Left = 128
    Top = 102
    Width = 121
    Height = 21
    TabOrder = 2
    Text = '8080'
  end
  object ButtonOpenBrowser: TButton
    Left = 32
    Top = 132
    Width = 305
    Height = 25
    Caption = 'Open Browser'
    TabOrder = 3
    OnClick = ButtonOpenBrowserClick
  end
  object ApplicationEvents1: TApplicationEvents
    OnIdle = ApplicationEvents1Idle
    Left = 344
    Top = 64
  end
end
