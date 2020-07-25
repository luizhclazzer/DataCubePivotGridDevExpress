unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxClasses, cxCustomData, cxStyles, cxEdit,
  cxCustomPivotGrid, cxDBPivotGrid, Vcl.ExtCtrls, Data.DBXFirebird, Data.DB,
  Data.SqlExpr, Data.FMTBcd, Datasnap.Provider, Datasnap.DBClient, Vcl.StdCtrls,
  cxFilter, cxData, cxDataStorage, cxNavigator, {dxDateRanges, }cxDBData,
  cxGridChartView, cxGridLevel, cxPivotGridChartConnection, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxSplitter,
  Vcl.Menus, Vcl.ActnList, dxDateRanges, dxScrollbarAnnotations, Vcl.Grids,
  Vcl.DBGrids;

type
  TFMain = class(TForm)
    PivotGrid: TcxDBPivotGrid;
    Panel1: TPanel;
    ds: TDataSource;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1: TcxGrid;
    cxPivotGridChartConnection: TcxPivotGridChartConnection;
    cxGrid1Level2: TcxGridLevel;
    cxGrid1ChartView: TcxGridChartView;
    Button2: TButton;
    cxSplitter1: TcxSplitter;
    mmMain: TMainMenu;
    miFile: TMenuItem;
    miExport: TMenuItem;
    miExportToXLSX: TMenuItem;
    miDataOnly1: TMenuItem;
    miWYSIWYG1: TMenuItem;
    miExportToExcel: TMenuItem;
    miDataOnly2: TMenuItem;
    miWYSIWYG2: TMenuItem;
    miExportToHtml: TMenuItem;
    miExportToText: TMenuItem;
    miExportToXml: TMenuItem;
    Separator1: TMenuItem;
    miExit: TMenuItem;
    miOptions: TMenuItem;
    miTotalsPosition: TMenuItem;
    miColumnTotalsPosition: TMenuItem;
    miColumnTotalsPositionFar: TMenuItem;
    miColumnTotalsPositionNear: TMenuItem;
    miRowTotalsPosition: TMenuItem;
    miRowTotalsPositionFar: TMenuItem;
    miRowTotalsPositionNear: TMenuItem;
    miRowTotalsPositionTree: TMenuItem;
    SaveDialog: TSaveDialog;
    PivotGridCOMPANY: TcxDBPivotGridField;
    PivotGridADMISSIONDATE: TcxDBPivotGridField;
    PivotGridLOCAL: TcxDBPivotGridField;
    PivotGridDESCFUNCTION: TcxDBPivotGridField;
    PivotGridNAME: TcxDBPivotGridField;
    PivotGridSALARY: TcxDBPivotGridField;
    btnChart: TButton;
    procedure Button2Click(Sender: TObject);
    procedure PivotGridCustomization(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure miExportToClick(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure miTotalsLocationClick(Sender: TObject);
    procedure btnChartClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
  public
    { Public declarations }
  end;

var
  FMain: TFMain;

implementation

uses
  uSqlEdit, cxExportPivotGridLink, uDM;

{$R *.dfm}

procedure TFMain.btnChartClick(Sender: TObject);
begin
  //The chart will reflect the user's selections
  if cxPivotGridChartConnection.PivotGrid = nil then
    cxPivotGridChartConnection.PivotGrid := PivotGrid;
end;

procedure TFMain.Button2Click(Sender: TObject);
begin
  PivotGrid.Customization.Visible := not PivotGrid.Customization.Visible;
end;

procedure TFMain.Button3Click(Sender: TObject);
begin
//  Application.CreateForm(TSQLEdit, SQLEdit);
//  try
//    SQLEdit.SQL := qry.SQL;
//    if SQLEdit.ShowModal = mrOk then
//      begin
//      if SQLEdit.SQL.Text <> EmptyStr then
//        begin
//        FDM.cds.Close;
//        PivotGrid.DeleteAllFields;
//        qry.SQL := SQLEdit.SQL;
//        cds.Open;
//        PivotGrid.CreateAllFields;
//      end;
//    end;
//  finally
//    SQLEdit.Free;
//  end;
end;

procedure TFMain.Button4Click(Sender: TObject);
begin
  if Assigned(cxPivotGridChartConnection.PivotGrid) then
    cxPivotGridChartConnection.PivotGrid := nil
  else
    cxPivotGridChartConnection.PivotGrid := PivotGrid;
end;

procedure TFMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //The properties to store and restore are specified by the Properties list
  PivotGrid.StoreToRegistry('DataCubePivotGrid');
end;

procedure TFMain.FormCreate(Sender: TObject);
begin
  PivotGrid.ApplyBestFit;
  PivotGrid.Customization.Site := Self;
  PivotGrid.Customization.Visible := False;
  PivotGrid.OptionsSelection.MultiSelect := True;
  PivotGrid.RestoreFromRegistry('DataCubePivotGrid');
end;

procedure TFMain.miTotalsLocationClick(Sender: TObject);
begin
  case TComponent(Sender).Tag of
    0, 1:
      PivotGrid.OptionsView.ColumnTotalsLocation := TcxPivotGridColumnTotalsLocation(TComponent(Sender).Tag);
    2, 3, 4:
      PivotGrid.OptionsView.RowTotalsLocation := TcxPivotGridRowTotalsLocation(TComponent(Sender).Tag - 2);
  end;
end;

procedure TFMain.miExitClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFMain.miExportToClick(Sender: TObject);
begin
  if SaveDialog.Execute then
  begin
    case TComponent(Sender).Tag of
      2:
        cxExportPivotGridToText(SaveDialog.FileName, PivotGrid);
      3:
        cxExportPivotGridToHTML(SaveDialog.FileName, PivotGrid);
      4:
        cxExportPivotGridToXML(SaveDialog.FileName, PivotGrid);
      11:
        cxExportPivotGridDataToExcel(ChangeFileExt(SaveDialog.FileName, '.xls'), PivotGrid);
      12:
        cxExportPivotGridToExcel(SaveDialog.FileName, PivotGrid);
      51:
        cxExportPivotGridDataToExcel(ChangeFileExt(SaveDialog.FileName, '.xlsx'), PivotGrid);
      52:
        cxExportPivotGridToXLSX(SaveDialog.FileName, PivotGrid);
    end;
  end;
end;

procedure TFMain.PivotGridCustomization(Sender: TObject);
begin
  if PivotGrid.Customization.Visible then
    PivotGrid.Customization.Form.Align := alLeft;
  cxSplitter1.Control := PivotGrid.Customization.Form;
  cxSplitter1.Visible := PivotGrid.Customization.Visible;
end;

end.
