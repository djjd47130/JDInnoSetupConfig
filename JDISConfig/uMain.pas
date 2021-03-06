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
  uCollectionBase,

  uSettings,

  uSetupGeneral,
  uSetupAppInfo,
  uSetupVersion,
  uSetupCompiler,
  uSetupInstaller,

  uItemsDefines,
  uItemsTypes,
  uItemsComponents,
  uItemsTasks,
  uItemsDirs,
  uItemsFiles,
  uItemsIcons,
  uItemsRegistry,
  uCode,

  uNewScriptWizard,

  JD.CmdLine,

  SynEdit, SynEditHighlighter, SynEditCodeFolding,
  SynHighlighterPas, SynHighlighterInno, Vcl.Buttons, System.Actions,
  Vcl.ActnList, Vcl.ActnMan, Vcl.Menus, IDETheme.ActnCtrls,
  Vcl.StdStyleActnCtrls, Vcl.ToolWin;

type
  TfrmMain = class(TForm)
    Script: TJDInnoSetupScript;
    pTop: TPanel;
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
    Acts: TActionManager;
    actNew: TAction;
    actOpen: TAction;
    actSave: TAction;
    actSaveAs: TAction;
    actExit: TAction;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
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
    ToolButton6: TToolButton;
    actGenerate: TAction;
    ToolButton7: TToolButton;
    N4: TMenuItem;
    GenerateScript1: TMenuItem;
    actSettings: TAction;
    ToolButton8: TToolButton;
    procedure actGenerateExecute(Sender: TObject);
    procedure actSaveAsExecute(Sender: TObject);
    procedure actOpenExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
    procedure actNewExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure actSettingsExecute(Sender: TObject);
  private
    FCurFilename: String;
    procedure EmbedForms;
    function DoSave: Boolean;
    function DoSaveAs: Boolean;
    function SaveFile(const AFilename: String): Boolean;
    procedure UpdateUI;
    function FormTitle: String;
    function PromptSave: Boolean;
    procedure SetAllModified(const AValue: Boolean);
    function GetAnyModified: Boolean;
    procedure TabBaseChanged(Sender: TObject);
    procedure ProcessOpenFile;
    procedure OpenFile(const AFilename: String);
    function DoNewFile: Boolean;
  public
    procedure ClearUI;
    procedure LoadUI;
    function IsEditing: Boolean;
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
  Pages.Align:= alClient;
  SetupPages.Align:= alClient;
  EmbedForms;
  Pages.ActivePageIndex:= 0;
  SetupPages.ActivePageIndex:= 0;
  Width:= 1100;
  Height:= 850;
  //WindowState:= wsMaximized;
  UpdateUI;
  ProcessOpenFile;

end;

procedure TfrmMain.EmbedForms;
  procedure ET(AClass: TfrmTabBaseClass; ATab: TTabSheet);
  var
    F: TfrmTabBase;
  begin
    F:= AClass.CreateEmbedded(ATab, Script);
    F.OnChanged:= TabBaseChanged;
  end;
  procedure EC(AClass: TfrmCollectionBaseClass;ATab: TTabSheet;
    AColl: TJDISBaseCollection);
  var
    F: TfrmCollectionBase;
  begin
    F:= AClass.CreateEmbedded(ATab, Script, AColl);
    F.OnChanged:= TabBaseChanged;
  end;
begin
  ET(TfrmSetupGeneral, tabGeneral);
  ET(TfrmSetupAppInfo, tabAppInfo);
  ET(TfrmSetupVersion, tabVersion);
  ET(TfrmSetupCompiler, tabCompiler);
  ET(TfrmSetupInstaller, tabInstaller);

  EC(TfrmDefines, tabDefines, Script.Defines);
  EC(TfrmTypes, tabTypes, Script.Types);
  EC(TfrmComponents, tabComponents, Script.Components);
  EC(TfrmTasks, tabTasks, Script.Tasks);
  EC(TfrmDirs, tabDirs, Script.Dirs);
  EC(TfrmFiles, tabFiles, Script.Files);
  EC(TfrmIcons, tabIcons, Script.Icons);
  EC(TfrmRegistry, tabRegistry, Script.Registry);

  ET(TfrmCode, tabCode);
end;

procedure TfrmMain.ProcessOpenFile;
var
  C: TCmdLine;
begin
  C:= TCmdLine.Create;
  try
    C.AsString:= GetCommandLine;
    if C.OpenFilename <> '' then begin
      OpenFile(C.OpenFilename);
    end;
  finally
    C.Free;
  end;
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if IsEditing then begin
    CanClose:= False;
    MessageDlg('Cannot close file because you are currently in edit mode. Save or cancel your changes first.',
      mtError, [mbOK], 0);
  end else begin
    if GetAnyModified then begin
      CanClose:= PromptSave;
    end;
  end;
  UpdateUI;
end;

function TfrmMain.PromptSave: Boolean;
begin
  case MessageDlg('Would you like to save your changes?',
    mtConfirmation, [mbYes,mbNo,mbCancel], 0) of
    mrYes: begin
      //Save changes
      Result:= DoSave;
    end;
    mrNo: begin
      //Abort changes
      Result:= True;
    end;
    else begin
      //User cancelled
      Result:= False;
    end;
  end;
  UpdateUI;
end;

procedure TfrmMain.TabBaseChanged(Sender: TObject);
begin
  actGenerate.Execute;
  UpdateUI;
end;

procedure TfrmMain.actExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.actGenerateExecute(Sender: TObject);
begin
  Txt.Lines.BeginUpdate;
  try
    Script.GetScript(Txt.Lines);
  finally
    Txt.Lines.EndUpdate;
  end;
  UpdateUI;
end;

function TfrmMain.DoNewFile: Boolean;
var
  F: TfrmNewScriptWizard;
begin
  Result:= False;
  F:= TfrmNewScriptWizard.Create(nil);
  try
    if F.ShowModal = mrOK then begin

      //TODO: Read input of wizard and prepare new script config...




      Result:= True;
    end;
  finally
    F.Free;
  end;
end;

procedure TfrmMain.actNewExecute(Sender: TObject);
var
  C: Boolean;
begin
  //Detect if editing or modified first...
  if IsEditing then begin
    C:= False;
    MessageDlg('Cannot close file because you are currently in edit mode. Save or cancel your changes first.',
      mtError, [mbOK], 0);
  end else begin
    if GetAnyModified then begin
      C:= PromptSave;
    end else begin
      C:= True;
    end;
  end;

  if C then begin
    if MessageDlg('Are you sure you would like to create a new file?',
      mtConfirmation, [mbYes,mbNo], 0) = mrYes then
    begin
      //TODO
      DoNewFile;
    end;
  end;

  actGenerate.Execute;
  UpdateUI;
end;

procedure TfrmMain.actOpenExecute(Sender: TObject);
var
  C: Boolean;
begin
  //Detect if editing or modified first...
  if IsEditing then begin
    C:= False;
    MessageDlg('Cannot close file because you are currently in edit mode. Save or cancel your changes first.',
      mtError, [mbOK], 0);
  end else begin
    if GetAnyModified then begin
      C:= PromptSave;
    end else begin
      C:= True;
    end;
  end;

  if C then begin
    if dlgOpen.Execute = True then begin
      OpenFile(dlgOpen.FileName);
    end;
  end;

  UpdateUI;
end;

procedure TfrmMain.OpenFile(const AFilename: String);
var
  Stream2: TFileStream;
  Stream1: TMemoryStream;
begin
  Stream1:= TMemoryStream.Create;
  Stream2 := TFileStream.Create(AFilename, fmOpenRead);
  try
    Stream2.Position:= 0;
    ObjectTextToBinary(Stream2, Stream1);
    Stream2.Position:= 0;
    Stream1.Position:= 0;
    Stream1.ReadComponent(Script);
  finally
    FreeAndNil(Stream2);
    FreeAndNil(Stream1);
  end;
  LoadUI;
  FCurFilename:= AFilename;
  SetAllModified(False);

  actGenerate.Execute;
  UpdateUI;
end;

procedure TfrmMain.actSaveAsExecute(Sender: TObject);
begin
  DoSaveAs;

  UpdateUI;
end;

procedure TfrmMain.actSaveExecute(Sender: TObject);
begin
  DoSave;

  UpdateUI;
end;

procedure TfrmMain.actSettingsExecute(Sender: TObject);
var
  F: TfrmSettings;
begin
  F:= TfrmSettings.Create(Self);
  try
    F.LoadSettings;
    if F.ShowModal = mrOK then begin
      F.SaveSettings;
    end;
  finally
    F.Free;
  end;
end;

function TfrmMain.SaveFile(const AFilename: String): Boolean;
var
  Stream2: TFileStream;
  Stream1: TMemoryStream;
begin
  Stream1 := TMemoryStream.Create;
  Stream2 := TFileStream.Create(AFilename, fmCreate);
  try
    Stream1.WriteComponent(Script);
    Stream1.Position := 0;
    ObjectBinaryToText(Stream1, Stream2);
    Result:= True;
    FCurFilename:= AFilename;
      SetAllModified(False);
  finally
    FreeAndNil(Stream1);
    FreeAndNil(Stream2);
  end;

  actGenerate.Execute;
  UpdateUI;
end;

function TfrmMain.DoSave: Boolean;
begin
  if FCurFilename = '' then begin
    Result:= DoSaveAs;
  end else begin
    Result:= SaveFile(FCurFilename);
  end;
  UpdateUI;
end;

function TfrmMain.DoSaveAs: Boolean;
begin
  if Self.FCurFilename <> '' then begin
    dlgSave.InitialDir:= ExtractFilePath(FCurFilename);
    dlgSave.FileName:= ExtractFileName(FCurFilename);
  end else begin
    dlgSave.InitialDir:= '';
    dlgSave.FileName:= 'Untitled.jdis';
  end;
  if dlgSave.Execute = True then begin
    Result:= SaveFile(dlgSave.FileName);
  end else begin
    Result:= False;
  end;
  UpdateUI;
end;

procedure TfrmMain.UpdateUI;
begin
  Caption:= FormTitle;
  actSave.Enabled:= GetAnyModified;
end;

function TfrmMain.FormTitle: String;
begin
  if FCurFilename <> '' then begin
    Result:= ExtractFileName(FCurFilename);
  end else begin
    Result:= 'Untitled.jdis';
  end;
  Result:= Result + ' - JD Inno Setup Configurator';
  if Self.GetAnyModified then
    Result:= '*' + Result;
end;

procedure TfrmMain.ClearUI;
begin

  actGenerate.Execute;
  UpdateUI;
end;

procedure TfrmMain.SetAllModified(const AValue: Boolean);
var
  X: Integer;
  T: TTabSheet;
  F: TfrmTabBase;
begin
  for X := 0 to Pages.PageCount-1 do begin
    T:= TTabSheet(Pages.Pages[X]);
    if T.Tag = 1 then begin
      F:= TfrmTabBase(T.Components[0]);
      if Assigned(F) then begin
        F.Modified:= AValue;
      end;
    end;
  end;

  for X := 0 to SetupPages.PageCount-1 do begin
    T:= TTabSheet(SetupPages.Pages[X]);
    if T.Tag = 1 then begin
      F:= TfrmTabBase(T.Components[0]);
      if Assigned(F) then begin
        F.Modified:= AValue;
      end;
    end;
  end;

end;

function TfrmMain.GetAnyModified: Boolean;
var
  X: Integer;
  T: TTabSheet;
  F: TfrmTabBase;
begin
  Result:= False;
  for X := 0 to Pages.PageCount-1 do begin
    if Result then Break;
    T:= TTabSheet(Pages.Pages[X]);
    if T.Tag = 1 then begin
      F:= TfrmTabBase(T.Components[0]);
      if Assigned(F) then begin
        Result:= F.Modified;
      end;
    end;
  end;

  for X := 0 to SetupPages.PageCount-1 do begin
    if Result then Break;
    T:= TTabSheet(SetupPages.Pages[X]);
    if T.Tag = 1 then begin
      F:= TfrmTabBase(T.Components[0]);
      if Assigned(F) then begin
        Result:= F.Modified;
      end;
    end;
  end;
end;

function TfrmMain.IsEditing: Boolean;
var
  X: Integer;
  T: TTabSheet;
  F: TfrmTabBase;
begin
  Result:= False;
  for X := 0 to Pages.PageCount-1 do begin
    if Result then Break;
    T:= TTabSheet(Pages.Pages[X]);
    if T.Tag = 1 then begin
      F:= TfrmTabBase(T.Components[0]);
      if Assigned(F) then begin
        Result:= F.Editing;
      end;
    end;
  end;

  for X := 0 to SetupPages.PageCount-1 do begin
    if Result then Break;
    T:= TTabSheet(SetupPages.Pages[X]);
    if T.Tag = 1 then begin
      F:= TfrmTabBase(T.Components[0]);
      if Assigned(F) then begin
        Result:= F.Editing;
      end;
    end;
  end;

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

end.
