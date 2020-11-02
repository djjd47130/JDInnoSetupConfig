unit uItemsTypes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCollectionBaseNEW, System.Actions,
  Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls,
  JD.InnoSetup, JD.InnoSetup.Common,
  Vcl.StdCtrls, Vcl.CheckLst;

type
  TfrmTypes = class(TfrmCollectionBaseNEW)
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    txtTypeName: TEdit;
    txtTypeDescription: TEdit;
    lstTypeFlags: TCheckListBox;
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
  frmTypes: TfrmTypes;

implementation

{$R *.dfm}

{ TfrmTypes }

constructor TfrmTypes.CreateEmbedded(AOwner: TWinControl;
  AScript: TJDInnoSetupScript; ACollection: TJDISBaseCollection);
begin
  inherited;

end;

procedure TfrmTypes.PrepareColumns(AColumns: TListColumns);
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
  AC('Type Name', 200);
  AC('Description', 200);
  AC('Flags', 200);
end;

procedure TfrmTypes.GetListItemDetails(AItem: TJDISBaseCollectionItem;
  AListItem: TListItem);
var
  I: TJDISType;
begin
  inherited;
  I:= TJDISType(AItem);
  AListItem.Caption:= I.Name;
  AListItem.SubItems.Add(I.Description);
  AListItem.SubItems.Add(I.FlagsStr);
end;

function TfrmTypes.IsValid: Boolean;
begin
  Result:= (txtTypeName.Text <> '') and (txtTypeDescription.Text <> '');
end;

procedure TfrmTypes.SetEditState(const AEditing: Boolean);
begin
  inherited;
  txtTypeName.ReadOnly:= not AEditing;
  txtTypeDescription.ReadOnly:= not AEditing;
  lstTypeFlags.Enabled:= AEditing;
end;

procedure TfrmTypes.ClearDetail;
var
  X: Integer;
begin
  inherited;
  txtTypeName.Text:= '';
  txtTypeDescription.Text:= '';
  for X := 0 to lstTypeFlags.Count-1 do begin
    lstTypeFlags.Checked[X]:= False;
  end;
end;

procedure TfrmTypes.LoadItemDetail(AItem: TJDISBaseCollectionItem);
var
  I: TJDISType;
  F: TJDISTypeFlag;
begin
  inherited;
  if Assigned(AItem) then begin
    I:= TJDISType(AItem);
    txtTypeName.Text:= I.Name;
    txtTypeDescription.Text:= I.Description;
    for F:= Low(TJDISTypeFlag) to High(TJDISTypeFlag) do begin
      if F in I.Flags then begin
        lstTypeFlags.Checked[Integer(F)]:= True;
      end;
    end;
  end;
end;

procedure TfrmTypes.SaveItemDetail(AItem: TJDISBaseCollectionItem);
var
  I: TJDISType;
  F: TJDISTypeFlag;
begin
  inherited;
  I:= TJDISType(AItem);
  I.Name:= txtTypeName.Text;
  I.Description:= txtTypeDescription.Text;
  I.Flags:= [];
  for F:= Low(TJDISTypeFlag) to High(TJDISTypeFlag) do begin
    if lstTypeFlags.Checked[Integer(F)] then begin
      I.Flags:= I.Flags + [F];
    end;
  end;
end;

end.
