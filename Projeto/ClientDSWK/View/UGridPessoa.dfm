inherited FGridPessoa: TFGridPessoa
  Caption = 'Cadastro de Pessoas'
  ClientHeight = 547
  ExplicitWidth = 906
  ExplicitHeight = 586
  PixelsPerInch = 96
  TextHeight = 13
  inherited PHead: TPanel
    Height = 79
    Color = 13565951
    ParentBackground = False
    ExplicitLeft = 1
    ExplicitHeight = 79
    inherited LNR: TLabel
      Anchors = [akTop, akRight]
    end
    object LCodigo: TLabel [1]
      Left = 14
      Top = 47
      Width = 37
      Height = 13
      Caption = 'C'#243'digo:'
    end
    object SPPesquisa: TSpeedButton [2]
      Left = 121
      Top = 44
      Width = 23
      Height = 22
      Hint = 'Clique para efetuar pesquisa pelo C'#243'digo.'
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555000555
        55555555008880055555555088CCC880555555508C888C8055555508CCCCCCC8
        05555508CECCCCC805555508CEECCCC8055555508C444C805555555088FFF880
        5555555508FFF80555555555508F805555555555508F805555555555508F8055
        55555555508F8055555555550888880555555555500000555555}
      ParentShowHint = False
      ShowHint = True
      OnClick = SPPesquisaClick
    end
    inherited BBIncluir: TBitBtn
      OnClick = BBIncluirClick
    end
    inherited BBAlterar: TBitBtn
      Left = 88
      OnClick = BBAlterarClick
      ExplicitLeft = 88
    end
    inherited BBExcluir: TBitBtn
      Left = 169
      OnClick = BBExcluirClick
      ExplicitLeft = 169
    end
    inherited BBAtualizar: TBitBtn
      Anchors = [akTop, akRight]
      TabOrder = 7
      OnClick = BBAtualizarClick
    end
    inherited BBSair: TBitBtn
      Left = 412
      TabOrder = 5
      ExplicitLeft = 412
    end
    inherited ENR: TEdit
      Anchors = [akTop, akRight]
      TabOrder = 8
    end
    inherited BBImportacao: TBitBtn
      Left = 250
      Anchors = [akTop, akRight]
      Caption = 'I&mportar'
      TabOrder = 3
      OnClick = BBImportacaoClick
      ExplicitLeft = 250
    end
    object CBAtualizar: TCheckBox
      Left = 508
      Top = 15
      Width = 171
      Height = 17
      Caption = 'Efetuar Atualiza'#231#227'o Autom'#225'tica'
      TabOrder = 6
    end
    object ECodigo: TEdit
      Left = 57
      Top = 44
      Width = 64
      Height = 21
      NumbersOnly = True
      TabOrder = 9
    end
    object BBCEP: TBitBtn
      Left = 331
      Top = 8
      Width = 75
      Height = 30
      Hint = 'Acessa cadastro de CEP'
      Anchors = [akTop, akRight]
      Caption = 'CEP'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = BBCEPClick
    end
  end
  inherited PRodape: TPanel
    Top = 441
    Height = 106
    Color = 13565951
    ParentBackground = False
    ExplicitTop = 441
    ExplicitHeight = 106
    object LCEP: TLabel
      Left = 22
      Top = 7
      Width = 23
      Height = 13
      Caption = 'CEP:'
    end
    object LLogradouro: TLabel
      Left = 22
      Top = 32
      Width = 59
      Height = 13
      Caption = 'Logradouro:'
    end
    object LNo: TLabel
      Left = 562
      Top = 32
      Width = 16
      Height = 13
      Caption = 'N'#186':'
    end
    object LBairro: TLabel
      Left = 22
      Top = 58
      Width = 32
      Height = 13
      Caption = 'Bairro:'
    end
    object LComplemento: TLabel
      Left = 509
      Top = 58
      Width = 69
      Height = 13
      Caption = 'Complemento:'
    end
    object LCidade: TLabel
      Left = 22
      Top = 84
      Width = 37
      Height = 13
      Caption = 'Cidade:'
    end
    object LUF: TLabel
      Left = 561
      Top = 84
      Width = 17
      Height = 13
      Caption = 'UF:'
    end
    object DBECEP: TDBEdit
      Left = 99
      Top = 3
      Width = 110
      Height = 21
      DataField = 'dscep'
      DataSource = DSBase
      ReadOnly = True
      TabOrder = 0
    end
    object DBELogradouro: TDBEdit
      Left = 99
      Top = 28
      Width = 452
      Height = 21
      DataField = 'nmlogradouro'
      DataSource = DSBase
      ReadOnly = True
      TabOrder = 1
    end
    object DBENo: TDBEdit
      Left = 584
      Top = 28
      Width = 57
      Height = 21
      DataField = 'dsnumero'
      DataSource = DSBase
      ReadOnly = True
      TabOrder = 2
    end
    object DBEBairro: TDBEdit
      Left = 99
      Top = 54
      Width = 404
      Height = 21
      DataField = 'nmbairro'
      DataSource = DSBase
      ReadOnly = True
      TabOrder = 3
    end
    object DBEComplemento: TDBEdit
      Left = 584
      Top = 54
      Width = 193
      Height = 21
      DataField = 'dscomplemento'
      DataSource = DSBase
      ReadOnly = True
      TabOrder = 4
    end
    object DBECidade: TDBEdit
      Left = 99
      Top = 80
      Width = 452
      Height = 21
      DataField = 'nmcidade'
      DataSource = DSBase
      ReadOnly = True
      TabOrder = 5
    end
    object DBEUF: TDBEdit
      Left = 584
      Top = 81
      Width = 193
      Height = 21
      DataField = 'dsuf'
      DataSource = DSBase
      ReadOnly = True
      TabOrder = 6
    end
  end
  inherited PView: TPanel
    Top = 79
    Height = 362
    ExplicitHeight = 397
    inherited DBGView: TDBGrid
      Height = 360
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      OnDblClick = DBGViewDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'idpessoa'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dtregistro'
          Width = 101
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dsdocumento'
          Width = 149
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nmprimeiro'
          Width = 280
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nmsegundo'
          Width = 214
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'flnatureza'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'idendereco'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'dscep'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'dsnumero'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'dsuf'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'nmcidade'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'nmbairro'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'nmlogradouro'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'dscomplemento'
          Visible = False
        end>
    end
  end
  inherited DSBase: TDataSource
    AutoEdit = False
    DataSet = ClientModuleWKX.PessoaMemTable
    Left = 416
  end
end
