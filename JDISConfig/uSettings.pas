unit uSettings;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.CategoryButtons,
  uDM, Vcl.StdCtrls, Vcl.ButtonGroup, JD.Ctrls.FontButton, Vcl.ExtCtrls,
  Vcl.ComCtrls;

type
  TfrmSettings = class(TForm)
    pMenu: TPanel;
    FontButton1: TFontButton;
    FontButton2: TFontButton;
    FontButton3: TFontButton;
    FontButton4: TFontButton;
    FontButton5: TFontButton;
    Pages: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    procedure MenuButtonClick(Sender: TObject);
  private
    procedure DeselectMenu;
    { Private declarations }
  public
    procedure LoadSettings;
    procedure SaveSettings;
  end;

var
  frmSettings: TfrmSettings;

implementation

{$R *.dfm}

{ TfrmSettings }

procedure TfrmSettings.LoadSettings;
begin

end;

procedure TfrmSettings.SaveSettings;
begin

end;

procedure TfrmSettings.DeselectMenu;
var
  X: Integer;
  B: TFontButton;
begin
  for X := 0 to pMenu.ControlCount-1 do begin
    if pMenu.Controls[X] is TFontButton then begin
      B:= TFontButton(pMenu.Controls[X]);
      B.DrawStyle:= fdHybrid;
    end;
  end;
end;

procedure TfrmSettings.MenuButtonClick(Sender: TObject);
var
  B: TFontButton;
begin
  DeselectMenu;
  B:= TFontButton(Sender);
  B.DrawStyle:= fdThemed;
  Pages.ActivePageIndex:= B.Tag;
end;

end.
