object FDM: TFDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 150
  Width = 215
  object cds: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 88
    Top = 48
    object cdsCOMPANY: TIntegerField
      FieldName = 'COMPANY'
      Required = True
    end
    object cdsADMISSIONDATE: TDateField
      FieldName = 'ADMISSIONDATE'
      Required = True
    end
    object cdsLOCAL: TStringField
      FieldName = 'LOCAL'
      Size = 60
    end
    object cdsDESCFUNCTION: TStringField
      FieldName = 'DESCFUNCTION'
      Size = 100
    end
    object cdsNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 70
    end
    object cdsSALARY: TFloatField
      FieldName = 'SALARY'
    end
  end
end
