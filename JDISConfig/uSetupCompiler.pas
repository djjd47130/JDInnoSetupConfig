unit uSetupCompiler;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTabBase, System.Actions, Vcl.ActnList,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.CheckLst,
  JD.InnoSetup, JD.InnoSetup.Common;

type
  TfrmSetupCompiler = class(TfrmTabBase)
    Label3: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    txtMinVersion: TEdit;
    Label9: TLabel;
    txtOnlyBelowVersion: TEdit;
    cboASLRCompatible: TComboBox;
    cboDEPCompatible: TComboBox;
    cboEncryption: TComboBox;
    cboMergeDuplicateFiles: TComboBox;
    cboTerminalServicesAware: TComboBox;
    cboUsedUserAreasWarning: TComboBox;
    cboUseSetupLdr: TComboBox;
    lstArchitecturesAllowed: TCheckListBox;
    Label10: TLabel;
    lstArchitecturesAllowedIn64BitMode: TCheckListBox;
    Label11: TLabel;
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
  frmSetupCompiler: TfrmSetupCompiler;

implementation

{$R *.dfm}

{ TfrmSetupCompiler }

constructor TfrmSetupCompiler.CreateEmbedded(AOwner: TWinControl;
  AScript: TJDInnoSetupScript);
begin
  inherited;

end;

procedure TfrmSetupCompiler.ClearDetail;
begin
  inherited;

end;

function TfrmSetupCompiler.IsValid: Boolean;
begin
  Result:= True;
end;

procedure TfrmSetupCompiler.Load;
var
  A: TJDISArchitecture;
  A64: TJDISArchitecture64;
begin
  inherited;
  cboASLRCompatible.ItemIndex:= Integer(Script.Setup.Compiler.ASLRCompatible);
  cboDEPCompatible.ItemIndex:= Integer(Script.Setup.Compiler.DEPCompatible);
  cboEncryption.ItemIndex:= Integer(Script.Setup.Compiler.Encryption);
  cboMergeDuplicateFiles.ItemIndex:= Integer(Script.Setup.Compiler.MergeDuplicateFiles);
  cboTerminalServicesAware.ItemIndex:= Integer(Script.Setup.Compiler.TerminalServicesAware);
  cboUsedUserAreasWarning.ItemIndex:= Integer(Script.Setup.Compiler.UsedUserAreasWarning);
  cboUseSetupLdr.ItemIndex:= Integer(Script.Setup.Compiler.UseSetupLdr);
  for A:= Low(TJDISArchitecture) to High(TJDISArchitecture) do begin
    if A in Script.Setup.Installer.ArchitecturesAllowed then begin
      lstArchitecturesAllowed.Checked[Integer(A)]:= True;
    end;
  end;
  for A64:= Low(TJDISArchitecture64) to High(TJDISArchitecture64) do begin
    if A64 in Script.Setup.Installer.ArchitecturesInstallIn64BitMode then begin
      lstArchitecturesAllowedIn64BitMode.Checked[Integer(A64)]:= True;
    end;
  end;
  txtMinVersion.Text:= Script.Setup.Installer.MinVersion;
  txtOnlyBelowVersion.Text:= Script.Setup.Installer.OnlyBelowVersion;
end;

procedure TfrmSetupCompiler.Save;
var
  A: TJDISArchitecture;
  A64: TJDISArchitecture64;
begin
  inherited;
  Script.Setup.Compiler.ASLRCompatible:= TBoolDef(cboASLRCompatible.ItemIndex);
  Script.Setup.Compiler.DEPCompatible:= TBoolDef(cboDEPCompatible.ItemIndex);
  Script.Setup.Compiler.Encryption:= TBoolDef(cboEncryption.ItemIndex);
  Script.Setup.Compiler.MergeDuplicateFiles:= TBoolDef(cboMergeDuplicateFiles.ItemIndex);
  Script.Setup.Compiler.TerminalServicesAware:= TBoolDef(cboTerminalServicesAware.ItemIndex);
  Script.Setup.Compiler.UsedUserAreasWarning:= TBoolDef(cboUsedUserAreasWarning.ItemIndex);
  Script.Setup.Compiler.UseSetupLdr:= TBoolDef(cboUseSetupLdr.ItemIndex);
  Script.Setup.Installer.ArchitecturesAllowed:= [];
  for A:= Low(TJDISArchitecture) to High(TJDISArchitecture) do begin
    if lstArchitecturesAllowed.Checked[Integer(A)] then begin
      Script.Setup.Installer.ArchitecturesAllowed:=
        Script.Setup.Installer.ArchitecturesAllowed + [A];
    end;
  end;
  Script.Setup.Installer.ArchitecturesInstallIn64BitMode:= [];
  for A64:= Low(TJDISArchitecture64) to High(TJDISArchitecture64) do begin
    if lstArchitecturesAllowedIn64BitMode.Checked[Integer(A64)] then begin
      Script.Setup.Installer.ArchitecturesInstallIn64BitMode:=
        Script.Setup.Installer.ArchitecturesInstallIn64BitMode + [A64];
    end;
  end;
  Script.Setup.Installer.MinVersion:= txtMinVersion.Text;
  Script.Setup.Installer.OnlyBelowVersion:= txtOnlyBelowVersion.Text;
end;

procedure TfrmSetupCompiler.SetEditState(const AEditing: Boolean);
begin
  inherited;
  cboASLRCompatible.Enabled:= AEditing;
  cboDEPCompatible.Enabled:= AEditing;
  cboEncryption.Enabled:= AEditing;
  cboMergeDuplicateFiles.Enabled:= AEditing;
  cboTerminalServicesAware.Enabled:= AEditing;
  cboUsedUserAreasWarning.Enabled:= AEditing;
  cboUseSetupLdr.Enabled:= AEditing;
  lstArchitecturesAllowed.Enabled:= AEditing;
  lstArchitecturesAllowedIn64BitMode.Enabled:= AEditing;
  txtMinVersion.ReadOnly:= not AEditing;
  txtOnlyBelowVersion.ReadOnly:= not AEditing;
end;

procedure TfrmSetupCompiler.UpdateActions;
begin
  inherited;

end;

end.
