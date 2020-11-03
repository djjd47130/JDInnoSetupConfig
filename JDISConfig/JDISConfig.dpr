program JDISConfig;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {frmMain},
  uDM in 'uDM.pas' {DM: TDataModule},
  uItemsTypes in 'uItemsTypes.pas' {frmTypes},
  uItemsComponents in 'uItemsComponents.pas' {frmComponents},
  Vcl.Themes,
  Vcl.Styles,
  uItemsFiles in 'uItemsFiles.pas' {frmFiles},
  uItemsTasks in 'uItemsTasks.pas' {frmTasks},
  IDETheme.ActnCtrls in 'IDETheme.ActnCtrls.pas',
  uItemsDefines in 'uItemsDefines.pas' {frmDefines},
  uTabBase in 'uTabBase.pas' {frmTabBase},
  uCollectionBase in 'uCollectionBase.pas' {frmCollectionBase},
  uSetupGeneral in 'uSetupGeneral.pas' {frmSetupGeneral},
  uSetupAppInfo in 'uSetupAppInfo.pas' {frmSetupAppInfo},
  uSetupVersion in 'uSetupVersion.pas' {frmSetupVersion},
  uSetupCompiler in 'uSetupCompiler.pas' {frmSetupCompiler},
  uCode in 'uCode.pas' {frmCode},
  uItemsDirs in 'uItemsDirs.pas' {frmDirs};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'JD Inno Setup Config';
  TStyleManager.TrySetStyle('Windows10 Dark');
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
