program DataCubePivotGrid;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {FMain},
  uDM in 'uDM.pas' {FDM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFMain, FMain);
  Application.CreateForm(TFDM, FDM);
  Application.Run;
end.
