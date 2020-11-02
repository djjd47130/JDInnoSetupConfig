unit uSetupGeneral;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTabBase, System.Actions, Vcl.ActnList,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.Buttons,
  System.UITypes,
  JD.InnoSetup, JD.InnoSetup.Common;

type
  TfrmSetupGeneral = class(TfrmTabBase)
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    btnGenAppID: TSpeedButton;
    txtAppName: TEdit;
    txtAppVersion: TEdit;
    txtAppID: TEdit;
    txtOutputBaseFilename: TEdit;
    txtOutputDir: TEdit;
    txtAppVerName: TEdit;
    Label3: TLabel;
    txtSourceDir: TEdit;
    Label4: TLabel;
    txtAppModifyPath: TEdit;
    Label9: TLabel;
    txtAppMutex: TEdit;
    cboOutput: TComboBox;
    Label10: TLabel;
    procedure btnGenAppIDClick(Sender: TObject);
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
  frmSetupGeneral: TfrmSetupGeneral;

implementation

{$R *.dfm}

constructor TfrmSetupGeneral.CreateEmbedded(AOwner: TWinControl;
  AScript: TJDInnoSetupScript);
begin
  inherited;

end;

procedure TfrmSetupGeneral.btnGenAppIDClick(Sender: TObject);
var
  V: TGUID;
begin
  inherited;
  if MessageDlg('This will generate a new App ID GUID. Continue?',
    mtWarning, [mbYes,mbNo], 0) = mrYes then
  begin
    CreateGUID(V);
    txtAppID.Text:= '{'+ V.ToString;
  end;
end;

procedure TfrmSetupGeneral.ClearDetail;
begin
  inherited;
  //TODO
end;

function TfrmSetupGeneral.IsValid: Boolean;
begin
  Result:= True; //TODO
end;

procedure TfrmSetupGeneral.Load;
begin
  inherited;
  txtAppName.Text:= Script.Setup.Installer.AppName;
  txtAppID.Text:= Script.Setup.Installer.AppId;
  txtAppVersion.Text:= Script.Setup.Installer.AppVersion;
  txtAppVerName.Text:= Script.Setup.Installer.AppVerName;
  txtOutputBaseFilename.Text:= Script.Setup.Compiler.OutputBaseFilename;
  txtOutputDir.Text:= Script.Setup.Compiler.OutputDir;
  txtSourceDir.Text:= Script.Setup.Compiler.SourceDir;
  txtAppModifyPath.Text:= Script.Setup.Installer.AppModifyPath;
  txtAppMutex.Text:= Script.Setup.Installer.AppMutex;
  cboOutput.ItemIndex:= Integer(Script.Setup.Compiler.Output);
end;

procedure TfrmSetupGeneral.Save;
begin
  inherited;
  Script.Setup.Installer.AppName:= txtAppName.Text;
  Script.Setup.Installer.AppId:= txtAppID.Text;
  Script.Setup.Installer.AppVersion:= txtAppVersion.Text;
  Script.Setup.Installer.AppVerName:= txtAppVerName.Text;
  Script.Setup.Compiler.OutputBaseFilename:= txtOutputBaseFilename.Text;
  Script.Setup.Compiler.OutputDir:= txtOutputDir.Text;
  Script.Setup.Compiler.SourceDir:= txtSourceDir.Text;
  Script.Setup.Installer.AppModifyPath:= txtAppModifyPath.Text;
  Script.Setup.Installer.AppMutex:= txtAppMutex.Text;
  Script.Setup.Compiler.Output:= TBoolDef(cboOutput.ItemIndex);
end;

procedure TfrmSetupGeneral.SetEditState(const AEditing: Boolean);
begin
  inherited;
  txtAppName.ReadOnly:= not AEditing;
  txtAppID.ReadOnly:= not AEditing;
  btnGenAppID.Enabled:= AEditing;
  txtAppVersion.ReadOnly:= not AEditing;
  txtAppVerName.ReadOnly:= not AEditing;
  txtOutputBaseFilename.ReadOnly:= not AEditing;
  txtOutputDir.ReadOnly:= not AEditing;
  txtSourceDir.ReadOnly:= not AEditing;
  txtAppModifyPath.ReadOnly:= not AEditing;
  txtAppMutex.ReadOnly:= not AEditing;
  cboOutput.Enabled:= AEditing;
end;

procedure TfrmSetupGeneral.UpdateActions;
begin
  inherited;

end;

end.
