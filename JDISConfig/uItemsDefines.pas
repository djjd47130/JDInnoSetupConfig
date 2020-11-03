unit uItemsDefines;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCollectionBase, System.Actions,
  Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls, Vcl.StdCtrls,
  JD.InnoSetup, JD.InnoSetup.Common;

type
  TfrmDefines = class(TfrmCollectionBase)
    Label9: TLabel;
    Label10: TLabel;
    txtName: TEdit;
    txtValue: TEdit;
  private
    { Private declarations }
  public
    constructor CreateEmbedded(AOwner: TWinControl; AScript: TJDInnoSetupScript;
      ACollection: TJDISBaseCollection); override;
    procedure PrepareColumns(AColumns: TListColumns); override;
    procedure ClearDetail; override;
    procedure SetEditState(const AEditing: Boolean); override;
    procedure GetListItemDetails(AItem: TJDISBaseCollectionItem;
      AListItem: TListItem); override;
    function IsValid: Boolean; override;
    procedure LoadItemDetail(AItem: TJDISBaseCollectionItem); override;
    procedure SaveItemDetail(AItem: TJDISBaseCollectionItem); override;
  end;

var
  frmDefines: TfrmDefines;

implementation

{$R *.dfm}

{ TfrmDefines }

constructor TfrmDefines.CreateEmbedded(AOwner: TWinControl;
  AScript: TJDInnoSetupScript; ACollection: TJDISBaseCollection);
begin
  inherited;

end;

procedure TfrmDefines.PrepareColumns(AColumns: TListColumns);
  procedure AC(const ACaption: String; AWidth: Integer);
  var
    C: TListColumn;
  begin
    C:= AColumns.Add;
    C.Caption:= ACaption;
    C.Width:= AWidth;
  end;
begin
  AColumns.Clear;
  AC('Define Name', 200);
  AC('Value', 300);
end;

procedure TfrmDefines.GetListItemDetails(AItem: TJDISBaseCollectionItem;
  AListItem: TListItem);
var
  I: TJDISDefine;
begin
  inherited;
  I:= TJDISDefine(AItem);
  AListItem.Caption:= I.Name;
  AListItem.SubItems.Add(I.Value);
end;

function TfrmDefines.IsValid: Boolean;
begin
  Result:= (txtName.Text <> '');
end;

procedure TfrmDefines.ClearDetail;
begin
  inherited;
  txtName.Text:= '';
  txtValue.Text:= '';
end;

procedure TfrmDefines.LoadItemDetail(AItem: TJDISBaseCollectionItem);
var
  I: TJDISDefine;
begin
  inherited;
  I:= TJDISDefine(AItem);
  txtName.Text:= I.Name;
  txtValue.Text:= I.Value;
end;

procedure TfrmDefines.SaveItemDetail(AItem: TJDISBaseCollectionItem);
var
  I: TJDISDefine;
begin
  inherited;
  I:= TJDISDefine(AItem);
  I.Name:= txtName.Text;
  I.Value:= txtValue.Text;
  GetListItemDetails(I, Items.Selected);
end;

procedure TfrmDefines.SetEditState(const AEditing: Boolean);
begin
  inherited;
  txtName.ReadOnly:= not AEditing;
  txtValue.ReadOnly:= not AEditing;
end;

end.
