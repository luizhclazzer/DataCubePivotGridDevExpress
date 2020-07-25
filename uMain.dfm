object FMain: TFMain
  Left = 0
  Top = 0
  Caption = 'DataCube PivotGrid'
  ClientHeight = 729
  ClientWidth = 801
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mmMain
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PivotGrid: TcxDBPivotGrid
    Left = 8
    Top = 41
    Width = 793
    Height = 336
    Customization.AvailableFieldsSorted = True
    Customization.FormStyle = cfsAdvanced
    Align = alClient
    DataSource = ds
    Groups = <>
    OptionsPrefilter.Visible = pfvAlways
    TabOrder = 0
    OnCustomization = PivotGridCustomization
    ExplicitLeft = 48
    ExplicitTop = 97
    object PivotGridCOMPANY: TcxDBPivotGridField
      Area = faRow
      AreaIndex = 0
      DataBinding.FieldName = 'COMPANY'
      Visible = True
      UniqueName = 'COMPANY'
    end
    object PivotGridADMISSIONDATE: TcxDBPivotGridField
      AreaIndex = 0
      DataBinding.FieldName = 'ADMISSIONDATE'
      Visible = True
      UniqueName = 'ADMISSIONDATE'
    end
    object PivotGridLOCAL: TcxDBPivotGridField
      Area = faRow
      AreaIndex = 1
      DataBinding.FieldName = 'LOCAL'
      Visible = True
      UniqueName = 'LOCAL'
    end
    object PivotGridDESCFUNCTION: TcxDBPivotGridField
      Area = faRow
      AreaIndex = 2
      DataBinding.FieldName = 'DESCFUNCTION'
      Visible = True
      UniqueName = 'DESCFUNCTION'
    end
    object PivotGridNAME: TcxDBPivotGridField
      Area = faRow
      AreaIndex = 3
      DataBinding.FieldName = 'NAME'
      Visible = True
      UniqueName = 'NAME'
    end
    object PivotGridSALARY: TcxDBPivotGridField
      Area = faData
      AreaIndex = 0
      DataBinding.FieldName = 'SALARY'
      Visible = True
      UniqueName = 'SALARY'
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 801
    Height = 41
    Align = alTop
    TabOrder = 1
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 377
    Width = 801
    Height = 352
    Align = alBottom
    TabOrder = 2
    object cxGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
    end
    object cxGrid1ChartView: TcxGridChartView
      DiagramColumn.Active = True
      ToolBox.CustomizeButton = True
      ToolBox.DiagramSelector = True
    end
    object cxGrid1Level2: TcxGridLevel
      GridView = cxGrid1ChartView
    end
  end
  object Button2: TButton
    Left = 8
    Top = 9
    Width = 89
    Height = 25
    Caption = 'Customization'
    TabOrder = 3
    OnClick = Button2Click
  end
  object cxSplitter1: TcxSplitter
    Left = 0
    Top = 41
    Width = 8
    Height = 336
    HotZoneClassName = 'TcxSimpleStyle'
  end
  object btnChart: TButton
    Left = 112
    Top = 9
    Width = 89
    Height = 25
    Caption = 'Enable Chart'
    TabOrder = 5
    OnClick = btnChartClick
  end
  object ds: TDataSource
    DataSet = FDM.cds
    Left = 638
    Top = 16
  end
  object cxPivotGridChartConnection: TcxPivotGridChartConnection
    GridChartView = cxGrid1ChartView
    SourceData = sdSelected
    Left = 480
    Top = 504
  end
  object mmMain: TMainMenu
    Left = 688
    Top = 16
    object miFile: TMenuItem
      Caption = '&File'
      object miExport: TMenuItem
        Caption = 'Export'
        object miExportToXLSX: TMenuItem
          Tag = 5
          Caption = 'Excel'
          object miDataOnly1: TMenuItem
            Tag = 51
            Caption = 'Data Only'
            OnClick = miExportToClick
          end
          object miWYSIWYG1: TMenuItem
            Tag = 52
            Caption = 'WYSIWYG'
            OnClick = miExportToClick
          end
        end
        object miExportToExcel: TMenuItem
          Tag = 1
          Caption = 'Excel 97-2003'
          object miDataOnly2: TMenuItem
            Tag = 11
            Caption = 'Data Only'
            OnClick = miExportToClick
          end
          object miWYSIWYG2: TMenuItem
            Tag = 12
            Caption = 'WYSIWYG'
            OnClick = miExportToClick
          end
        end
        object miExportToHtml: TMenuItem
          Tag = 3
          Caption = 'HTML'
          OnClick = miExportToClick
        end
        object miExportToText: TMenuItem
          Tag = 2
          Caption = 'Text'
          OnClick = miExportToClick
        end
        object miExportToXml: TMenuItem
          Tag = 4
          Caption = 'XML'
          OnClick = miExportToClick
        end
      end
      object Separator1: TMenuItem
        Caption = '-'
      end
      object miExit: TMenuItem
        Caption = 'E&xit'
        Hint = 'Press to quit the demo-program'
        ShortCut = 32856
        OnClick = miExitClick
      end
    end
    object miOptions: TMenuItem
      Caption = 'Options'
      object miTotalsPosition: TMenuItem
        Caption = 'Totals Location'
        object miColumnTotalsPosition: TMenuItem
          Caption = 'Column'
          object miColumnTotalsPositionFar: TMenuItem
            AutoCheck = True
            Caption = 'Far'
            Checked = True
            GroupIndex = 4
            RadioItem = True
            OnClick = miTotalsLocationClick
          end
          object miColumnTotalsPositionNear: TMenuItem
            Tag = 1
            AutoCheck = True
            Caption = 'Near'
            GroupIndex = 4
            RadioItem = True
            OnClick = miTotalsLocationClick
          end
        end
        object miRowTotalsPosition: TMenuItem
          Caption = 'Row'
          object miRowTotalsPositionFar: TMenuItem
            Tag = 2
            AutoCheck = True
            Caption = 'Far'
            Checked = True
            GroupIndex = 5
            RadioItem = True
            OnClick = miTotalsLocationClick
          end
          object miRowTotalsPositionNear: TMenuItem
            Tag = 3
            AutoCheck = True
            Caption = 'Near'
            GroupIndex = 5
            RadioItem = True
            OnClick = miTotalsLocationClick
          end
          object miRowTotalsPositionTree: TMenuItem
            Tag = 4
            AutoCheck = True
            Caption = 'Tree'
            GroupIndex = 5
            RadioItem = True
            OnClick = miTotalsLocationClick
          end
        end
      end
    end
  end
  object SaveDialog: TSaveDialog
    Left = 744
    Top = 16
  end
end
