unit uSqlEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, VsCheckBox,
  VsCombo, VsMask, VsEdit, Vcl.ExtCtrls, SyntaxEditor, Vcl.ImgList,
  System.Actions, Vcl.ActnList, Vcl.Menus, Highlighter, SQLHighlighter;

type
  TSQLEdit = class(TForm)
    SQLHighlighter1: TSQLHighlighter;
    OD: TOpenDialog;
    SD: TSaveDialog;
    FD: TFindDialog;
    RD: TReplaceDialog;
    pmSearch: TPopupMenu;
    miProcurar: TMenuItem;
    miProximo: TMenuItem;
    miSubstituir: TMenuItem;
    acSQLComandos: TActionList;
    actIncluir: TAction;
    actParametros: TAction;
    actLiberar: TAction;
    actExcluir: TAction;
    actPesquisar: TAction;
    actFiltrar: TAction;
    actOK: TAction;
    actCancelar: TAction;
    actLerArquivo: TAction;
    actSalvar: TAction;
    actExcluirEdicao: TAction;
    actExaminarSQL: TAction;
    ilSQLComando: TImageList;
    Memo: TSyntaxEdit;
    PanBotMemo: TPanel;
    btnOK: TSpeedButton;
    btnCancelar: TSpeedButton;
    procedure actOKExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
  private
    FSQL: TStrings;
    procedure SetSQL(const Value: TStrings);
    { Private declarations }
  public
    property SQL: TStrings read FSQL write SetSQL;
  end;

var
  SQLEdit: TSQLEdit;

implementation

{$R *.dfm}

procedure TSQLEdit.actCancelarExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TSQLEdit.actOKExecute(Sender: TObject);
begin
  FSQL.Text := Memo.Text;
  ModalResult := mrOk;
end;

procedure TSQLEdit.SetSQL(const Value: TStrings);
begin
  if FSQL <> Value then
    begin
    FSQL := Value;
    Memo.ClearAll(False, False);
    Memo.Text := Value.Text;
  end;
end;

end.
