unit uDM;

interface

uses
  SysUtils, Classes, DB, cxStyles, ImgList, Controls, cxGridTableView,
  cxGridBandedTableView, cxClasses, Forms, DBClient, MidasLib;

type
  TFDM = class(TDataModule)
    cds: TClientDataSet;
    cdsCOMPANY: TIntegerField;
    cdsADMISSIONDATE: TDateField;
    cdsLOCAL: TStringField;
    cdsDESCFUNCTION: TStringField;
    cdsNAME: TStringField;
    cdsSALARY: TFloatField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDM: TFDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TFDM.DataModuleCreate(Sender: TObject);
var
  APath: string;
begin
  APath := ExtractFilePath(Application.ExeName) + '..\..\Data\';
  cds.LoadFromFile(APath + 'PERSONS.xml');
end;

end.
