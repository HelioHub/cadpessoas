object DataModuleWK: TDataModuleWK
  OldCreateOrder = False
  Height = 463
  Width = 817
  object WKConnection: TFDConnection
    Params.Strings = (
      'Database=wkcadpessoas'
      'User_Name=postgres'
      'Password=wk@2023'
      'DriverID=PG')
    Connected = True
    LoginPrompt = False
    Left = 49
    Top = 24
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Console'
    Left = 160
    Top = 24
  end
  object FDPhysIBDriverLink1: TFDPhysIBDriverLink
    Left = 264
    Top = 24
  end
  object FDStanStorageJSONLink1: TFDStanStorageJSONLink
    Left = 264
    Top = 72
  end
  object FDStanStorageBinLink1: TFDStanStorageBinLink
    Left = 264
    Top = 128
  end
  object WKPessoa: TFDQuery
    Connection = WKConnection
    SQL.Strings = (
      'SELECT * FROM PESSOA ORDER BY IDPESSOA')
    Left = 49
    Top = 76
  end
  object WKSequencial: TFDQuery
    Connection = WKConnection
    SQL.Strings = (
      '')
    Left = 49
    Top = 136
  end
end
