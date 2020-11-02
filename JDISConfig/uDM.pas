unit uDM;

interface

uses
  Winapi.Windows, Vcl.Graphics,
  System.SysUtils, System.Classes, JD.Ctrls.FontButton, JD.Graphics,
  System.ImageList, Vcl.ImgList, Vcl.Controls;

type
  TDM = class(TDataModule)
    Img24: TImageList;
    Glyphs: TRMProFontGlyphs;
    Img16: TImageList;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  JD.Ctrls.FontButton.ColorManager.BaseColor:= clBlack;
end;

end.
