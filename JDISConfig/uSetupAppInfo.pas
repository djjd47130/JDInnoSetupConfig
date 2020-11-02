unit uSetupAppInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTabBase, System.Actions, Vcl.ActnList,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls,
  JD.InnoSetup, JD.InnoSetup.Common;

type
  TfrmSetupAppInfo = class(TfrmTabBase)
    Label3: TLabel;
    Label4: TLabel;
    txtAppPublisher: TEdit;
    txtAppPublisherURL: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    txtAppContact: TEdit;
    txtAppComments: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    txtAppReadmeFile: TEdit;
    txtLicenseFile: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    txtInfoBeforeFile: TEdit;
    txtInfoAfterFile: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    txtAppSupportPhone: TEdit;
    txtAppSupportURL: TEdit;
    Label11: TLabel;
    txtAppUpdatesURL: TEdit;
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
  frmSetupAppInfo: TfrmSetupAppInfo;

implementation

{$R *.dfm}

{ TfrmSetupAppInfo }

constructor TfrmSetupAppInfo.CreateEmbedded(AOwner: TWinControl;
  AScript: TJDInnoSetupScript);
begin
  inherited;

end;

procedure TfrmSetupAppInfo.ClearDetail;
begin
  inherited;
  //TODO
end;

function TfrmSetupAppInfo.IsValid: Boolean;
begin
  Result:= True;
end;

procedure TfrmSetupAppInfo.Load;
begin
  inherited;
  txtAppPublisher.Text:= Script.Setup.Installer.AppPublisher;
  txtAppPublisherURL.Text:= Script.Setup.Installer.AppPublisherURL;
  txtAppContact.Text:= Script.Setup.Installer.AppContact;
  txtAppComments.Text:= Script.Setup.Installer.AppComments;
  txtAppReadmeFile.Text:= Script.Setup.Installer.AppReadmeFile;
  txtLicenseFile.Text:= Script.Setup.Installer.LicenseFile;
  txtInfoBeforeFile.Text:= Script.Setup.Installer.InfoBeforeFile;
  txtInfoAfterFile.Text:= Script.Setup.Installer.InfoAfterFile;
  txtAppSupportPhone.Text:= Script.Setup.Installer.AppSupportPhone;
  txtAppSupportURL.Text:= Script.Setup.Installer.AppSupportURL;
  txtAppUpdatesURL.Text:= Script.Setup.Installer.AppUpdatesURL;
end;

procedure TfrmSetupAppInfo.Save;
begin
  inherited;
  Script.Setup.Installer.AppPublisher:= txtAppPublisher.Text;
  Script.Setup.Installer.AppPublisherURL:= txtAppPublisherURL.Text;
  Script.Setup.Installer.AppContact:= txtAppContact.Text;
  Script.Setup.Installer.AppComments:= txtAppComments.Text;
  Script.Setup.Installer.AppReadmeFile:= txtAppReadmeFile.Text;
  Script.Setup.Installer.LicenseFile:= txtLicenseFile.Text;
  Script.Setup.Installer.InfoBeforeFile:= txtInfoBeforeFile.Text;
  Script.Setup.Installer.InfoAfterFile:= txtInfoAfterFile.Text;
  Script.Setup.Installer.AppSupportPhone:= txtAppSupportPhone.Text;
  Script.Setup.Installer.AppSupportURL:= txtAppSupportURL.Text;
  Script.Setup.Installer.AppUpdatesURL:= txtAppUpdatesURL.Text;
end;

procedure TfrmSetupAppInfo.SetEditState(const AEditing: Boolean);
begin
  inherited;
  txtAppPublisher.ReadOnly:= not AEditing;
  txtAppPublisherURL.ReadOnly:= not AEditing;
  txtAppContact.ReadOnly:= not AEditing;
  txtAppComments.ReadOnly:= not AEditing;
  txtAppReadmeFile.ReadOnly:= not AEditing;
  txtLicenseFile.ReadOnly:= not AEditing;
  txtInfoBeforeFile.ReadOnly:= not AEditing;
  txtInfoAfterFile.ReadOnly:= not AEditing;
  txtAppSupportPhone.ReadOnly:= not AEditing;
  txtAppSupportURL.ReadOnly:= not AEditing;
  txtAppUpdatesURL.ReadOnly:= not AEditing;
end;

procedure TfrmSetupAppInfo.UpdateActions;
begin
  inherited;

end;

end.
