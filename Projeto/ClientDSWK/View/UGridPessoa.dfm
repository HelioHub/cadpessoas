inherited FGridPessoa: TFGridPessoa
  Caption = 'Cadastro de Pessoas'
  ClientHeight = 547
  ExplicitWidth = 906
  ExplicitHeight = 586
  PixelsPerInch = 96
  TextHeight = 13
  inherited PHead: TPanel
    Color = 13565951
    ParentBackground = False
    ExplicitTop = 0
    inherited LNR: TLabel
      Anchors = [akRight]
    end
    inherited BBIncluir: TBitBtn
      OnClick = BBIncluirClick
    end
    inherited BBAlterar: TBitBtn
      OnClick = BBAlterarClick
    end
    inherited BBExcluir: TBitBtn
      OnClick = BBExcluirClick
    end
    inherited BBAtualizar: TBitBtn
      Anchors = [akRight]
      OnClick = BBAtualizarClick
    end
    inherited ENR: TEdit
      Anchors = [akRight]
    end
    inherited BBImportacao: TBitBtn
      Anchors = [akRight]
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
    Height = 397
    ExplicitHeight = 397
    inherited DBGView: TDBGrid
      Height = 395
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
    DataSet = ClientModuleWKX.PessoaMemTable
    Left = 416
  end
end
