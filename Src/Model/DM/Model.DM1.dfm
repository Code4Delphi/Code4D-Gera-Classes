object DM: TDM
  OnCreate = DataModuleCreate
  Height = 468
  Width = 843
  object FDConnection1: TFDConnection
    Params.Strings = (
      'User_Name=root'
      'Server=127.0.0.1'
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 64
    Top = 24
  end
  object FDMetaInfoQueryTabelas: TFDMetaInfoQuery
    Aggregates = <
      item
        Name = 'Marcado'
      end>
    Connection = FDConnection1
    Left = 64
    Top = 80
    object FDMetaInfoQueryTabelasRECNO: TIntegerField
      FieldName = 'RECNO'
      ReadOnly = True
    end
    object FDMetaInfoQueryTabelasCATALOG_NAME: TWideStringField
      FieldName = 'CATALOG_NAME'
      ReadOnly = True
      Visible = False
      Size = 128
    end
    object FDMetaInfoQueryTabelasSCHEMA_NAME: TWideStringField
      FieldName = 'SCHEMA_NAME'
      ReadOnly = True
      Visible = False
      Size = 128
    end
    object FDMetaInfoQueryTabelasTABLE_NAME: TWideStringField
      FieldName = 'TABLE_NAME'
      ReadOnly = True
      Size = 128
    end
    object FDMetaInfoQueryTabelasTABLE_TYPE: TIntegerField
      FieldName = 'TABLE_TYPE'
      ReadOnly = True
    end
    object FDMetaInfoQueryTabelasTABLE_SCOPE: TIntegerField
      FieldName = 'TABLE_SCOPE'
      ReadOnly = True
    end
  end
  object FDMemTableTabelas: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 200
    Top = 80
    object FDMemTableTabelasmarcado: TStringField
      FieldName = 'marcado'
      Size = 1
    end
    object FDMemTableTabelasrec_no: TIntegerField
      FieldName = 'rec_no'
    end
    object FDMemTableTabelasnome_tabela: TStringField
      FieldName = 'nome_tabela'
      Size = 60
    end
  end
  object DS_FDMemTableTabelas: TDataSource
    DataSet = FDMemTableTabelas
    Left = 464
    Top = 216
  end
  object FDMetaInfoQueryFIelds: TFDMetaInfoQuery
    Connection = FDConnection1
    MetaInfoKind = mkTableFields
    ObjectName = 'agenda'
    Left = 56
    Top = 136
    object FDMetaInfoQueryFIeldsRECNO: TIntegerField
      FieldName = 'RECNO'
      ReadOnly = True
    end
    object FDMetaInfoQueryFIeldsCATALOG_NAME: TWideStringField
      FieldName = 'CATALOG_NAME'
      ReadOnly = True
      Size = 128
    end
    object FDMetaInfoQueryFIeldsSCHEMA_NAME: TWideStringField
      FieldName = 'SCHEMA_NAME'
      ReadOnly = True
      Size = 128
    end
    object FDMetaInfoQueryFIeldsTABLE_NAME: TWideStringField
      FieldName = 'TABLE_NAME'
      ReadOnly = True
      Size = 128
    end
    object FDMetaInfoQueryFIeldsCOLUMN_NAME: TWideStringField
      FieldName = 'COLUMN_NAME'
      ReadOnly = True
      Size = 128
    end
    object FDMetaInfoQueryFIeldsCOLUMN_POSITION: TIntegerField
      FieldName = 'COLUMN_POSITION'
      ReadOnly = True
    end
    object FDMetaInfoQueryFIeldsCOLUMN_DATATYPE: TIntegerField
      FieldName = 'COLUMN_DATATYPE'
      ReadOnly = True
    end
    object FDMetaInfoQueryFIeldsCOLUMN_TYPENAME: TWideStringField
      FieldName = 'COLUMN_TYPENAME'
      ReadOnly = True
      Size = 128
    end
    object FDMetaInfoQueryFIeldsCOLUMN_ATTRIBUTES: TLongWordField
      FieldName = 'COLUMN_ATTRIBUTES'
      ReadOnly = True
    end
    object FDMetaInfoQueryFIeldsCOLUMN_PRECISION: TIntegerField
      FieldName = 'COLUMN_PRECISION'
      ReadOnly = True
    end
    object FDMetaInfoQueryFIeldsCOLUMN_SCALE: TIntegerField
      FieldName = 'COLUMN_SCALE'
      ReadOnly = True
    end
    object FDMetaInfoQueryFIeldsCOLUMN_LENGTH: TIntegerField
      FieldName = 'COLUMN_LENGTH'
      ReadOnly = True
    end
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 464
    Top = 16
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 464
    Top = 88
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    Left = 464
    Top = 152
  end
end
