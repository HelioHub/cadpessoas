object ClientModuleWKX: TClientModuleWKX
  OldCreateOrder = False
  Height = 271
  Width = 415
  object DSRestConnectionWK: TDSRestConnection
    Host = 'localhost'
    Port = 8080
    LoginPrompt = False
    Left = 48
    Top = 40
    UniqueId = '{A5B5996F-46DA-4AAD-95F2-DCABF7627727}'
  end
  object FDStanStorageJSONLink1: TFDStanStorageJSONLink
    Left = 176
    Top = 40
  end
  object FDStanStorageBinLink1: TFDStanStorageBinLink
    Left = 304
    Top = 40
  end
  object PessoaMemTable: TFDMemTable
    FieldDefs = <>
    CachedUpdates = True
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    StoreDefs = True
    Left = 48
    Top = 96
  end
end
