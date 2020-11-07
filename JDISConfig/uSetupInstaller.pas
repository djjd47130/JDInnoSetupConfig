unit uSetupInstaller;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTabBase, System.Actions, Vcl.ActnList,
  Vcl.ComCtrls, Vcl.ToolWin,
  JD.InnoSetup, JD.InnoSetup.Common, Vcl.StdCtrls, Vcl.Samples.Spin;

type
  TfrmSetupInstaller = class(TfrmTabBase)
    Label3: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    cboAlwaysRestart: TComboBox;
    cboChangesAssociations: TComboBox;
    cboChangesEnvironment: TComboBox;
    txtChangesAssociations: TEdit;
    txtChangesEnvironment: TEdit;
    Label4: TLabel;
    cboCloseApplications: TComboBox;
    Label5: TLabel;
    txtCloseApplicationsFilter: TEdit;
    Label6: TLabel;
    cboCreateAppDir: TComboBox;
    Label7: TLabel;
    cboDirExistsWarning: TComboBox;
    Label8: TLabel;
    cboEnableDirDoesntExistWarning: TComboBox;
    Label9: TLabel;
    seExtraDiskSpaceRequired: TSpinEdit;
    Label10: TLabel;
    cboLanguageDetectionMethod: TComboBox;
    Label11: TLabel;
    cboRestartApplications: TComboBox;
    Label12: TLabel;
    cboRestartIfNeededByRun: TComboBox;
    Label13: TLabel;
    cboSetupLogging: TComboBox;
    txtSetupMutex: TEdit;
    Label14: TLabel;
    Label15: TLabel;
    cboShowLanguageDialog: TComboBox;
    seTimestampRounding: TSpinEdit;
    Label16: TLabel;
    cboTimeStampsInUTC: TComboBox;
    Label17: TLabel;
    Label18: TLabel;
    cboTouchDate: TComboBox;
    Label19: TLabel;
    cboTouchTime: TComboBox;
    dtTouchDate: TDateTimePicker;
    dtTouchTime: TDateTimePicker;
    procedure cboChangesAssociationsClick(Sender: TObject);
    procedure cboChangesEnvironmentClick(Sender: TObject);
    procedure cboTouchDateClick(Sender: TObject);
    procedure cboTouchTimeClick(Sender: TObject);
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
  frmSetupInstaller: TfrmSetupInstaller;

implementation

{$R *.dfm}

{ TfrmSetupInstaller }

constructor TfrmSetupInstaller.CreateEmbedded(AOwner: TWinControl;
  AScript: TJDInnoSetupScript);
begin
  inherited;

end;

procedure TfrmSetupInstaller.cboChangesAssociationsClick(Sender: TObject);
begin
  inherited;
  txtChangesAssociations.Visible:= cboChangesAssociations.ItemIndex = 3;
end;

procedure TfrmSetupInstaller.cboChangesEnvironmentClick(Sender: TObject);
begin
  inherited;
  txtChangesEnvironment.Visible:= cboChangesEnvironment.ItemIndex = 3;
end;

procedure TfrmSetupInstaller.cboTouchDateClick(Sender: TObject);
begin
  inherited;
  dtTouchDate.Visible:= cboTouchDate.ItemIndex = 3;
end;

procedure TfrmSetupInstaller.cboTouchTimeClick(Sender: TObject);
begin
  inherited;
  dtTouchTime.Visible:= cboTouchTime.ItemIndex = 3;
end;

function TfrmSetupInstaller.IsValid: Boolean;
begin
  Result:= True;
end;

procedure TfrmSetupInstaller.ClearDetail;
begin
  inherited;

end;

procedure TfrmSetupInstaller.Load;
begin
  inherited;
  cboAlwaysRestart.ItemIndex:= Integer(Script.Setup.Installer.AlwaysRestart);
  cboChangesAssociations.ItemIndex:= Integer(Script.Setup.Installer.ChangesAssociations.Value);
  txtChangesAssociations.Text:= Script.Setup.Installer.ChangesAssociations.Expression;
  txtChangesAssociations.Visible:= cboChangesAssociations.ItemIndex = 3;
  cboChangesEnvironment.ItemIndex:= Integer(Script.Setup.Installer.ChangesEnvironment.Value);
  txtChangesEnvironment.Text:= Script.Setup.Installer.ChangesEnvironment.Expression;
  txtChangesEnvironment.Visible:= cboChangesEnvironment.ItemIndex = 3;
  cboCloseApplications.ItemIndex:= Integer(Script.Setup.Installer.CloseApplications);
  txtCloseApplicationsFilter.Text:= Script.Setup.Installer.CloseApplicationsFilter;
  cboCreateAppDir.ItemIndex:= Integer(Script.Setup.Installer.CreateAppDir);
  cboDirExistsWarning.ItemIndex:= Integer(Script.Setup.Installer.DirExistsWarning);
  cboEnableDirDoesntExistWarning.ItemIndex:= Integer(Script.Setup.Installer.EnableDirDoesntExistWarning);
  seExtraDiskSpaceRequired.Value:= Script.Setup.Installer.ExtraDiskSpaceRequired;
  cboLanguageDetectionMethod.ItemIndex:= Integer(Script.Setup.Installer.LanguageDetectionMethod);
  cboRestartApplications.ItemIndex:= Integer(Script.Setup.Installer.RestartApplications);
  cboRestartIfNeededByRun.ItemIndex:= Integer(Script.Setup.Installer.RestartIfNeededByRun);
  cboSetupLogging.ItemIndex:= Integer(Script.Setup.Installer.SetupLogging);
  txtSetupMutex.Text:= Script.Setup.Installer.SetupMutex;
  cboShowLanguageDialog.ItemIndex:= Integer(Script.Setup.Installer.ShowLanguageDialog);
  seTimestampRounding.Value:= Script.Setup.Installer.TimeStampRounding;
  cboTimeStampsInUTC.ItemIndex:= Integer(Script.Setup.Installer.TimeStampsInUTC);
  cboTouchDate.ItemIndex:= Integer(Script.Setup.Installer.TouchDate);
  dtTouchDate.Date:= Script.Setup.Installer.TouchDateValue;
  dtTouchDate.Visible:= cboTouchDate.ItemIndex = 3;
  cboTouchTime.ItemIndex:= Integer(Script.Setup.Installer.TouchTime);
  dtTouchTime.Time:= Script.Setup.Installer.TouchTimeValue;
  dtTouchTime.Visible:= cboTouchTime.ItemIndex = 3;

end;

procedure TfrmSetupInstaller.Save;
begin
  inherited;
  Script.Setup.Installer.AlwaysRestart:= TBoolDef(cboAlwaysRestart.ItemIndex);
  Script.Setup.Installer.ChangesAssociations.Value:= TBoolDefExp(cboChangesAssociations.ItemIndex);
  Script.Setup.Installer.ChangesAssociations.Expression:= txtChangesAssociations.Text;
  Script.Setup.Installer.ChangesEnvironment.Value:= TBoolDefExp(cboChangesEnvironment.ItemIndex);
  Script.Setup.Installer.ChangesEnvironment.Expression:= txtChangesEnvironment.Text;
  Script.Setup.Installer.CloseApplications:= TJDISBoolForce(cboCloseApplications.ItemIndex);
  Script.Setup.Installer.CloseApplicationsFilter:= txtCloseApplicationsFilter.Text;
  Script.Setup.Installer.CreateAppDir:= TBoolDef(cboCreateAppDir.ItemIndex);
  Script.Setup.Installer.DirExistsWarning:= TBoolDefAuto(cboDirExistsWarning.ItemIndex);
  Script.Setup.Installer.EnableDirDoesntExistWarning:= TBoolDef(cboEnableDirDoesntExistWarning.ItemIndex);
  Script.Setup.Installer.ExtraDiskSpaceRequired:= seExtraDiskSpaceRequired.Value;
  Script.Setup.Installer.LanguageDetectionMethod:= TJDISLanguageDetectMethod(cboLanguageDetectionMethod.ItemIndex);
  Script.Setup.Installer.RestartApplications:= TBoolDef(cboRestartApplications.ItemIndex);
  Script.Setup.Installer.RestartIfNeededByRun:= TBoolDef(cboRestartIfNeededByRun.ItemIndex);
  Script.Setup.Installer.SetupLogging:= TBoolDef(cboSetupLogging.ItemIndex);
  Script.Setup.Installer.SetupMutex:= txtSetupMutex.Text;
  Script.Setup.Installer.ShowLanguageDialog:= TBoolDefAuto(cboShowLanguageDialog.ItemIndex);
  Script.Setup.Installer.TimeStampRounding:= seTimestampRounding.Value;
  Script.Setup.Installer.TimeStampsInUTC:= TBoolDef(cboTimeStampsInUTC.ItemIndex);
  Script.Setup.Installer.TouchDate:= TJDISTouchDateTimeType(cboTouchDate.ItemIndex);
  Script.Setup.Installer.TouchDateValue:= dtTouchDate.Date;
  Script.Setup.Installer.TouchTime:= TJDISTouchDateTimeType(cboTouchTime.ItemIndex);
  Script.Setup.Installer.TouchTimeValue:= dtTouchTime.Time;

end;

procedure TfrmSetupInstaller.SetEditState(const AEditing: Boolean);
begin
  inherited;
  cboAlwaysRestart.Enabled:= AEditing;
  cboChangesAssociations.Enabled:= AEditing;
  txtChangesAssociations.ReadOnly:= not AEditing;
  cboChangesEnvironment.Enabled:= AEditing;
  txtChangesEnvironment.ReadOnly:= not AEditing;
  cboCloseApplications.Enabled:= AEditing;
  txtCloseApplicationsFilter.ReadOnly:= not AEditing;
  cboCreateAppDir.Enabled:= AEditing;
  cboDirExistsWarning.Enabled:= AEditing;
  cboEnableDirDoesntExistWarning.Enabled:= AEditing;
  seExtraDiskSpaceRequired.ReadOnly:= not AEditing;
  cboLanguageDetectionMethod.Enabled:= AEditing;
  cboRestartApplications.Enabled:= AEditing;
  cboRestartIfNeededByRun.Enabled:= AEditing;
  cboSetupLogging.Enabled:= AEditing;
  txtSetupMutex.ReadOnly:= not AEditing;
  cboShowLanguageDialog.Enabled:= AEditing;
  seTimestampRounding.ReadOnly:= not AEditing;
  cboTimeStampsInUTC.Enabled:= AEditing;
  cboTouchDate.Enabled:= AEditing;
  dtTouchDate.Enabled:= AEditing;
  cboTouchTime.Enabled:= AEditing;
  dtTouchTime.Enabled:= AEditing;

end;

procedure TfrmSetupInstaller.UpdateActions;
begin
  inherited;

end;

end.
