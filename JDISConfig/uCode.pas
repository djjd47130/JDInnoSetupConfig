unit uCode;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTabBase, System.Actions, Vcl.ActnList,
  Vcl.ComCtrls, Vcl.ToolWin, SynEdit, SynEditHighlighter, SynEditCodeFolding,
  SynHighlighterPas,
  JD.InnoSetup;

type
  TfrmCode = class(TfrmTabBase)
    Txt: TSynEdit;
    SynPas: TSynPasSyn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    constructor CreateEmbedded(AOwner: TWinControl; AScript: TJDInnoSetupScript); override;
    procedure SetEditState(const AEditing: Boolean); override;
    procedure UpdateActions; override;
    procedure ClearDetail; override;
    function IsValid: Boolean; override;
    procedure Load; override;
    procedure Save; override;
  end;

var
  frmCode: TfrmCode;

implementation

{$R *.dfm}

constructor TfrmCode.CreateEmbedded(AOwner: TWinControl;
  AScript: TJDInnoSetupScript);
begin
  inherited;

end;

procedure TfrmCode.ClearDetail;
begin
  inherited;
  Txt.Lines.Clear;
end;

procedure TfrmCode.FormCreate(Sender: TObject);
begin
  inherited;
  Txt.Align:= alClient;
end;

function TfrmCode.IsValid: Boolean;
begin
  Result:= True;
end;

procedure TfrmCode.Load;
begin
  inherited;
  Txt.Lines.Assign(Script.Code);
end;

procedure TfrmCode.Save;
begin
  inherited;
  Script.Code.Assign(Txt.Lines);
end;

procedure TfrmCode.SetEditState(const AEditing: Boolean);
begin
  inherited;
  Txt.ReadOnly:= not AEditing;
end;

procedure TfrmCode.UpdateActions;
begin
  inherited;

end;

end.
