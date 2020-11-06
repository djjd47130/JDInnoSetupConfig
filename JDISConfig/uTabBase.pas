unit uTabBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  System.UITypes,
  uDM,
  JD.InnoSetup, System.Actions, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin;

type
  TfrmTabBase = class;

  TfrmTabBaseClass = class of TfrmTabBase;

  TfrmTabBase = class(TForm)
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    Acts: TActionList;
    actEditItem: TAction;
    actSaveItem: TAction;
    actCancelItem: TAction;
    procedure actEditItemExecute(Sender: TObject);
    procedure actSaveItemExecute(Sender: TObject);
    procedure actCancelItemExecute(Sender: TObject);
  private
    FScript: TJDInnoSetupScript;
    FEditing: Boolean;
    FModified: Boolean;
    FOnChanged: TNotifyEvent;
    procedure SetModified(const Value: Boolean);
  public
    constructor CreateEmbedded(AOwner: TWinControl; AScript: TJDInnoSetupScript); virtual;
    procedure SetEditState(const AEditing: Boolean); virtual;
    procedure UpdateActions; reintroduce; virtual;
    procedure ClearDetail; virtual;
    function IsValid: Boolean; virtual;
    procedure Load; virtual;
    procedure Save; virtual;
    function Editing: Boolean;
    function Script: TJDInnoSetupScript;
    procedure DoOnChanged; virtual;
    property Modified: Boolean read FModified write SetModified;
    property OnChanged: TNotifyEvent read FOnChanged write FOnChanged;
  end;

var
  frmTabBase: TfrmTabBase;

implementation

{$R *.dfm}

constructor TfrmTabBase.CreateEmbedded(AOwner: TWinControl;
  AScript: TJDInnoSetupScript);
begin
  inherited Create(AOwner);
  FScript:= AScript;
  Self.Parent:= AOwner;
  Self.BorderStyle:= bsNone;
  Self.Align:= alClient;
  Self.Show;
  AOwner.Tag:= 1; //So that main screen can know which tabs have embedded form
  SetEditState(False);
  UpdateActions;
end;

procedure TfrmTabBase.DoOnChanged;
begin
  if Assigned(FOnChanged) then
    FOnChanged(Self);
end;

procedure TfrmTabBase.actCancelItemExecute(Sender: TObject);
begin
  SetEditState(False);
  Load;
  UpdateActions;
end;

procedure TfrmTabBase.actEditItemExecute(Sender: TObject);
begin
  SetEditState(True);
end;

procedure TfrmTabBase.actSaveItemExecute(Sender: TObject);
begin
  if IsValid then begin
    Save;
    SetEditState(False);
  end else begin
    MessageDlg('The information entered is not valid.', mtError, [mbOK], 0);
  end;
end;

procedure TfrmTabBase.ClearDetail;
begin

end;

function TfrmTabBase.Editing: Boolean;
begin
  Result:= FEditing;
end;

function TfrmTabBase.Script: TJDInnoSetupScript;
begin
  Result:= FScript;
end;

function TfrmTabBase.IsValid: Boolean;
begin
  Result:= True;
end;

procedure TfrmTabBase.SetEditState(const AEditing: Boolean);
begin
  FEditing:= AEditing;
  UpdateActions;
end;

procedure TfrmTabBase.SetModified(const Value: Boolean);
begin
  FModified := Value;
end;

procedure TfrmTabBase.UpdateActions;
begin
  actEditItem.Enabled:= (not FEditing);
  actSaveItem.Enabled:= FEditing;
  actCancelItem.Enabled:= FEditing;
end;

procedure TfrmTabBase.Load;
begin

end;

procedure TfrmTabBase.Save;
begin
  FModified:= True;
  DoOnChanged;
end;

end.
