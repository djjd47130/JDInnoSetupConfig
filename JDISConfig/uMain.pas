unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  System.UITypes,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, JD.InnoSetup,
  Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.CheckLst,
  Vcl.Themes,

  Vcl.Styles.Hooks,
  Vcl.Styles.Utils.Menus,
  Vcl.Styles.Utils.Forms,
  Vcl.Styles.Utils.StdCtrls,
  Vcl.Styles.Utils.ComCtrls,
  Vcl.Styles.Utils.ScreenTips,
  Vcl.Styles.Utils.SysControls,
  Vcl.Styles.Utils.SysStyleHook,

  uDM,
  uTabBase,
  uCollectionBaseNEW,
  uSetupGeneral,
  uSetupAppInfo,
  uSetupVersion,
  uSetupCompiler,
  uItemsDefines,
  uItemsTypes,
  uItemsComponents,
  uItemsTasks,
  uItemsFiles,
  uCode,
  SynEdit, SynEditHighlighter, SynEditCodeFolding,
  SynHighlighterPas, SynHighlighterInno, Vcl.Buttons, System.Actions,
  Vcl.ActnList, Vcl.ActnMan, Vcl.Menus, IDETheme.ActnCtrls,
  Vcl.StdStyleActnCtrls, Vcl.ToolWin;

type
  TfrmMain = class(TForm)
    Script: TJDInnoSetupScript;
    pTop: TPanel;
    btnGenerate: TButton;
    SetupPages: TPageControl;
    tabGeneral: TTabSheet;
    tabCompression: TTabSheet;
    tabCompiler: TTabSheet;
    Pages: TPageControl;
    tabSetup: TTabSheet;
    tabTypes: TTabSheet;
    tabComponents: TTabSheet;
    tabInstaller: TTabSheet;
    tabSignature: TTabSheet;
    tabCosmetic: TTabSheet;
    dlgOpen: TOpenDialog;
    dlgSave: TSaveDialog;
    tabTasks: TTabSheet;
    tabDirs: TTabSheet;
    tabFiles: TTabSheet;
    tabIcons: TTabSheet;
    tabINI: TTabSheet;
    tabInstallDelete: TTabSheet;
    tabLanguages: TTabSheet;
    tabMessages: TTabSheet;
    tabCustomMessages: TTabSheet;
    tabLangOptions: TTabSheet;
    tabRegistry: TTabSheet;
    tabRun: TTabSheet;
    tabUninstallDelete: TTabSheet;
    tabUninstallRun: TTabSheet;
    tabCode: TTabSheet;
    Txt: TSynEdit;
    SynInno: TSynInnoSyn;
    MM: TMainMenu;
    File1: TMenuItem;
    View1: TMenuItem;
    Options1: TMenuItem;
    Help1: TMenuItem;
    New1: TMenuItem;
    Open1: TMenuItem;
    Save1: TMenuItem;
    SaveAs1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    N2: TMenuItem;
    Close1: TMenuItem;
    Acts: TActionManager;
    actNew: TAction;
    actOpen: TAction;
    actSave: TAction;
    actSaveAs: TAction;
    actCloseFile: TAction;
    actExit: TAction;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    tabVersion: TTabSheet;
    tabDiskSlicing: TTabSheet;
    tabWizard: TTabSheet;
    tabUpdate: TTabSheet;
    tabUninstall: TTabSheet;
    tabDefines: TTabSheet;
    tabAppInfo: TTabSheet;
    RefreshScript1: TMenuItem;
    Settings1: TMenuItem;
    About1: TMenuItem;
    N3: TMenuItem;
    HelpContents1: TMenuItem;
    procedure btnGenerateClick(Sender: TObject);
    procedure actSaveAsExecute(Sender: TObject);
    procedure actOpenExecute(Sender: TObject);
    procedure btnSaveSetupGeneralClick(Sender: TObject);
    procedure SetupGeneralChanged(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
    procedure actNewExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure actCloseFileExecute(Sender: TObject);
  private
    FCurFilename: String;
    FModified: Boolean;
    FSetupGeneral: TfrmSetupGeneral;
    FSetupAppInfo: TfrmSetupAppInfo;
    FSetupVersion: TfrmSetupVersion;
    FSetupCompiler: TfrmSetupCompiler;
    FDefines: TfrmDefines;
    FTypes: TfrmTypes;
    FComponents: TfrmComponents;
    FTasks: TfrmTasks;
    FFiles: TfrmFiles;
    FCode: TfrmCode;
    procedure LoadSetup;
    procedure LoadDefines;
    procedure LoadTypes;
    procedure LoadComponents;
    procedure LoadTasks;
    procedure LoadFiles;
    procedure LoadCode;
    procedure EmbedForms;
  public
    procedure ClearUI;
    procedure LoadUI;
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  {$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown:= True;
  {$ENDIF}
  UseLatestCommonDialogs:= True;
  TStyleManager.Engine.RegisterStyleHook(TCustomSynEdit, TScrollingStyleHook);
  Txt.Align:= alClient;
  SetupPages.Align:= alClient;
  EmbedForms;
  Pages.ActivePageIndex:= 0;
  SetupPages.ActivePageIndex:= 0;
  WindowState:= wsMaximized;
end;

procedure TfrmMain.EmbedForms;
begin
  FSetupGeneral:= TfrmSetupGeneral.CreateEmbedded(tabGeneral, Script);
  FSetupAppInfo:= TfrmSetupAppInfo.CreateEmbedded(tabAppInfo, Script);
  FSetupVersion:= TfrmSetupVersion.CreateEmbedded(tabVersion, Script);
  FSetupCompiler:= TfrmSetupCompiler.CreateEmbedded(tabCompiler, Script);

  FDefines:= TfrmDefines.CreateEmbedded(tabDefines, Script, Script.Defines);
  FTypes:= TfrmTypes.CreateEmbedded(tabTypes, Script, Script.Types);
  FComponents:= TfrmComponents.CreateEmbedded(tabComponents, Script, Script.Components);
  FTasks:= TfrmTasks.CreateEmbedded(tabTasks, Script, Script.Tasks);
  FFiles:= TfrmFiles.CreateEmbedded(tabFiles, Script, Script.Files);

  FCode:= TfrmCode.CreateEmbedded(tabCode, Script);
end;

procedure TfrmMain.actCloseFileExecute(Sender: TObject);
begin
  //
end;

procedure TfrmMain.actExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.btnGenerateClick(Sender: TObject);
begin
  {
  Script.Defines.GetItemByName('MyAppName').Value:= txtAppName.Text;
  Script.Defines.GetItemByName('MyAppVersion').Value:= txtAppVersion.Text;
  Script.Defines.GetItemByName('MyAppPublisher').Value:= txtAppPublisher.Text;
  Script.Defines.GetItemByName('MyAppURL').Value:= txtAppURL.Text;
  Script.Setup.Installer.AppId:= txtAppID.Text;
  Script.Setup.Compiler.OutputBaseFilename:= txtOutputBaseFilename.Text;
  Script.Setup.Compiler.OutputDir:= txtOutputDir.Text;
  }

  Txt.Lines.BeginUpdate;
  try
    Script.GetScript(Txt.Lines);
  finally
    Txt.Lines.EndUpdate;
  end;
end;

procedure TfrmMain.actNewExecute(Sender: TObject);
begin
  //TODO: Prompt to create a new file...

end;

procedure TfrmMain.actOpenExecute(Sender: TObject);
var
  Stream2: TFileStream;
  Stream1: TMemoryStream;
begin
  if dlgOpen.Execute then begin
    Stream1:= TMemoryStream.Create;
    Stream2 := TFileStream.Create(dlgOpen.FileName, fmOpenRead);
    try
      Stream2.Position:= 0;
      ObjectTextToBinary(Stream2, Stream1);
      Stream2.Position:= 0;
      Stream1.Position:= 0;
      Stream1.ReadComponent(Script);
    finally
      Stream2.Free;
      Stream1.Free;
    end;
    LoadUI;
    FCurFilename:= dlgOpen.FileName;
    FModified:= False;
  end;
end;

procedure TfrmMain.actSaveAsExecute(Sender: TObject);
var
  Stream2: TFileStream;
  Stream1: TMemoryStream;
begin
  if dlgSave.Execute then begin
    Stream1 := TMemoryStream.Create;
    Stream2 := TFileStream.Create(dlgSave.FileName, fmCreate);
    try
      Stream1.WriteComponent(Script);
      Stream1.Position := 0;
      ObjectBinaryToText(Stream1, Stream2);
    finally
      Stream1.Free;
      Stream2.Free;
    end;
  end;
end;

procedure TfrmMain.actSaveExecute(Sender: TObject);
begin
  //
end;

procedure TfrmMain.btnSaveSetupGeneralClick(Sender: TObject);
begin
  {
  Script.Defines.GetItemByName('MyAppName').Value:= txtAppName.Text;
  Script.Defines.GetItemByName('MyAppVersion').Value:= txtAppVersion.Text;
  Script.Defines.GetItemByName('MyAppPublisher').Value:= txtAppPublisher.Text;
  Script.Defines.GetItemByName('MyAppURL').Value:= txtAppURL.Text;
  Script.Setup.Installer.AppId:= txtAppID.Text;
  Script.Setup.Compiler.OutputBaseFilename:= txtOutputBaseFilename.Text;
  Script.Setup.Compiler.OutputDir:= txtOutputDir.Text;
  }

  //btnSaveSetupGeneral.Enabled:= False;

end;

procedure TfrmMain.ClearUI;
begin



end;

procedure TfrmMain.LoadUI;
var
  X: Integer;
  T: TTabSheet;
  F: TfrmTabBase;
begin
  ClearUI;

  for X := 0 to Pages.PageCount-1 do begin
    T:= TTabSheet(Pages.Pages[X]);
    if T.Tag = 1 then begin
      F:= TfrmTabBase(T.Components[0]);
      if Assigned(F) then begin
        F.Load;
      end;
    end;
  end;

  for X := 0 to SetupPages.PageCount-1 do begin
    T:= TTabSheet(SetupPages.Pages[X]);
    if T.Tag = 1 then begin
      F:= TfrmTabBase(T.Components[0]);
      if Assigned(F) then begin
        F.Load;
      end;
    end;
  end;

end;

procedure TfrmMain.SetupGeneralChanged(Sender: TObject);
begin
  //btnSaveSetupGeneral.Enabled:= True;
end;

procedure TfrmMain.LoadCode;
begin
  FCode.Load;
end;

procedure TfrmMain.LoadComponents;
begin
  FComponents.PopulateList;
end;

procedure TfrmMain.LoadDefines;
begin
  FDefines.PopulateList;
end;

procedure TfrmMain.LoadFiles;
begin
  FFiles.PopulateList;
end;

procedure TfrmMain.LoadSetup;
begin
  FSetupGeneral.Load;
  FSetupAppInfo.Load;
  FSetupVersion.Load;
  FSetupCompiler.Load;

end;

procedure TfrmMain.LoadTasks;
begin
  FTasks.PopulateList;
end;

procedure TfrmMain.LoadTypes;
begin
  FTypes.PopulateList;
end;

end.
