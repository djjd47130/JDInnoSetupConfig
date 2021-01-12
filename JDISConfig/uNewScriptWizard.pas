unit uNewScriptWizard;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls,
  JD.Ctrls.FontButton, Vcl.StdCtrls;

const
  PAGE_WELCOME = 0;
  PAGE_APP_INFO = 1;
  PAGE_APP_TYPE = 2;
  PAGE_APP_FOLDER = 3;
  PAGE_APP_FILES = 4;
  PAGE_SHORTCUTS = 5;
  PAGE_DOCS = 6;
  PAGE_INST_MODE = 7;
  PAGE_LANGUAGES = 8;
  PAGE_COMPILER = 9;
  PAGE_FINISHED = 10;

type
  TfrmNewScriptWizard = class(TForm)
    Panel1: TPanel;
    Pages: TPageControl;
    Panel2: TPanel;
    tabWelcome: TTabSheet;
    tabAppInfo: TTabSheet;
    tabAppType: TTabSheet;
    tabAppFolder: TTabSheet;
    tabAppFiles: TTabSheet;
    tabShortcuts: TTabSheet;
    tabDocs: TTabSheet;
    tabInstallMode: TTabSheet;
    tabLanguages: TTabSheet;
    tabCompiler: TTabSheet;
    tabFinished: TTabSheet;
    btnCancel: TFontButton;
    btnNext: TFontButton;
    btnBack: TFontButton;
    lblTitle: TLabel;
    lblSubtitle: TLabel;
    chkEmpty: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure PagesChanging(Sender: TObject; var AllowChange: Boolean);
    procedure PagesChange(Sender: TObject);
  private
    function ShouldSkip(const APageID: Integer): Boolean;
    function PageTitle(const APageID: Integer): String;
    function PageSubtitle(const APageID: Integer): String;
    function CurPageID: Integer;
  public
    { Public declarations }
  end;

var
  frmNewScriptWizard: TfrmNewScriptWizard;

implementation

{$R *.dfm}

procedure TfrmNewScriptWizard.FormCreate(Sender: TObject);
var
  X: Integer;
begin
  Pages.Align:= alClient;

  for X := 0 to Pages.PageCount-1 do
    Pages.Pages[X].TabVisible:= False;
  Pages.ActivePageIndex:= PAGE_WELCOME;
  PagesChange(Pages);
end;

procedure TfrmNewScriptWizard.btnCancelClick(Sender: TObject);
begin
  Close;
end;

function TfrmNewScriptWizard.CurPageID: Integer;
begin
  Result:= Pages.ActivePage.PageIndex;
end;

procedure TfrmNewScriptWizard.btnBackClick(Sender: TObject);
begin
  //TODO: Prior page

  Pages.ActivePageIndex:= Pages.ActivePageIndex - 1;
  PagesChange(Pages);

  case CurPageID of
    PAGE_WELCOME:     ;
    PAGE_APP_INFO:    ;
    PAGE_APP_TYPE:    ;
    PAGE_APP_FOLDER:  ;
    PAGE_APP_FILES:   ;
    PAGE_SHORTCUTS:   ;
    PAGE_DOCS:        ;
    PAGE_INST_MODE:   ;
    PAGE_LANGUAGES:   ;
    PAGE_COMPILER:    ;
    PAGE_FINISHED:    ;
  end;
end;

procedure TfrmNewScriptWizard.btnNextClick(Sender: TObject);
begin
  //TODO: Next page

  Pages.ActivePageIndex:= Pages.ActivePageIndex + 1;
  PagesChange(Pages);

  case CurPageID of
    PAGE_WELCOME:     ;
    PAGE_APP_INFO:    ;
    PAGE_APP_TYPE:    ;
    PAGE_APP_FOLDER:  ;
    PAGE_APP_FILES:   ;
    PAGE_SHORTCUTS:   ;
    PAGE_DOCS:        ;
    PAGE_INST_MODE:   ;
    PAGE_LANGUAGES:   ;
    PAGE_COMPILER:    ;
    PAGE_FINISHED:    ;
  end;
end;

procedure TfrmNewScriptWizard.PagesChange(Sender: TObject);
begin
  lblTitle.Caption:= Self.PageTitle(CurPageID);
  lblSubtitle.Caption:= Self.PageSubtitle(CurPageID);

  //Buttons
  btnBack.Enabled:= CurPageID > PAGE_WELCOME;
  btnNext.Enabled:= CurPageID < PAGE_FINISHED;

  case CurPageID of
    PAGE_WELCOME:     ;
    PAGE_APP_INFO:    ;
    PAGE_APP_TYPE:    ;
    PAGE_APP_FOLDER:  ;
    PAGE_APP_FILES:   ;
    PAGE_SHORTCUTS:   ;
    PAGE_DOCS:        ;
    PAGE_INST_MODE:   ;
    PAGE_LANGUAGES:   ;
    PAGE_COMPILER:    ;
    PAGE_FINISHED:    ;
  end;
end;

procedure TfrmNewScriptWizard.PagesChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  //
end;

function TfrmNewScriptWizard.ShouldSkip(const APageID: Integer): Boolean;
begin
  Result:= False;
  case APageID of
    PAGE_WELCOME:     ;
    PAGE_APP_INFO:    ;
    PAGE_APP_TYPE:    ;
    PAGE_APP_FOLDER:  ;
    PAGE_APP_FILES:   ;
    PAGE_SHORTCUTS:   ;
    PAGE_DOCS:        ;
    PAGE_INST_MODE:   ;
    PAGE_LANGUAGES:   ;
    PAGE_COMPILER:    ;
    PAGE_FINISHED:    ;
  end;
end;

function TfrmNewScriptWizard.PageTitle(const APageID: Integer): String;
begin
  Result:= '';
  case APageID of
    PAGE_WELCOME:     Result:= 'Create New Script Config';
    PAGE_APP_INFO:    Result:= '';
    PAGE_APP_TYPE:    Result:= '';
    PAGE_APP_FOLDER:  Result:= '';
    PAGE_APP_FILES:   Result:= '';
    PAGE_SHORTCUTS:   Result:= '';
    PAGE_DOCS:        Result:= '';
    PAGE_INST_MODE:   Result:= '';
    PAGE_LANGUAGES:   Result:= '';
    PAGE_COMPILER:    Result:= '';
    PAGE_FINISHED:    Result:= '';
  end;
end;

function TfrmNewScriptWizard.PageSubtitle(const APageID: Integer): String;
begin
  Result:= '';
  case APageID of
    PAGE_WELCOME:     Result:= '';
    PAGE_APP_INFO:    Result:= '';
    PAGE_APP_TYPE:    Result:= '';
    PAGE_APP_FOLDER:  Result:= '';
    PAGE_APP_FILES:   Result:= '';
    PAGE_SHORTCUTS:   Result:= '';
    PAGE_DOCS:        Result:= '';
    PAGE_INST_MODE:   Result:= '';
    PAGE_LANGUAGES:   Result:= '';
    PAGE_COMPILER:    Result:= '';
    PAGE_FINISHED:    Result:= '';
  end;
end;

end.
