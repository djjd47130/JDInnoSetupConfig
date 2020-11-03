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

  uSetupGeneral,
  uSetupAppInfo,
  uSetupVersion,
  uSetupCompiler,
  uItemsDefines,
  uItemsTypes,
  uItemsComponents,
  uItemsTasks,
  uItemsDirs,
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
    procedure btnGenerateClick(Sender: TObject);
    procedure actSaveAsExecute(Sender: TObject);
    procedure actOpenExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
    procedure actNewExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    FCurFilename: String;
    FSetupGeneral: TfrmSetupGeneral;
    FSetupAppInfo: TfrmSetupAppInfo;
    FSetupVersion: TfrmSetupVersion;
    FSetupCompiler: TfrmSetupCompiler;
    FDefines: TfrmDefines;
    FTypes: TfrmTypes;
    FComponents: TfrmComponents;
    FTasks: TfrmTasks;
    FDirs: TfrmDirs;
    FFiles: TfrmFiles;
    FCode: TfrmCode;
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
  SetupPages.Align:= alClient;
  EmbedForms;
  Pages.ActivePageIndex:= 0;
  SetupPages.ActivePageIndex:= 0;
  WindowState:= wsMaximized;
  UpdateUI;
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

  EC(TfrmDefines, tabDefines, Script.Defines);
  EC(TfrmTypes, tabTypes, Script.Types);
  EC(TfrmComponents, tabComponents, Script.Components);
  EC(TfrmTasks, tabTasks, Script.Tasks);
  EC(TfrmDirs, tabDirs, Script.Dirs);
  EC(TfrmFiles, tabFiles, Script.Files);

  ET(TfrmCode, tabCode);
end;

procedure TfrmMain.TabBaseChanged(Sender: TObject);
begin
  UpdateUI;
end;

procedure TfrmMain.actExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.btnGenerateClick(Sender: TObject);
begin
  Txt.Lines.BeginUpdate;
  try
    Script.GetScript(Txt.Lines);
  finally
    Txt.Lines.EndUpdate;
  end;
  UpdateUI;
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

    end;
  end;

  UpdateUI;
end;

procedure TfrmMain.actOpenExecute(Sender: TObject);
var
  Stream2: TFileStream;
  Stream1: TMemoryStream;
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
      SetAllModified(False);
    end;
  end;

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
    Stream1.Free;
    Stream2.Free;
  end;
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
  Result:= 'JD Inno Setup Config - ';
  if FCurFilename <> '' then begin
    Result:= Result + ExtractFileName(FCurFilename);
  end else begin
    Result:= Result + '(Unsaved File)';
  end;
end;

procedure TfrmMain.ClearUI;
begin

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
