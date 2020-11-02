unit uSetupVersion;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTabBase, System.Actions, Vcl.ActnList,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls,
  JD.InnoSetup, JD.InnoSetup.Common;

type
  TfrmSetupVersion = class(TfrmTabBase)
    Label3: TLabel;
    txtCompany: TEdit;
    Label1: TLabel;
    txtCopyright: TEdit;
    Label2: TLabel;
    txtDescription: TEdit;
    Label4: TLabel;
    txtOriginalFileName: TEdit;
    Label5: TLabel;
    txtProductName: TEdit;
    Label6: TLabel;
    txtProductTextVersion: TEdit;
    Label7: TLabel;
    txtProductVersion: TEdit;
    Label8: TLabel;
    txtTextVersion: TEdit;
    Label9: TLabel;
    txtVersion: TEdit;
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
  frmSetupVersion: TfrmSetupVersion;

implementation

{$R *.dfm}

{ TfrmSetupVersion }

constructor TfrmSetupVersion.CreateEmbedded(AOwner: TWinControl;
  AScript: TJDInnoSetupScript);
begin
  inherited;

end;

procedure TfrmSetupVersion.ClearDetail;
begin
  inherited;

end;

function TfrmSetupVersion.IsValid: Boolean;
begin
  Result:= True;
end;

procedure TfrmSetupVersion.Load;
begin
  inherited;
  txtCompany.Text:= Script.Setup.Compiler.VersionInfoCompany;
  txtCopyright.Text:= Script.Setup.Compiler.VersionInfoCopyright;
  txtDescription.Text:= Script.Setup.Compiler.VersionInfoDescription;
  txtOriginalFileName.Text:= Script.Setup.Compiler.VersionInfoOriginalFileName;
  txtProductName.Text:= Script.Setup.Compiler.VersionInfoProductName;
  txtProductTextVersion.Text:= Script.Setup.Compiler.VersionInfoProductTextVersion;
  txtProductVersion.Text:= Script.Setup.Compiler.VersionInfoProductVersion;
  txtTextVersion.Text:= Script.Setup.Compiler.VersionInfoTextVersion;
  txtVersion.Text:= Script.Setup.Compiler.VersionInfoVersion;
end;

procedure TfrmSetupVersion.Save;
begin
  inherited;
  Script.Setup.Compiler.VersionInfoCompany:= txtCompany.Text;
  Script.Setup.Compiler.VersionInfoCopyright:= txtCopyright.Text;
  Script.Setup.Compiler.VersionInfoDescription:= txtDescription.Text;
  Script.Setup.Compiler.VersionInfoOriginalFileName:= txtOriginalFileName.Text;
  Script.Setup.Compiler.VersionInfoProductName:= txtProductName.Text;
  Script.Setup.Compiler.VersionInfoProductTextVersion:= txtProductTextVersion.Text;
  Script.Setup.Compiler.VersionInfoProductVersion:= txtProductVersion.Text;
  Script.Setup.Compiler.VersionInfoTextVersion:= txtTextVersion.Text;
  Script.Setup.Compiler.VersionInfoVersion:= txtVersion.Text;
end;

procedure TfrmSetupVersion.SetEditState(const AEditing: Boolean);
begin
  inherited;
  txtCompany.ReadOnly:= not AEditing;
  txtCopyright.ReadOnly:= not AEditing;
  txtDescription.ReadOnly:= not AEditing;
  txtOriginalFileName.ReadOnly:= not AEditing;
  txtProductName.ReadOnly:= not AEditing;
  txtProductTextVersion.ReadOnly:= not AEditing;
  txtProductVersion.ReadOnly:= not AEditing;
  txtTextVersion.ReadOnly:= not AEditing;
  txtVersion.ReadOnly:= not AEditing;
end;

procedure TfrmSetupVersion.UpdateActions;
begin
  inherited;

end;

end.
